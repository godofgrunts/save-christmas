extends Node2D

var sled : Node2D
var level : int = LevelInfo.level
var level_scene : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.sled_node.connect(sled_node)
	_load_level(level)

func _process(delta):
	pass

func _load_level(l : int) -> void:
	var packed_scene_name = "res://scenes/level_" + str(l) + ".tscn"
	var packed_scene = load(packed_scene_name)
	level_scene = packed_scene.instantiate()
	add_child(level_scene)

func sled_node(s : Node2D) -> void:
	sled = s
	sled.position = Vector2(50, 50)

func _on_area_2d_body_entered(body):
	SignalManager.emit_signal("gain_point")
