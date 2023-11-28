extends Node2D

var can_continue = false
@onready var score : Label = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	score.text = str(LevelInfo.score)
	if LevelInfo.level == 5:
		$GameOver.visible = true

func _unhandled_input(_event):
	if Input.is_action_just_pressed("drop") and can_continue:
		if LevelInfo.level != 5:
			LevelInfo.level += 1
		else:
			LevelInfo.level = 0
			LevelInfo.score = 0
		SignalManager.emit_signal("new_round")


func _on_timer_timeout():
	$Score2.visible = true
	can_continue = true
