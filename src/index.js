/* =========================================

	User Config

========================================= */

const disableExecuteOnKey = true




/* =========================================

	Node Imports

========================================= */

import './sass/style.scss'

const { LuaFactory } = require('wasmoon') // Lua parse and interop
// Init wasmoon Lua parser/interop
const factory = new LuaFactory('https://unpkg.com/wasmoon@1.14.1/dist/glue.wasm')
const luamin = require('luamin') // Lua minifier

import 'ace-builds/src-noconflict/ace' // Ace editor
import 'ace-builds/src-noconflict/mode-lua' // Ace editor Lua mode syntax highlight
import 'ace-builds/src-noconflict/theme-ambiance' // Ace editor theme

// this fixes a 404 with the lua worker looking in the wrong place
import luaWorkerUrl from 'file-loader!ace-builds/src-noconflict/worker-lua'
ace.config.setModuleUrl('ace/mode/lua_worker', luaWorkerUrl)




/* =========================================

	Ace Editor Configuration

========================================= */

// init editor
const editor = ace.edit('editor-init')

// editor configurations
editor.setShowPrintMargin(false)
editor.setTheme('ace/theme/ambiance')
editor.setHighlightActiveLine(false)
editor.setOption('cursorStyle', 'ace')
document.getElementById('editor-init').style.fontSize = '16px'

// lua syntax highlight mode
const luaMode = ace.require('ace/mode/lua').Mode
editor.session.setMode(new luaMode())

// starting example code
import startCode from './lua-imports/start-code.lua'
editor.insert(startCode)




/* =========================================

	Vars

========================================= */

const layoutResultContainer = document.getElementById('layout-result')
const controlMapSize = document.getElementById('control-map-size')
const controlMps = document.getElementById('control-mps')
const gridMarquee = document.querySelector('.grid-marquee')
const executeCodeBtn = document.querySelector('.execute-btn')
var debugOutput = document.querySelector('.debug-output')
var errorOffset = 0
var mapSize = 416 // defeault map size
var userChangedMpsVal = false
var gridSize = setGrid(mapSize, 33) // default grid size




/* =========================================

	Events

========================================= */

// toolbar option for map size
controlMapSize.addEventListener('change', e => {
	mapSize = e.target.value

	if (userChangedMpsVal === false && mapSize <= 416) {
		controlMps.value = 33
	}

	if (userChangedMpsVal === false && mapSize > 416) {
		controlMps.value = 40
	}

	gridSize = setGrid(mapSize, controlMps.value)
	executeLuaCode()
})

// toolbar option for meters per square
controlMps.addEventListener('change', e => {
	userChangedMpsVal = true
	let mps = e.target.value
	gridSize = setGrid(controlMapSize.value, mps)
	executeLuaCode()
})

executeCodeBtn.addEventListener('click', e => {
	executeLuaCode()
})

// on editor change, run updates
editor.session.on('change', function(delta) {
	if (disableExecuteOnKey === false) executeLuaCode()
})



/* =========================================

	Map Config

========================================= */

// lua setup code, common vars, and methods
import mapSetupCode from './lua-imports/map-setup.lua'

// library engine imports
import libraryTemplateEngineFunctions from './lua-imports/library/engine/template_functions.lua'
import libraryCalculationFunctions from './lua-imports/library/engine/calculationfunctions.lua'
import libraryDistributionFunctions from './lua-imports/library/engine/distributionfunctions.lua'
import libraryDrawLinesFunctions from './lua-imports/library/engine/drawlinesfunctions.lua'
import librarySetSquaresFunctions from './lua-imports/library/engine/setsquaresfunctions.lua'
import libraryGetSquaresFunctions from './lua-imports/library/engine/getsquaresfunctions.lua'

// library cardinal imports
import libraryTemplateCardinalFunctions from './lua-imports/library/cardinal/template_functions.lua'
import libraryTacticalRegions from './lua-imports/library/cardinal/tacticalregions.lua'
import libraryPlayerStarts from './lua-imports/library/cardinal/player_starts.lua'
import libraryPlayerResources from './lua-imports/library/cardinal/playerresources.lua'
import libraryMapSetup from './lua-imports/library/cardinal/map_setup.lua'
import libraryReviewFunctions from './lua-imports/library/cardinal/review_functions.lua'
import libraryXp1Functions from './lua-imports/library/cardinal/xp1_functions.lua'

// execute on load
executeLuaCode()



/* =========================================

	Get Lua Code from Ace Editor

========================================= */

function getLuaCode() {

	// Lua vars that are set dynamically from the tool options
	let editorValue = 'gridSize = ' + gridSize + '\r\n'
	editorValue += 'gridHeight = ' + gridSize + '\r\n'
	editorValue += 'gridWidth = ' + gridSize + '\r\n'
	editorValue += 'worldTerrainWidth = ' + mapSize +'\r\n'
	editorValue += 'worldTerrainHeight = ' + mapSize +'\r\n'

	// lua setup code, defines all the terrain types, vars, etc
	editorValue += mapSetupCode + '\r\n'

	// library lua
	editorValue += libraryTemplateEngineFunctions + '\r\n'
	editorValue += libraryCalculationFunctions + '\r\n'
	editorValue += libraryDistributionFunctions + '\r\n'
	editorValue += libraryDrawLinesFunctions + '\r\n'
	editorValue += librarySetSquaresFunctions + '\r\n'
	editorValue += libraryGetSquaresFunctions + '\r\n'

	editorValue += libraryTacticalRegions + '\r\n'
	editorValue += libraryPlayerStarts + '\r\n'
	editorValue += libraryPlayerResources + '\r\n'
	editorValue += libraryMapSetup + '\r\n'

	editorValue += libraryTemplateCardinalFunctions + '\r\n'
	editorValue += libraryReviewFunctions + '\r\n'
	editorValue += libraryXp1Functions + '\r\n'

	errorOffset = editorValue.split(/\r\n|\r|\n/).length

	// user lua code from the Ace editor
	editorValue += editor.getValue()

	// return the terrainLayoutResult, rivers, and crossings from Lua
	editorValue += '\r\n' + 'return terrainLayoutResult, riverResult, fordResults, woodBridgeResults, stoneBridgeResults'

	// minify lua code
	editorValue = luamin.minify(editorValue)

	return editorValue
}



/* =========================================

	Execute LUA Code

========================================= */

async function executeLuaCode() {

	const lua = await factory.createEngine()

	try {

		let luaCode = getLuaCode()
		lua.doStringSync(luaCode)

		// reset debug error output
		debugOutput.innerHTML = ''
		debugOutput.style.setProperty('display', 'none')

		// success, generate the grid
		generateGrid(
			lua.global.get('terrainLayoutResult'),
			lua.global.get('riverResult'),
			lua.global.get('fordResults'),
			lua.global.get('woodBridgeResults'),
			lua.global.get('stoneBridgeResults')
		)

	} catch (error) {

		// regex for ":[number]:" str offset
		const errorLineNumRegex = /[(\:)]([\d]+)[(\:)]/
		const oldErrorNum = error.message.match(errorLineNumRegex)

		if (oldErrorNum) {
			const newErrorNum = (oldErrorNum[1] - errorOffset) + 1
			error.message = error.message.replace(errorLineNumRegex, ' Line ' + newErrorNum + ':' )
		}

		// regex for "at line [number]" str offset
		const errorAtLineNumRegex = /[^(\:|\W)][\d]+[^(\:|\W)]/
		const oldErrorAtLineNum = error.message.match(errorAtLineNumRegex)

		if (oldErrorAtLineNum) {
			const newErrorAtLineNum = (oldErrorAtLineNum[0] - errorOffset) + 1
			error.message = error.message.replace(oldErrorAtLineNum, newErrorAtLineNum )
		}

		debugOutput.style.setProperty('display', 'block')
		debugOutput.innerHTML = error.name + ': ' + error.message
		
	} finally {

		// Close the lua environment, so it can be freed
		lua.global.close()
	
	}

}



/* =========================================

	Set Grid by meters per square

========================================= */

function setGrid(mapSize, mps) {

	mapSize = Math.round(mapSize / mps)

	if (mapSize % 2 == 0) {
		mapSize = mapSize - 1
	}

	console.log('Grid Size: ' + mapSize)

	// inline style so the layout container fits all columns neatly
	layoutResultContainer.style.setProperty('--grid-column-count', mapSize)

	// update the grid marquee
	gridMarquee.innerHTML = mapSize + 'x' + mapSize

	return mapSize
}



/* =========================================

	Generate Grid

========================================= */

function generateGrid(terrainLayoutResult, riverResult, fordResults, woodBridgeResults, stoneBridgeResults) {

	// destroy the grid before generating a new one
	destroyGrid(layoutResultContainer)

	// river crossing prep, merge into terrainLayoutResult
	let riverCrossings = [ 'ford', 'wood', 'stone' ]
	let riverCrossingObject = {}
	riverCrossings.forEach(function(riverCrossingType, i) {
		
		switch(riverCrossingType) {

			case 'ford':
			riverCrossingObject = fordResults
			break;

			case 'wood':
			riverCrossingObject = woodBridgeResults
			break;

			case 'stone':
			riverCrossingObject = stoneBridgeResults
			break;

		}

		if (riverCrossingObject.length) {
			riverCrossingObject[0].forEach(function(row, i) {
				let terrainRow = row[0] - 1
				let terrainCol = row[1] - 1
				terrainLayoutResult[terrainRow][terrainCol]['crossing'] = riverCrossingType
			})
		}
	})

	// terrain and player
	terrainLayoutResult.forEach(function(row, i) {
		
		let rowNum = i + 1

		row.forEach(function(col, i) {
			let colNum = i + 1
			let colEl = document.createElement('div')

			// terrainTypes
			colEl.classList.add('layout-result__col', col.terrainType)
			colEl.setAttribute('title', rowNum + ',' + colNum + ' ' + col.terrainType)

			// river crossing
			if (col.crossing !== undefined) {
				colEl.classList.add('river-crossing', col.crossing)
			}
			
			// playerIndex
			if (Number.isInteger(col.playerIndex)) {
				colEl.classList.add('player-start', 'player-index-' + col.playerIndex)
			}

			layoutResultContainer.append(colEl)
		})

	})
	
}



/* =========================================

	Destroy Grid

========================================= */

function destroyGrid(parent) {

	while (parent.firstChild) {
		parent.removeChild(parent.firstChild)
	}

}