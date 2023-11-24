extends Node2D

var sled : Node2D

func _ready():
	SignalManager.sled_node.connect(sled_node)
	SignalManager.round_finished.connect(round_end)
	SignalManager.new_round.connect(_load_level)
	_load_level()

func _load_level() -> void:
	var l = LevelInfo.level
	for child in self.get_children():
		if "Level" in child.name:
			remove_child(child)
	var packed_scene_name = "res://scenes/level_" + str(l) + ".tscn"
	var packed_scene = load(packed_scene_name)
	var level_scene = packed_scene.instantiate()
	add_child(level_scene)

func sled_node(s : Node2D) -> void:
	sled = s
	sled.position = Vector2(50, 50)

func round_end():
	for child in self.get_children():
		if "Level" in child.name:
			remove_child(child)
	var packed_scene_name = "res://scenes/level_end_screen.tscn"
	var packed_scene = load(packed_scene_name)
	var end_level_scene = packed_scene.instantiate()
	add_child(end_level_scene)

func _on_area_2d_body_entered(body):
	SignalManager.emit_signal("clear_queue")


func _on_area_2d_area_entered(area):
	area.queue_free()
