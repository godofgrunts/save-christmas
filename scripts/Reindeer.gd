extends Node2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var anim : AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	anim.play("idle")

func play_animation(anim_name : String) -> void:
	anim.play(anim_name)

func _juice(b : bool) -> void:
	if b:
		self.position += Vector2(0, -1)
	else:
		self.position += Vector2(0, 1)

func _flip() -> void:
	if $Sprite2D.flip_h:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
