extends Node2D

@onready var gulp : AudioStreamPlayer = $AudioStreamPlayer
@onready var anim : AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("drink")

func _gulp() -> void:
	gulp.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"drink":
			anim.play("throw")
		"throw":
			anim.play("zoom_out")
