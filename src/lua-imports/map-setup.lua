--this code is imported by index.js
--defines terrainTypes, useful variables, and sets up the terrainLayoutResult grid
--gridSize, worldTerrainWidth, gridHeight, gridWidth is defined dynamically in index.js
--this code is prepended to the lua code string and runs first

terrainTypes = {
"tt_wadden_sea_holy_site",
"tt_wadden_sea_shallows",
"tt_wadden_sea_island",
"tt_wadden_sea_player_start",
"tt_wadden_sea_settlement",
"tt_shadow_lake_player_start",
"tt_shadow_lake_herdable",
"tt_shadow_lake_gold",
"tt_shadow_lake_hostile_hunt",
"tt_shadow_lake_water",
"tt_shadow_lake_aquatic",
"tt_shadow_lake_hunt",
"tt_shadow_lake_stone",
"tt_shadow_lake_relic",
"tt_ponds_lake",
"tt_ponds_player_start",
"tt_ponds_lake_forage",
"tt_ponds_relic",
"tt_ponds_holy_site",
"tt_ponds_settlement",
"tt_continental_settlement",
"tt_continental_water_stealth",
"tt_continental_island_chonker",
"tt_continental_island_ungulate",
"tt_continental_player_start",
"tt_continental_holy_site",
"tt_continental_water",
"tt_continental_water_deep",
"tt_continental_island_herdable",
"tt_continental_water_aquatic",
"tt_african_waters_stone_neutral",
"tt_african_waters_settlement",
"tt_african_waters_resource_neutral",
"tt_african_waters_player_start",
"tt_african_waters_gold_neutral",
"tt_african_waters_holy_site",
"tt_african_waters_chonker_herde",
"tt_african_waters_water",
"tt_himeyama_player_start",
"tt_haywire_predator",
"tt_haywire_huntable_neutral",
"tt_haywire_holy_site",
"tt_haywire_hostile_hunt_neutral",
"tt_haywire_relic",
"tt_haywire_settlement",
"tt_haywire_forage_bush_neutral",
"tt_haywire_gold_neutral",
"tt_haywire_player_start",
"tt_haywire_stone_neutral",
"tt_atacama_gold_neutral",
"tt_atacama_holy_site",
"tt_atacama_herdable_neutral",
"tt_atacama_stone_neutral",
"tt_atacama_forage_bush_neutral",
"tt_atacama_settlement",
"tt_atacama_oasis",
"tt_atacama_huntable_neutral",
"tt_atacama_player_start",
"tt_volcanic_island_forest_small",
"tt_volcanic_island_forest_medium",
"tt_volcanic_island_forest_tiny",
"tt_volcanic_island_swamp",
"tt_volcanic_island_crater",
"tt_volcanic_island_forest_large",
"tt_volcanic_island_player_start",
"tt_cliffside_player_start",
"tt_cliffside_holy_site_plateau_med",
"tt_relic_river_holy_site",
"tt_relic_river_plateau_high_bounty_small",
"tt_relic_river_plateau_high_bounty_large",
"tt_relic_river_plateau_med_settlement",
"tt_relic_river_plateau_high_bounty_micro",
"tt_relic_river_plateau_high_bounty_medium",
"tt_relic_river_plateau_med_bounty_medium",
"tt_relic_river_plateau_med_forest_dense",
"tt_relic_river_trees_stealth",
"tt_relic_river_plateau_med_holy_site",
"tt_relic_river_plateau_high_forest_dense",
"tt_relic_river_plateau_high_holy_site",
"tt_relic_river_plateau_low_forest_dense",
"tt_relic_river_hills_med",
"tt_relic_river_plateau_med_bounty_large",
"tt_relic_river_plateau_med_bounty_small",
"tt_relic_river_plateau_high",
"tt_relic_river_hills_low",
"tt_relic_river_plateau_low",
"tt_relic_river_plateau_med",
"tt_relic_river_hills_high",
"tt_relic_river_player_start",
"tt_relic_river_plateau_med_bounty_micro",
"tt_confluence_holy_site",
"tt_migration_herdable",
"tt_migration_gold",
"tt_migration_ocean",
"tt_migration_player_start",
"tt_migration_stone",
"tt_migration_forest_spawn",
"tt_migration_settlement",
"tt_migration_spawn",
"tt_migration_forage_bush",
"tt_migration_chonker",
"tt_migration_ungulate",
"tt_rugged_player_start",
"tt_hideout_player_start",
"tt_hideout_forage_bush",
"tt_hideout_stone",
"tt_hideout_player_start_colossal",
"tt_hideout_mean",
"tt_hideout_player_start_huge",
"tt_hideout_kind",
"tt_hideout_player_start_medium",
"tt_hideout_gold",
"tt_hideout_player_start_large",
"tt_dunes_forage_bush",
"tt_dunes_player_start",
"tt_dunes_ungulate",
"tt_dunes_stone",
"tt_dunes_gold",
"tt_mountain_lakes_player_start",
"tt_mountain_lakes_resources_neutral",
"tt_mountain_lakes_stone_neutral",
"tt_mountain_lakes_forage_bush_neutral",
"tt_mountain_lakes_gold_neutral",
"tt_waterholes_aquatic",
"tt_waterholes_lake",
"tt_waterholes_player_start",
"tt_waterholes_settlement",
"tt_waterholes_neutral_resources",
"tt_waterholes_holy_site",
"tt_clearing_holy_site",
"tt_clearing_neutral",
"tt_clearing_player_start",
"tt_mediterranean_player_start",
"tt_turtle_ridge_player_start",
"tt_turtle_ridge_forest_plains",
"tt_team_islands_holy_site",
"tt_pond_island_relic",
"tt_pond_island_water",
"tt_pond_island_middle",
"tt_pond_island_gold",
"tt_pond_island_player_start",
"tt_pond_island_stone",
"tt_pond_island_forage_bush",
"tt_glade_holy_site",
"tt_glade_huntable_neutral",
"tt_glade_forage_bush_neutral",
"tt_glade_gold_neutral",
"tt_glade_herdable_neutral",
"tt_glade_stone_neutral",
"tt_glade_settlement",
"tt_glade_player_start",
"tt_sacred_crest_player_start",
"tt_sacred_crest_gold_neutral",
"tt_sacred_crest_stone",
"tt_sacred_crest_forage_bush",
"tt_sacred_crest_water",
"tt_sacred_crest_plateau_relic",
"tt_sacred_crest_stone_neutral",
"tt_sacred_crest_spawn_relic",
"tt_sacred_crest_holy_site",
"tt_sacred_crest_gold",
"tt_sacred_crest_middle_slope",
"tt_the_divide_stone",
"tt_the_divide_relic",
"tt_the_divide_gold",
"tt_the_divide_herdable",
"tt_the_divide_hostile_hunt",
"tt_the_divide_hunt",
"tt_the_divide_player_start",
"tt_highland_mountain",
"tt_highland_plateau_forest",
"tt_highland_holy_site",
"tt_highland_stealth_small_high",
"tt_highland_player_start",
"tt_highland_spawn_forest",
"tt_highland_slope_forest",
"tt_highland_stealth_medium_low",
"tt_highland_water",
"tt_highland_stealth_medium_high",
"tt_highland_neutral_resources",
"tt_highland_stealth_small_low",
"tt_forest_mountain_stone",
"tt_forest_mountain_player_start",
"tt_forest_mountain_gold",
"tt_forest_mountain_forest_elevation",
"tt_forest_mountain_peak",
"tt_forest_mountain_herdable",
"tt_forest_mountain_hunt",
"tt_forest_mountain_hostile_hunt",
"tt_forest_ponds_holy_site",
"tt_forest_ponds_aquatic_small",
"tt_forest_ponds_aquatic_huge",
"tt_forest_ponds_market",
"tt_forest_ponds_player_start",
"tt_forest_ponds_aquatic_large",
"tt_forest_ponds_aquatic_tiny",
"tt_forest_ponds_aquatic_medium",
"tt_savannah_relic",
"tt_savannah_stone",
"tt_savannah_gold",
"tt_savannah_swamp",
"tt_savannah_forest",
"tt_savannah_ungulate",
"tt_savannah_settlement",
"tt_savannah_herdable",
"tt_savannah_water",
"tt_savannah_player_start",
"tt_savannah_chonker",
"tt_savannah_island",
"tt_savannah_swamp_forage",
"tt_golden_pit_forage_bush",
"tt_golden_pit_relic",
"tt_golden_pit_holy_site",
"tt_golden_pit_ungulate",
"tt_golden_pit_herdable",
"tt_golden_pit_stone",
"tt_golden_pit_gold",
"tt_golden_pit_player_start",
"tt_golden_pit_settlement",
"tt_waterlanes_plains_gold",
"tt_tactical_region_gold_plateau_high_a",
"tt_tactical_region_gold_plains_d",
"tt_pocket_wood_b",
"tt_holy_site_plateau_low",
"tt_holy_site_hill_low",
"tt_island_deposits_wrelic",
"tt_poi_ruins_high_hills",
"tt_tactical_region_stone_plateau_low_c",
"tt_pond_wshorefish",
"tt_sacred_mountains_gold_plateau_med",
"tt_tactical_region_gold_plains_c",
"tt_four_lakes_gold",
"tt_plains_deer_small_single",
"tt_pocket_stone_gold",
"tt_hidden_valley_plateau_stone",
"tt_moats_forest_natural_tiny",
"tt_relic_spawner",
"tt_tactical_region_gold_plateau_low_b",
"tt_wolf_spawner",
"tt_pocket_gold_b",
"tt_pocket_gold_a",
"tt_pocket_sheep_a",
"tt_pocket_wood_a",
"tt_holy_site_hill_danger_wextras_largemaps",
"tt_holy_site_valley",
"tt_holy_site_loose",
"tt_enlightened_horizon_holy_site",
"tt_dry_river_plateau_holy_site",
"tt_holy_site_plateau_med",
"tt_berries_large_single",
"tt_gold_small_single",
"tt_deer_herd_large",
"tt_gold_large_single",
"tt_deer_herd_small",
"tt_stone_large_single",
"tt_sheep_single",
"tt_berries_small_single",
"tt_stone_small_single",
"tt_sheep_large",
"tt_sheep_small",
"tt_sheep_med",
"tt_tactical_region_gold_plateau_med_b",
"tt_holy_site_valley_danger",
"tt_four_lakes_gold_small",
"tt_stone_small_hills",
"tt_holysite_boaranddeer",
"tt_tactical_region_gold_plains_e",
"tt_tactical_region_stone_plateau_low_b",
"tt_plains_deer_large_single",
"tt_tactical_region_gold_plateau_low_a",
"tt_hidden_valley_plateau_gold",
"tt_pocket_stone_food",
"tt_poi_ronin",
"tt_pocket_gold_food",
"tt_stone_large",
"tt_poi_merchant",
"tt_four_lakes_stone_small",
"tt_gold_tiny",
"tt_tactical_region_stone_plains_c",
"tt_holy_site_hill_danger_lite",
"tt_plains_wrelic",
"tt_sacred_mountains_stone_plateau_med",
"tt_plateau_gold",
"tt_holy_site",
"tt_plateau_stone",
"tt_tactical_region_stone_plateau_med_a",
"tt_boar_spawner_single",
"tt_tactical_region_gold_plateau_med_d",
"tt_tactical_region_gold_plateau_low_e",
"tt_poi_random",
"tt_hills_wgold",
"tt_tactical_region_gold_plateau_med_a",
"tt_bounty_stone_plains",
"tt_berries_stone_small",
"tt_gorge_gold_team",
"tt_tactical_region_gold_plateau_med_e",
"tt_tactical_region_stone_valley_a",
"tt_plains_forest_small_patch",
"tt_holy_site_hill_danger_wextras",
"tt_waterlanes_holy",
"tt_socotra_boar",
"tt_holysite_wboar",
"tt_holy_site_plateau_high",
"tt_poi_ruins",
"tt_tactical_region_gold_plateau_med_c",
"tt_poi_abandoned_outpost",
"tt_plains_deposits_norelic",
"tt_holy_site_hill_low_loose",
"tt_poi_wolf_den",
"tt_socotra_gold_small",
"tt_pocket_wood_c",
"tt_aquatic",
"tt_pocket_stone_b",
"tt_adne_combo_01",
"tt_holysite_wextras",
"tt_flankwoods_gold",
"tt_lake_side_stone_large",
"tt_holy_site_valley_danger_w_relics",
"tt_pocket_gold_c",
"tt_bounty_gold_valley",
"tt_holysite_deer_large",
"tt_berries_gold_small",
"tt_lake_side_holy_site",
"tt_tactical_region_stone_plateau_med_b",
"tt_gold_small",
"tt_pocket_stone_wood",
"tt_gold_small_hills",
"tt_holysite_wextras_largemaps",
"tt_bounty_gold_plains",
"tt_tactical_region_stone_plains_b",
"tt_relics_valley_danger",
"tt_tactical_region_stone_plains_a",
"tt_tactical_region_stone_plateau_med_c",
"tt_gold_large",
"tt_tactical_region_gold_valley_a",
"tt_pocket_gold_wood",
"tt_deer_spawner",
"tt_pocket_berries",
"tt_pocket_stone_a",
"tt_waterlanes_plains_stone",
"tt_tactical_region_gold_plains_b",
"tt_holy_site_hill_danger",
"tt_ocean_deep_fish",
"tt_tactical_region_stone_plateau_low_a",
"tt_holysite_wveg",
"tt_bounty_stone_hills_large",
"tt_tactical_region_gold_plains_a",
"tt_holy_site_precise",
"tt_bounty_stone_hills",
"tt_holysite_boar_single",
"tt_plains_forest_stealth_patch",
"tt_pocket_wood_food",
"tt_hills_wstone",
"tt_pocket_stone_c",
"tt_holy_site_plateau_standard",
"tt_tactical_region_gold_plateau_low_d",
"tt_holy_site_hill",
"tt_poi_ronin_hills_high",
"tt_holy_site_loose_oasis",
"tt_tactical_region_gold_plateau_low_c",
"tt_plains_deposits_wrelic",
"tt_dale_resources",
"tt_four_lakes_stone",
"tt_plateau_low_large_gold_small_stone",
"tt_boar_spawner_double",
"tt_stealth_plateau_medium_natural_large",
"tt_stealth_plateau_medium_natural_tiny",
"tt_forest_plateau_medium_natural_small",
"tt_stealth_plateau_medium_natural_medium",
"tt_forest_plateau_medium_natural_medium",
"tt_forest_plateau_medium_natural_tiny",
"tt_stealth_plateau_medium_natural_small",
"tt_forest_plateau_medium_natural_large",
"tt_forest_plateau_high_natural_medium",
"tt_forest_plateau_high_natural_large",
"tt_forest_plateau_high_natural_tiny",
"tt_stealth_plateau_high_natural_medium",
"tt_stealth_plateau_high_natural_tiny",
"tt_forest_plateau_high_natural_small",
"tt_stealth_plateau_high_natural_large",
"tt_stealth_plateau_high_natural_small",
"tt_sacred_mountains_stealth_circular_large",
"tt_forest_natural_grove",
"tt_stealth_natural_small",
"tt_stealth_natural_medium",
"tt_socotra_stealth_natural_small",
"tt_stealth_natural_large",
"tt_forest_natural_medium",
"tt_forest_natural_small",
"tt_forest_natural_tiny",
"tt_stealth_natural_tiny",
"tt_forest_natural_large",
"tt_forest_natural_grove_large",
"tt_stealth_plateau_low_natural_small",
"tt_stealth_plateau_low_natural_medium",
"tt_stealth_plateau_low_natural_large",
"tt_forest_plateau_low_natural_medium",
"tt_forest_plateau_low_natural_large",
"tt_forest_plateau_low_natural_tiny",
"tt_stealth_plateau_low_natural_tiny",
"tt_forest_plateau_low_natural_small",
"tt_sacred_mountains_forest_small_hills",
"tt_forest_circular_small",
"tt_eo_forest_circular_medium_clearing",
"tt_stealth_circular_small",
"tt_forest_circular_medium",
"tt_stealth_circular_large",
"tt_stealth_circular_tiny",
"tt_forest_circular_tiny",
"tt_stealth_circular_medium",
"tt_forest_circular_large",
"tt_forest_plateau_low_circular_medium",
"tt_stealth_plateau_low_circular_large",
"tt_forest_plateau_low_circular_tiny",
"tt_stealth_plateau_low_circular_small",
"tt_stealth_plateau_low_circular_tiny",
"tt_forest_plateau_low_circular_large",
"tt_stealth_plateau_low_circular_medium",
"tt_forest_plateau_low_circular_small",
"tt_settlement_hills_wveg",
"tt_settlement_plateau",
"tt_settlement_plateau_precise",
"tt_settlement_hills_high_rolling",
"tt_lake_side_settlement",
"tt_hidden_valley_plateau_settlement",
"tt_settlement_naval_lake",
"tt_settlement_plains",
"tt_settlement_hills_boar",
"tt_waterlanes_settlement",
"tt_settlement_hills_deer_large",
"tt_settlement_naval",
"tt_settlement_hills_deerandboar",
"tt_settlement_hills",
"tt_dry_river_settlement_hills",
"tt_settlement_valley",
"tt_impasse_trees_hills_low_rolling",
"tt_trees_hills_high_rolling_clearing",
"tt_impasse_trees_plains",
"tt_trees_plains_clearing",
"tt_gorge_forest_tc",
"tt_plains_clearing",
"tt_impasse_trees_small_plains",
"tt_impasse_trees_hills_naval",
"tt_hedgemaze_forest",
"tt_impasse_trees_hills",
"tt_hidden_valley_forest_impasse",
"tt_trees_plains_clearing_large",
"tt_trees_plains",
"tt_trees_plains_clearing_golden_heights",
"tt_trees_plains_stealth_large",
"tt_impasse_trees_plains_forest",
"tt_valley_smooth_stealth",
"tt_impasse_trees_hills_high_rolling",
"tt_hills_light_forest",
"tt_impasse_trees_plains_naval",
"tt_waterlanes_forest_edge",
"tt_trees_plains_stealth",
"tt_impasse_trees_small_plains_oasis",
"tt_forest_small_high_priority",
"tt_impasse_trees_plains_gaps",
"tt_arid_plains_food_valley",
"tt_hills",
"tt_lake_side_shore",
"tt_hills_med_rolling",
"tt_dry_river_plateau",
"tt_hills_med",
"tt_plateau_med",
"tt_plains_cliff",
"tt_hills_high_rolling",
"tt_hidden_valley_plains_clearing",
"tt_plateau_high",
"tt_gorge_plateau",
"tt_hills_civ",
"tt_gorge_hills_forest_small",
"tt_continental_hills",
"tt_hills_rough",
"tt_hills_high_flattop",
"tt_hills_low_rolling_clear",
"tt_valley",
"tt_plateau_standard_clear",
"tt_flatland",
"tt_plateau_golden_heights",
"tt_gorge_hills_forest_tiny",
"tt_plains_smooth",
"tt_valley_shallow_clearing",
"tt_hills_low_rolling_clearing",
"tt_plateau_standard_small",
"tt_valley_shallow",
"tt_valley_smooth",
"tt_plateau_low",
"tt_plains",
"tt_hills_gentle_rolling",
"tt_valley_shallow_clearing_large",
"tt_valley_shallow_smooth",
"tt_plateau_spike",
"tt_plateau_standard",
"tt_hills_lowlands",
"tt_hills_gentle_rolling_clearing",
"tt_lake_side_base_shore",
"tt_hills_plateau",
"tt_hills_low_rolling",
"tt_lake_medium_fish_single_precise",
"tt_swamp_shallow",
"tt_island_plains",
"tt_swamp_forest",
"tt_lake_medium_fish_single",
"tt_lake_shallow_plains_fish",
"tt_swamp",
"tt_lake_shallow_mediterranean",
"tt_river_fish",
"tt_lake_hill_fish",
"tt_ocean_deepwater_fish_single",
"tt_waterlanes_lake",
"tt_lake_hill",
"tt_lake_shallow_hill_fish_blocking",
"tt_ocean_deep",
"tt_warring_islands_lake_medium_fish_single",
"tt_lake_medium",
"tt_lake_hill_fish_blocking",
"tt_lake_shallow_clearing",
"tt_swamp_cliffs",
"tt_ocean",
"tt_ocean_deepwater_fish",
"tt_lake_shallow_hill_single_fish",
"tt_lake_shallow_low",
"tt_lake_shallow",
"tt_lake_shallow_hill",
"tt_lake_shallow_starting",
"tt_ocean_deep_local_stealth",
"tt_lake_deep",
"tt_lake_shallow_oasis",
"tt_lake_medium_mediterranean",
"tt_dry_river_pond",
"tt_ocean_shore",
"tt_river",
"tt_beach",
"tt_lake_shallow_starting_fish",
"tt_ocean_very_deep",
"tt_lake_shallow_hill_fish",
"tt_lake_side_shallow_fish_single",
"tt_mountains_small",
"tt_rock_spire",
"tt_impasse_mountains",
"tt_underhill_mountains",
"tt_mountain_range",
"tt_lake_side_impasse_mountains",
"tt_rock_pillar",
"tt_enlightened_ofek_spire",
"tt_mountains",
"tt_cmp_beach",
"tt_cmp_plateau_med",
"tt_cmp_hills_med_rolling",
"tt_cmp_ocean",
"tt_cmp_mountains_small",
"tt_cmp_hills_low_rolling",
"tt_cmp_mountains_impasse",
"tt_cmp_lake_shallow",
"tt_cmp_mountains",
"tt_cmp_island_plains",
"tt_cmp_swamp",
"tt_cmp_plains_cliff",
"tt_cmp_lake_deep",
"tt_cmp_plateau_low",
"tt_cmp_ocean_deep",
"tt_cmp_hills_gentle_rolling",
"tt_cmp_plains",
"tt_cmp_ocean_shore",
"tt_player_start_classic_plains_naval_archipelago",
"tt_player_start_dry_river",
"tt_player_start_nomad_plateau_med",
"tt_player_start_classic_hills_gentle_no_tertiary_wood",
"tt_player_start_migration",
"tt_player_start_classic_hills",
"tt_player_start_classic_plains_no_stone",
"tt_player_start_classic_plains_low_trees_double",
"tt_player_start_four_lakes",
"tt_player_start_classic_plains_naval_hybrid",
"tt_player_start_classic_plains_no_gold",
"tt_player_start_classic_plateau_med_no_gold_no_stone",
"tt_player_start_sparse_plains",
"tt_player_start_nomad_plains",
"tt_player_start_classic_hills_mountains_altai",
"tt_player_start_classic_plains_low_trees_oasis",
"tt_player_start_classic_plains",
"tt_player_start_classic_plateau_med",
"tt_moats_player_start",
"tt_start_lowhills_lowresource",
"tt_player_start_dry_arabia",
"tt_player_start_classic_plains_low_trees",
"tt_player_start_classic_plains_low_resources",
"tt_player_start_classic_plains_naval_small_island_01",
"tt_player_start_enlightened_horizon_ffa",
"tt_player_start_classic_plains_no_deer",
"tt_player_start_classic_hills_mountains",
"tt_player_start_canal_outer_base",
"tt_player_start_enlightened_horizon",
"tt_player_start_classic_plains_naval_small",
"tt_player_start_classic_plains_low_trees_no_deer",
"tt_player_start_classic_hills_high_rolling",
"tt_player_start_classic_plains_no_berries",
"tt_player_start_classic_plains_close_gold",
"tt_player_start_classic_plains_naval",
"tt_underhill_player_start",
"tt_player_start_classic_plains_naval_warring_islands",
"tt_player_start_classic_plateau_med_no_gold",
"tt_socotra_player_start_ffa",
"tt_player_start_continental",
"tt_player_start_hedgemaze",
"tt_player_start_hedgemaze_lanes",
"tt_player_start_waterlanes",
"tt_sacred_mountains_player_start_ffa",
"tt_player_start_classic_hills_low_rolling",
"tt_player_start_canal_inner_base",
"tt_player_start_classic_hills_med_rolling_cliffside",
"tt_player_start_safe_primary_resources_only",
"tt_player_start_arid_plains",
"tt_player_start_lake_side",
"tt_player_start_hidden_valley",
"tt_player_start_classic_hills_mountain_pass",
"tt_player_start_classic_plains_no_far_berries",
"tt_player_start_classic_plains_forest",
"tt_player_start_nomad_hills_low_rolling",
"tt_player_start_classic_plains_no_trees",
"tt_player_start_gorge",
"tt_sacred_mountains_player_start",
"tt_player_start_gorge_team",
"tt_player_start_nomad_hills",
"tt_player_start_ponds",
"tt_player_start_black_forest",
"tt_player_start_forest_ponds",
"tt_player_start_classic_plains_low_trees_koth",
"tt_player_start_classic_plains_low_trees_pit",
"tt_player_start_classic_hills_high_rolling_no_tertiary_wood",
"tt_player_start_classic_plains_no_gold_no_stone",
"tt_player_start_classic_plains_balance",
"tt_player_start_classic_plateau_med_no_stone",
"tt_socotra_player_start",
"tt_player_start_classic_plains_no_tertiary_wood",
"tt_player_start_hill_and_dale",
"tt_player_start_dunes",
"tt_plains_marsh",
"tt_campaign_starting_pos",
"tt_plains_test",
"tt_none"
}

--custom terrain types
customTerrainTypes = {

}

--combine custom terrain types
for k, v in ipairs(customTerrainTypes) do
    table.insert(terrainTypes, v)
end

--AoE4 has every terrainType assigned to a var, so we create global vars here
--this fixes situations where map coders use terrainTypes without quotes
for i = 1, #terrainTypes do
    _G[terrainTypes[i]] = terrainTypes[i]
end

--basic Round
function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

--default grid
function SetCoarseGrid()
	local metersPerSquare = 40

	local mapHeight
	local mapWidth
	local mapSize
	
	local minimumRes = 13
	
	mapHeight = Round(worldTerrainHeight / metersPerSquare, 0)
	mapWidth = Round(worldTerrainWidth / metersPerSquare, 0)
	
	if (mapHeight % 2 == 0) then
		mapHeight = mapHeight - 1
	end

	if (mapWidth % 2 == 0) then
		mapWidth = mapWidth - 1
	end
	
	mapSize = mapWidth
	
	if(mapHeight < minimumRes) then
		mapHeight = minimumRes
	end
	
	if(mapWidth < minimumRes) then
		mapWidth = minimumRes
	end
	
	if(mapSize < minimumRes) then
		mapSize = minimumRes
	end
	
	return mapHeight, mapWidth, mapSize
end

--map grid custom dimension
function SetCustomCoarseGrid(metersPerSquare)
	local mapHeight
	local mapWidth
	local mapSize

	mapHeight = Round(worldTerrainHeight / metersPerSquare, 0)
	mapWidth = Round(worldTerrainWidth / metersPerSquare, 0)
	
	if (mapHeight % 2 == 0) then
		mapHeight = mapHeight - 1
	end

	if (mapWidth % 2 == 0) then
		mapWidth = mapWidth - 1
	end
	
	mapSize = mapWidth
	return mapHeight, mapWidth, mapSize
end

-- sets all squares in coarse map to tt_none based on the coarse grid resolution and fills it with the designated terrain type
function SetUpGrid(gridSize, pickedTerrain, mapGrid)
	if (gridSize < 1) then
		print("ERROR: Grid size less than 1. Setting grid size to 2.")
		gridSize = 2
	end
	
	if (pickedTerrain == nil) then
		print("ERROR: No terrain type specified. Setting terrain type to none.")
		terrainForSquare = -1
	end
	
	if (coarseMapGrid == nil) then
		print("ERROR: coarseMapGrid is nil. Setting coarseMapGrid to {}")
		coarseMapGrid = {}
	end
	
	for row = 1,gridSize do
		coarseMapGrid[row] = {}
		for column = 1, gridSize do
			coarseMapGrid[row][column] = {}
			coarseMapGrid[row][column].terrainType = pickedTerrain
		end
	end
	return coarseMapGrid
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

--river
riverResult = {}

--crossings over rivers
fordResults = {}
woodBridgeResults = {}
stoneBridgeResults = {}

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