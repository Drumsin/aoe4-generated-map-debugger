# AoE4 Generated Map Debugger
Having to launch the game each time to see code changes is very time consuming. This debug tool helps solve this problem when building [AoE4 generated maps](https://support.ageofempires.com/hc/en-us/sections/4409136290324-Generated-Maps). Test and see the results of your `terrainLayoutResult` table in any web browser.

[See it in action at aoe4.app](https://aoe4.app/)

## Defined Lua Variables
* `mapHalfSize`
* `mapQuarterSize`
* `mapEighthSize`
* `gridSize`
* `gridHeight`
* `gridWidth`
* `worldTerrainWidth`

## Defined Lua Functions
* `worldGetRandom()`

## Code Samples
Try out some of these code samples by pasting them into the editor. Use them in your maps!
* [Diagonal Cross](https://gist.github.com/Drumsin/08f5dd250c2a9071217ec9d02ed5cfc5)
* [Circle Outline](https://gist.github.com/Drumsin/c9f7f14c7fc1c72f8a9d36add7f3a733)
* [Circle Fill](https://gist.github.com/Drumsin/4913c13dc68f76586a6886835e74cb0b)

## Using Map Functions

For legal reasons, **THIS TOOL DOES NOT** include any AoE4 source code and functions. e.g. `PlacePlayerStartsRing`, `DrawStraightLineReturn`,  `CreateTeamMappingTable`, `GetNeighbors`, etc.

**However, you can run this tool on your local disk and incorporate these map functions. Once you download or clone this repository, follow the steps below.**

### STEP 1

Using the *Age of Empires IV Content Editor*, open Data.sga located in the game directory:

`Age of Empires IV\engine\archives\Data.sga`

Navigate to:

`data > scar > terrainlayout > library`

Select these files below, right-click and select "Extract". You will extract these files and overwrite the existing files located in:

`aoe4-generated-map-debugger/src/lua-imports/library`

* `calculationfunctions.lua`
* `distributionfunctions.lua`
* `drawlinesfunctions.lua`
* `getsquaresfuntions.lua`
* `setsquaresfunctiona.lua`

### STEP 2

Again using the *Age of Empires IV Content Editor*. Open another Data.sga that's located in another directory (notice the path):

`Age of Empires IV\cardinal\archives\Data.sga`

Navigate to:

`data > scar > terrainlayout > library`

Select these files below, right-click and select "Extract". You will extract these files and overwrite the existing files located in:

`aoe4-generated-map-debugger/src/lua-imports/library`

* `map_setup.lua`
* `player_starts.lua`
* `playerresources.lua`
* `tacticalregions.lua`
* `template_functions.lua`

### STEP 3

You will need to install [Node.js](https://nodejs.org/en/download/) in order to recompile the tool with the newly added scripts.

Once Node.js is installed. Follow steps 2-5 under [Installing and Running From Local Disk](#installing-and-running-from-local-disk)

## Installing and Running From Local Disk

Requirements: [Node.js](https://nodejs.org/en/download/)

1. Clone or download this repository.
2. Navigate to the "aoe4-generated-map-debugger" directory from your command line.
3. In your command line run these two commands.
```
npm install
npm run build
```
4. After running `npm run build`, a "dist" directory is automatically created.
5. Open `aoe4-generated-map-debugger/dist/index.html` with any web browser. Have fun!

Any files changed in the src directory, you will need to run: `npm run build`.

To watch for code changes and automatically rebuild on saving any file, you can run:
```
npm run watch
```

## Testing Player Starts
If you want to test player starts e.g. `PlacePlayerStartsRing()` and `PlacePlayerStartsDivided()`.

Note: In order to test and use these functions in the debugger you will have to install this tool on your local disk, followed by incorporating Lua scripts. See: [Using Map Functions](#using-map-functions)

In your editor code, define `worldPlayerCount` and `playerTeams = {}` before `teamsList, playersPerTeam = SetUpTeams()`.

This example below is testing with 6 players, 3 teams.

```
worldPlayerCount = 6
playerTeams[1] = 1 --player 1 on team 1
playerTeams[2] = 1 --player 2 on team 1
playerTeams[3] = 2 --player 3 on team 2
playerTeams[4] = 2 --player 4 on team 2
playerTeams[5] = 3 --player 5 on team 3
playerTeams[6] = 3 --player 6 on team 3

teamsList, playersPerTeam = SetUpTeams()
```

## Troubleshooting

#### The grid in the right pane doesn't load. It's completely blank with no tiles.

There is a possibility that your browser security settings is blocking the web assembly (.wasm) file that parses the Lua code. In your browser settings, try lowering the security settings from a Strict mode to a Standard/Balanced mode.

### Disclaimer
Nothing in this debug tool is made, distributed, or supported by Relic Entertainment Inc, World's Edge LLC, and Microsoft Corporation.

