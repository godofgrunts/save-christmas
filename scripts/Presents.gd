extends CharacterBody2D

@export var GRAVITY : int = 100

func _ready() -> void:
	velocity = Vector2(0, GRAVITY)

func _physics_process(_delta) -> void:
	move_and_slide()
