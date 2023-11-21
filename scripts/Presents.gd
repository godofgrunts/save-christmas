extends CharacterBody2D

@export var GRAVITY : int = 100

func _ready():
	velocity = Vector2(0, GRAVITY)

func _physics_process(delta):
	move_and_slide()
