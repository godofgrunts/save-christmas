extends Node2D

@onready var ground : Node2D = $Ground
@onready var anim : AnimationPlayer = $Ground/AnimationPlayer

func _ready() -> void:
	anim.play("idle")

func play_animation(anim_name : String) -> void:
	anim.play(anim_name)
