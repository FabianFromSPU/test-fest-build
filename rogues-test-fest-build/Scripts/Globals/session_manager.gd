extends Node2D
class_name SessionManager

const DEFAULT_CHARACTER_DATA = preload("res://Resources/DefaultResources/default_character_data.tres")
const DEFAULT_RUN_PROGRESS = preload("res://Resources/DefaultResources/default_run_progress.tres")

@export var run_progress:RunProgress
var pending_battle_configuration:BattleSceneConfiguration

const FLOOR_1_ENEMY_POOL = preload("res://Resources/FloorEnemyPools/floor_pool_1.tres")
const FLOOR_1_SCHEMA = preload("res://Resources/DefaultResources/default_floor_object_schemas.tres")

func _ready() -> void:
	if run_progress == null:
		run_progress = DEFAULT_RUN_PROGRESS.duplicate(true)

func create_battle_scene_configuration():
	var enemy_group:EnemyGroup 
	#objects
	if run_progress.floor == 1:
		enemy_group = FLOOR_1_ENEMY_POOL.get_enemy_group(run_progress.floor_progress)
	# TODO: Add additional if statements for future floors 2, 3, 4
	
	var battle_config = BattleSceneConfiguration.new(
			run_progress.character_data.entity_data,
			enemy_group,
			FLOOR_1_SCHEMA.pick_random()
	)
	pending_battle_configuration = battle_config
	return battle_config

func get_character_sprite():
	if !run_progress.character_data:
		return null
	if !run_progress.character_data.entity_data:
		return null
	return run_progress.character_data.entity_data.display_texture
