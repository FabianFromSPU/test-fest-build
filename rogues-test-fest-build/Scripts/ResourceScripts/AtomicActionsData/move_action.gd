extends AtomicAction
class_name MoveAction

@export_range(-4, 4) var steps:int = 1

func execute(battle_info:BattleActionInfo):
	battle_info.battle_field.move_player(steps)
	await battle_info.battle_field.moved_position
