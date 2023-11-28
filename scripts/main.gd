extends Node2D

var sled : Node2D

func _ready() -> void:
	SignalManager.sled_node.connect(sled_node)
	SignalManager.round_finished.connect(round_end)
	SignalManager.new_round.connect(_load_level)
	_load_level()
	
func _unhandled_input(_event) -> void:
	if Input.is_action_just_pressed("pause"):
		$PauseMenu.visible = true
		get_tree().paused = true

func _load_level() -> void:
	var packed_scene_name
	var packed_scene : PackedScene
	var level_scene
	var l = LevelInfo.level
	for child in self.get_children():
		if "Level" in child.name:
			remove_child(child)
		if "MainMenu" in child.name:
			remove_child(child)
			
	if l > 0:
		packed_scene_name = "res://scenes/level_" + str(l) + ".tscn"
		packed_scene = load(packed_scene_name)
		level_scene = packed_scene.instantiate()
	else:
		packed_scene_name = "res://scenes/ui/main_menu.tscn"
		packed_scene = load(packed_scene_name)
		level_scene = packed_scene.instantiate()
		level_scene.custom_minimum_size = Vector2(320.0,180.0)
		level_scene.set_anchors_preset(0)
		level_scene.position = Vector2.ZERO

	add_child(level_scene)

func sled_node(s : Node2D) -> void:
	sled = s
	if LevelInfo.level > 0:
		sled.position = Vector2(50, 50)

func round_end() -> void:
	for child in self.get_children():
		if "Level" in child.name:
			remove_child(child)
	var packed_scene_name = "res://scenes/level_end_screen.tscn"
	var packed_scene = load(packed_scene_name)
	var end_level_scene = packed_scene.instantiate()
	add_child(end_level_scene)

func _on_area_2d_body_entered(_body) -> void:
	SignalManager.emit_signal("clear_queue")


func _on_area_2d_area_entered(area) -> void:
	area.queue_free()
