# AoE4 Generated Map Debugger
Having to launch the game each time to see code changes is very time consuming. This debug tool helps solve this problem when building [AoE4 generated maps](https://support.ageofempires.com/hc/en-us/sections/4409136290324-Generated-Maps). Test and see the results of your `terrainLayoutResult` table in any web browser.

[See it in action at aoe4.app](https://aoe4.app/)

## Defined Lua variables
* `mapHalfSize`
* `mapQuarterSize`
* `mapEighthSize`
* `gridSize`
* `gridHeight`
* `gridWidth`
* `worldTerrainWidth`

## Defined Lua functions
* `worldGetRandom()`

## Running Existing Functions

For legal reasons, **THIS DOES NOT** include any AoE4 source code and functions. e.g. `PlacePlayerStartsRing`, `DrawStraightLineReturn`,  `CreateTeamMappingTable`, `GetNeighbors`, etc.

With that being said, there are two ways to add existing code or functions to this debugger.

### Option 1 - Quickest
Copy and paste existing code into the editor to run alongside your code. This is more prone to errors as functions may reference other undefined functions and variables.
### Option 2
Install this tool on your machine locally (see below) and add your Lua functions to [map-setup-code.txt](https://github.com/Drumsin/aoe4-generated-map-debugger/blob/master/src/lua-imports/map-setup-code.txt). Lua code defined in map-setup-code.txt is prepended to the editor code.

## Installing and running locally

Requirements: [Node.js](https://nodejs.org/en/download/)

1. Clone or download this repository.
2. Navigate to the "aoe4-generated-map-debugger" directory.
3. In your command line run these two commands.
```
npm install
npm run build
```
4. After running `npm run build`, a "dist" directory is automatically created.
5. Open "aoe4-generated-map-debugger/dist/index.html" with any web browser. Have fun!

Any files changed in the src directory, you will need to run: `npm run build`. To watch for code changes and automatically rebuild on saving any file, you can run:
```
npm run watch
```

### Disclaimer
Nothing in this debug tool is made, distributed, or supported by Relic Entertainment Inc, World's Edge LLC, and Microsoft Corporation.

