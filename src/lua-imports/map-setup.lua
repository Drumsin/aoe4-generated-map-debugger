--this code is imported by index.js
--defines terrainTypes, useful variables, and sets up the terrainLayoutResult grid
--gridSize, worldTerrainWidth, gridHeight, gridWidth is defined dynamically in index.js
--this code is prepended to the lua code string and runs first

terrainTypes = {
	"tt_none",
	"tt_flatland",
	"tt_hills",
	"tt_hills_civ",
	"tt_hills_gentle_rolling",
	"tt_hills_gentle_rolling_clearing",
	"tt_hills_high_flattop",
	"tt_hills_high_rolling",
	"tt_hills_lowlands",
	"tt_hills_low_rolling",
	"tt_hills_low_rolling_clearing",
	"tt_hills_med",
	"tt_hills_med_rolling",
	"tt_hills_plateau",
	"tt_hills_rough",
	"tt_plains",
	"tt_plains_cliff",
	"tt_plains_smooth",
	"tt_plateau_high",
	"tt_plateau_low",
	"tt_plateau_med",
	"tt_plateau_spike",
	"tt_plateau_standard",
	"tt_plateau_standard_clear",
	"tt_plateau_standard_small",
	"tt_valley",
	"tt_valley_shallow",
	"tt_valley_shallow_clearing",
	"tt_valley_shallow_clearing_large",
	"tt_valley_shallow_smooth",
	"tt_valley_smooth",
	"tt_impasse_mountains",
	"tt_mountains",
	"tt_mountains_small",
	"tt_mountain_range",
	"tt_rock_pillar",
	"tt_rock_spire",
	"tt_player_start_classic_hills",
	"tt_player_start_classic_hills_gentle_no_tertiary_wood",
	"tt_player_start_classic_hills_high_rolling",
	"tt_player_start_classic_hills_low_rolling",
	"tt_player_start_classic_hills_med_rolling_cliffside",
	"tt_player_start_classic_hills_mountains",
	"tt_player_start_classic_plains",
	"tt_player_start_classic_plains_balance",
	"tt_player_start_classic_plains_close_gold",
	"tt_player_start_classic_plains_forest",
	"tt_player_start_classic_plains_low_trees",
	"tt_player_start_classic_plains_low_trees_double",
	"tt_player_start_classic_plains_low_trees_koth",
	"tt_player_start_classic_plains_low_trees_no_deer",
	"tt_player_start_classic_plains_low_trees_pit",
	"tt_player_start_classic_plains_naval",
	"tt_player_start_classic_plains_naval_hybrid",
	"tt_player_start_classic_plains_naval_small",
	"tt_player_start_classic_plains_naval_small_island_01",
	"tt_player_start_classic_plains_no_berries",
	"tt_player_start_classic_plains_no_deer",
	"tt_player_start_classic_plains_no_far_berries",
	"tt_player_start_classic_plains_no_gold",
	"tt_player_start_classic_plains_no_gold_no_stone",
	"tt_player_start_classic_plains_no_stone",
	"tt_player_start_classic_plains_no_tertiary_wood",
	"tt_player_start_classic_plains_no_trees",
	"tt_player_start_classic_plateau_med",
	"tt_player_start_classic_plateau_med_no_gold",
	"tt_player_start_classic_plateau_med_no_gold_no_stone",
	"tt_player_start_classic_plateau_med_no_stone",
	"tt_player_start_nomad_hills",
	"tt_player_start_nomad_hills_low_rolling",
	"tt_player_start_nomad_plains",
	"tt_player_start_nomad_plateau_med",
	"tt_player_start_sparse_plains",
	"tt_berries_gold_small",
	"tt_berries_stone_small",
	"tt_boar_spawner_double",
	"tt_bounty_gold_plains",
	"tt_bounty_gold_valley",
	"tt_bounty_stone_hills",
	"tt_bounty_stone_hills_large",
	"tt_bounty_stone_plains",
	"tt_dale_resources",
	"tt_deer_spawner",
	"tt_holy_site",
	"tt_holy_site_hill",
	"tt_holy_site_hill_danger",
	"tt_holy_site_hill_danger_lite",
	"tt_holy_site_hill_low",
	"tt_holy_site_plateau_high",
	"tt_holy_site_plateau_low",
	"tt_holy_site_plateau_med",
	"tt_holy_site_plateau_standard",
	"tt_holy_site_valley",
	"tt_holy_site_valley_danger",
	"tt_plains_deer_large_single",
	"tt_plains_deer_small_single",
	"tt_plateau_low_large_gold_small_stone",
	"tt_pocket_berries",
	"tt_pocket_gold_a",
	"tt_pocket_gold_b",
	"tt_pocket_gold_c",
	"tt_pocket_gold_food",
	"tt_pocket_gold_wood",
	"tt_pocket_sheep_a",
	"tt_pocket_stone_a",
	"tt_pocket_stone_b",
	"tt_pocket_stone_c",
	"tt_pocket_stone_food",
	"tt_pocket_stone_gold",
	"tt_pocket_stone_wood",
	"tt_pocket_wood_a",
	"tt_pocket_wood_b",
	"tt_pocket_wood_c",
	"tt_pocket_wood_food",
	"tt_relic_spawner",
	"tt_tactical_region_gold_plains_a",
	"tt_tactical_region_gold_plains_b",
	"tt_tactical_region_gold_plains_c",
	"tt_tactical_region_gold_plains_d",
	"tt_tactical_region_gold_plains_e",
	"tt_tactical_region_gold_plateau_high_a",
	"tt_tactical_region_gold_plateau_low_a",
	"tt_tactical_region_gold_plateau_low_b",
	"tt_tactical_region_gold_plateau_low_c",
	"tt_tactical_region_gold_plateau_low_d",
	"tt_tactical_region_gold_plateau_low_e",
	"tt_tactical_region_gold_plateau_med_a",
	"tt_tactical_region_gold_plateau_med_b",
	"tt_tactical_region_gold_plateau_med_c",
	"tt_tactical_region_gold_plateau_med_d",
	"tt_tactical_region_gold_plateau_med_e",
	"tt_tactical_region_stone_plains_a",
	"tt_tactical_region_stone_plains_b",
	"tt_tactical_region_stone_plains_c",
	"tt_tactical_region_stone_plateau_low_a",
	"tt_tactical_region_stone_plateau_low_b",
	"tt_tactical_region_stone_plateau_low_c",
	"tt_tactical_region_stone_plateau_med_a",
	"tt_tactical_region_stone_plateau_med_b",
	"tt_tactical_region_stone_plateau_med_c",
	"tt_wolf_spawner",
	"tt_settlement_hills",
	"tt_settlement_hills_high_rolling",
	"tt_settlement_naval",
	"tt_settlement_plains",
	"tt_settlement_plateau",
	"tt_settlement_valley",
	"tt_campaign_starting_pos",
	"tt_plains_marsh",
	"tt_plains_test",
	"tt_hills_light_forest",
	"tt_impasse_trees_hills",
	"tt_impasse_trees_hills_high_rolling",
	"tt_impasse_trees_hills_low_rolling",
	"tt_impasse_trees_plains",
	"tt_impasse_trees_plains_forest",
	"tt_impasse_trees_plains_gaps",
	"tt_impasse_trees_plains_naval",
	"tt_impasse_trees_small_plains",
	"tt_plains_clearing",
	"tt_trees_hills_high_rolling_clearing",
	"tt_trees_plains",
	"tt_trees_plains_clearing",
	"tt_trees_plains_clearing_large",
	"tt_trees_plains_stealth",
	"tt_trees_plains_stealth_large",
	"tt_valley_smooth_stealth",
	"tt_beach",
	"tt_island_plains",
	"tt_lake_deep",
	"tt_lake_hill",
	"tt_lake_hill_fish",
	"tt_lake_hill_fish_blocking",
	"tt_lake_medium",
	"tt_lake_medium_fish_single",
	"tt_lake_shallow",
	"tt_lake_shallow_clearing",
	"tt_lake_shallow_hill",
	"tt_lake_shallow_hill_fish",
	"tt_lake_shallow_hill_fish_blocking",
	"tt_lake_shallow_low",
	"tt_lake_shallow_plains_fish",
	"tt_lake_shallow_starting",
	"tt_lake_shallow_starting_fish",
	"tt_ocean",
	"tt_ocean_deep",
	"tt_ocean_deepwater_fish",
	"tt_ocean_deepwater_fish_single",
	"tt_ocean_deep_local_stealth",
	"tt_ocean_shore",
	"tt_river",
	"tt_swamp",
	"tt_swamp_forest",
	"tt_swamp_shallow"
}

--AoE4 has every terrainType assigned to a var, so we create global vars here
--this fixes situations where map coders use terrainTypes without quotes
for i = 1, #terrainTypes do
    _G[terrainTypes[i]] = terrainTypes[i]
end

--useful variables
mapMidPoint = math.ceil(gridSize / 2)
mapHalfSize = math.ceil(gridSize / 2)
mapQuarterSize = math.ceil(gridSize / 4)
mapEighthSize = math.ceil(gridSize / 8)

--get random number
function worldGetRandom()
	return math.random()
end

terrainLayoutResult = {}

--setup grid
for row = 1, gridSize do
    terrainLayoutResult[row] = {}
    for col = 1, gridSize do
        terrainLayoutResult[row][col] = { terrainType = tt_none }
    end
end

--random positions
randomPositions = false

--player teams
playerTeams = {}

--2 players, 2 teams
worldPlayerCount = 2
playerTeams[1] = 1 --player 1 on team 1
playerTeams[2] = 2 --player 2 on team 2

--4 players, 2 teams
--worldPlayerCount = 4
--playerTeams[1] = 1 --player 1 on team 1
--playerTeams[2] = 1 --player 2 on team 1
--playerTeams[3] = 2 --player 3 on team 2
--playerTeams[4] = 2 --player 4 on team 2