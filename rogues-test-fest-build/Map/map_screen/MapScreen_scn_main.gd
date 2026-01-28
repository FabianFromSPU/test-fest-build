extends Control

var map_instance: Control
var map_container: PanelContainer

func _ready():
	init_map_screen(GlobalSessionManager.run_map.get_new_map_instance(Vector2(0.0, 0.0), Vector2(32.0, 32.0)))

func init_map_screen(in_instance: Control) -> void:
	
	map_container = PanelContainer.new()
	map_container.anchor_left = 0.0
	map_container.anchor_right = 0.0
	map_container.anchor_top = 0.0
	map_container.anchor_bottom = 1.0
	add_child(map_container)
	
	get_viewport().size_changed.connect(resize_map_container)
	
	map_instance = in_instance
	map_container.add_child(map_instance)
	
	map_container.resized.connect(
		func():
			map_instance.resize_map(map_container.size)
	)
	resize_map_container()
	map_instance.resize_map(map_container.size)

func resize_map_container():
	map_container.offset_left = get_viewport().size.x / 4
	map_container.offset_right = (get_viewport().size.x / 4) * 3
