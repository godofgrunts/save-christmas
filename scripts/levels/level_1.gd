extends Node2D

@onready var sled : Node2D = $Sled
@onready var rudolph : Node2D = $Sled/Reindeer
@onready var santa : Node2D = $Sled/Santa
var rudolph_position : Vector2
var santa_position : Vector2

func _ready() -> void:
	RenderingServer.global_shader_parameter_set("drunk_level", 0.0)
	_tween()

func _tween() -> void:
	rudolph_position = rudolph.position
	santa_position = santa.position
	var tween = create_tween()
	tween.connect("finished", _tween)
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.set_ease(Tween.EASE_IN)
	tween.set_parallel(true)
	tween.tween_property(rudolph, "position", Vector2(38, -15), 5)
	tween.tween_property(santa, "position", Vector2(0, -15), 5).set_delay(0.5)
	tween.chain().tween_property(rudolph, "position", rudolph_position, 5)
	tween.tween_property(santa, "position", santa_position, 5).set_delay(0.5)
	
