extends Node2D

@onready var gulp : AudioStreamPlayer = $Gulp
@onready var plastic_bottles : AudioStreamPlayer = $PlasticBottles
@onready var door_open : AudioStreamPlayer = $DoorOpenSound
@onready var anim : AnimationPlayer = $AnimationPlayer
@onready var door : Sprite2D = $DoorOpen
var go_next : bool = false
var next_anim_name : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Reindeer._flip()
	anim.play("drink")

func _gulp() -> void:
	gulp.play()
	
func _bottles() -> void:
	plastic_bottles.play()

func _door_open() -> void:
	door_open.play()
	
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("drop") and go_next == true:
		go_next = false
		$SpaceToContinue/Timer.stop()
		$SpaceToContinue.visible = false
		match next_anim_name:
			"santa-line1":
				anim.play("rudolph-line1")
			"rudolph-line1":
				$SantaSpeech1.visible = false
				anim.play("rudolph-line1")
			"santa-line2":
				$RudolphSpeech1.visible = false
				anim.play("santa-line2")
			"run_out":
				$SantaSpeech2.visible = false
				$Reindeer._flip()
				$Santa.play_animation("run")
				anim.play("run_out")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	go_next = true
	match anim_name:
		"drink":
			anim.play("throw")
		"throw":
			anim.play("zoom_out")
		"zoom_out":
			anim.play("santa-line1")
		"santa-line1":
			$SpaceToContinue/Timer.start()
			next_anim_name = "rudolph-line1"
		"rudolph-line1":
			$SpaceToContinue/Timer.start()
			next_anim_name = "santa-line2"
		"santa-line2":
			$SpaceToContinue/Timer.start()
			next_anim_name = "run_out"
		"run_out":
			LevelInfo.cutscene_played = true
			LevelInfo.level = 1
			SignalManager.emit_signal("new_round")


func _on_timer_timeout() -> void:
	if $SpaceToContinue.visible:
		$SpaceToContinue.visible = false
	else:
		$SpaceToContinue.visible = true
