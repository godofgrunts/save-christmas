extends Control

var sled_node : PackedScene = preload("res://scenes/sled.tscn")

@onready var sled : Node2D = $Sled
@onready var rudolph : Node2D  = $Sled/Reindeer
@onready var santa : Node2D  = $Sled/Santa
@onready var anim : AnimationPlayer = $AnimationPlayer
@onready var click : AudioStreamPlayer = $Click
var rudolph_position : Vector2
var santa_position : Vector2

func _ready() -> void:
	SignalManager.connect("exit_settings", _exit_settings)
	anim.play("title")
	
func _tween() -> void:
	rudolph_position = rudolph.position
	santa_position = santa.position
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_EXPO)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_parallel(true)
	tween.tween_property(rudolph, "position", rudolph_position + Vector2(300, -30), 3)
	tween.tween_property(santa, "position", santa_position + Vector2(300, -30), 3).set_delay(0.25)
	pass

func _on_start_button_pressed() -> void:
	click.play()
	LevelInfo.level = 1
	SignalManager.emit_signal("new_round")
	pass # Replace with function body.

func _on_settings_button_pressed() -> void:
	click.play()
	$MarginContainer/MarginContainer.visible = true
	
func _exit_settings() -> void:
	$MarginContainer/MarginContainer.visible = false

func _on_quit_button_pressed() -> void:
	click.play()
	get_tree().quit()


