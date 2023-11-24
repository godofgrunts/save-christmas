extends Node2D

@onready var sled : Node2D = $Sled
@onready var rudolph : Node2D = $Sled/Reindeer
@onready var santa : Node2D = $Sled/Santa
var rudolph_position : Vector2
var santa_position : Vector2

func _ready() -> void:
	_tween()

func _tween() -> void:
	randomize()
	rudolph_position = rudolph.position
	santa_position = santa.position
	var new_x = randi_range(-20, 292)
	var new_y = randi_range(-30, 50)
	var new_vector = Vector2(new_x, new_y)
	var tween = create_tween()
	tween.connect("finished", _tween)
	tween.set_trans(Tween.TRANS_EXPO)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_parallel(true)
	tween.tween_property(rudolph, "position", new_vector, 1)
	tween.tween_property(santa, "position", new_vector + Vector2(-38, 0), 1).set_delay(0.25)
	
