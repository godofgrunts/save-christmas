extends Node2D

@onready var rudolph : Node2D = $Reindeer
@onready var base : Sprite2D = $Santa/Base
@onready var top : Sprite2D = $Santa/Top
@onready var santa : Node2D = $Santa
@onready var bridle : Line2D = $Bridle
var old_santa_position : Vector2
var old_rudolph_position : Vector2

# Set Rudolph 28 pixels away from edge, 38 from middle
func _ready():
	rudolph.position = base.position + Vector2(38,0)
	rudolph.play_animation("run")
	tween_them()

# Attach Bridle every frame so it can move with Rudolph
func _process(delta):
	bridle.clear_points()
	bridle.add_point(santa.position)
	bridle.add_point(rudolph.position)

func tween_them() -> void:
	old_rudolph_position = rudolph.position
	old_santa_position = santa.position
	var tween = get_tree().create_tween()
	tween.connect("finished", tween_them)
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.set_ease(Tween.EASE_IN)
	tween.set_parallel(true)
	tween.tween_property(rudolph, "position", Vector2(38, -15), 5)
	tween.tween_property(santa, "position", Vector2(0, -15), 5).set_delay(0.5)
	tween.chain().tween_property(rudolph, "position", old_rudolph_position, 5)
	tween.tween_property(santa, "position", old_santa_position, 5).set_delay(0.5)

func set_level(num :int) -> void:
	pass
