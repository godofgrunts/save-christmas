extends Node2D

@onready var house : PackedScene = preload("res://scenes/house.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	self.position = get_viewport_rect().size + Vector2(64, 0)

func _on_timer_timeout():
	var new_house = house.instantiate()
	new_house.position += Vector2(0, -29)
	self.add_child(new_house)
	var new_time = randi_range(1, 5)
	$Timer.wait_time = new_time
	$Timer.start()
