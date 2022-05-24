import './sass/style.scss'

import * as luainjs from 'lua-in-js' // The Lua to js transpile
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
document.getElementById('editor-init').style.fontSize = '20px'

// lua syntax highlight mode
const luaMode = ace.require('ace/mode/lua').Mode
editor.session.setMode(new luaMode())

// starting example code
import startCode from './lua-imports/start-code.txt'
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
var gridSize = setGrid(mapSize, 40) // default grid size
const luaEnv = luainjs.createEnv() // Lua in JS init (this is our parser)



/* =========================================

	Events

========================================= */

// toolbar option for map size
controlMapSize.addEventListener('change', e => {
	mapSize = e.target.value
	gridSize = setGrid(mapSize, controlMps.value)
	executeLuaCode()
})

// toolbar option for meters per square
controlMps.addEventListener('change', e => {
	let mps = e.target.value
	gridSize = setGrid(controlMapSize.value, mps)
	executeLuaCode()
})

executeCodeBtn.addEventListener('click', e => {
	executeLuaCode()
})

// on editor change, run updates
editor.session.on('change', function(delta) {
	executeLuaCode()
})



/* =========================================

	Map Config

========================================= */

// lua setup code, common vars, and methods
import mapSetupCode from './lua-imports/map-setup-code.txt'

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

	// lua setup code, defines all the terrain types, vars, etc
	editorValue += mapSetupCode + '\r\n'

	errorOffset = editorValue.split(/\r\n|\r|\n/).length

	// user lua code from the Ace editor
	editorValue += editor.getValue()

	// return the terrainLayoutResult from Lua
	editorValue += '\r\n' + 'return terrainLayoutResult'

	return editorValue
}



/* =========================================

	Execute LUA Code

========================================= */

function executeLuaCode() {

	let luaCode = getLuaCode()

	try {
		const returnValue = luaEnv.parse(luaCode).exec()

		// cleanup, removes zero index from row which is undefined, lua starts from row 1
		returnValue.numValues.shift()
		
		// cleanup, removes zero index from beginning col in each row which is undefined, lua starts from col 1
		returnValue.numValues.forEach(function(terrainRow, index) {
			returnValue.numValues[index].numValues.shift()
		})

		debugOutput.innerHTML = ''
		debugOutput.style.setProperty('display', 'none')

		// success, generate the grid
		generateGrid(returnValue.numValues)

	} catch (error) {

		const newErrorNum = (error.line - errorOffset) + 1
		error.message = error.message.replace(/\d+:/, newErrorNum + ':')

		debugOutput.style.setProperty('display', 'block')
		debugOutput.innerHTML = error.name + ': ' + error.message
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

function generateGrid(terrainLayoutResult) {

	// destroy the grid before generating a new one
	destroyGrid(layoutResultContainer)

	terrainLayoutResult.forEach(function(row, i) {
		
		let rowNum = i

		row.numValues.forEach(function(col, i) {
			let colEl = document.createElement('div')
			colEl.classList.add('layout-result__col', col.strValues.terrainType)
			colEl.setAttribute('title', col.strValues.terrainType)
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