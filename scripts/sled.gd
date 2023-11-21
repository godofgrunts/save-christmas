extends Node2D

@onready var rudolph : Node2D = $Reindeer
@onready var base : Sprite2D = $Base
@onready var top : Sprite2D = $Top
@onready var bridle : Line2D = $Bridle



# Set Rudolph 28 pixels away from edge, 38 from middle

func _ready():
	rudolph.position = base.position + Vector2(38,0)
	rudolph.play_animation("run")
	

# Attach Bridle every frame so it can move with Rudolph
func _process(delta):
	bridle.clear_points()
	bridle.add_point(base.position)
	bridle.add_point(rudolph.position)
