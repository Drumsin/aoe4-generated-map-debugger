--Join the Unofficial AoE4 Modding Discord: https://discord.gg/h8FX9Uq3vG
--Getting started with generated maps: https://support.ageofempires.com/hc/en-us/sections/4409136290324-Generated-Maps
--GitHub: https://github.com/Drumsin/aoe4-generated-map-debugger

--Helpful variables
--mapHalfSize
--mapQuarterSize
--mapEighthSize
--gridSize
--gridHeight
--gridWidth
--worldTerrainWidth

--Helpful functions
--worldGetRandom()

--View print in browser console
--print("Hello World!")

--clicking the run button you will see the random results!
for i = 1, gridSize * gridSize do
	randomRow = math.ceil(worldGetRandom() * gridSize)
	randomCol = math.ceil(worldGetRandom() * gridSize)
	terrainLayoutResult[randomRow][randomCol].terrainType = tt_plains
end

--Nothing on this site is made, distributed, or supported by Relic Entertainment, World's Edge Studio, and Microsoft.





















