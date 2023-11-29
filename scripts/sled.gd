extends Node2D

@onready var rudolph : Node2D = $Reindeer
@onready var santa : Node2D = $Santa
@onready var bridle : Line2D = $Bridle
var present : PackedScene = preload("res://scenes/presents.tscn")
var presents : Array = []

# Set Rudolph 28 pixels away from edge, 38 from middle
func _ready() -> void:
	rudolph.position = santa.position + Vector2(38,2)
	rudolph.play_animation("run")
	SignalManager.connect("clear_queue", clear_array)

# Attach Bridle every frame so it can move with Rudolph
func _process(_delta) -> void:
	bridle.clear_points()
	bridle.add_point(santa.position)
	bridle.add_point(rudolph.position)

func _input(event) -> void:
	if (Input.is_action_just_pressed("drop") or event is InputEventScreenTouch) and presents.is_empty():
		_spawn_present()	

func _spawn_present() -> void:
	var new_present = present.instantiate()
	new_present.position = santa.position
	presents.append(new_present)
	add_child(new_present)

func clear_array() -> void:
	presents.pop_front()


func _on_tree_entered() -> void:
	SignalManager.emit_signal("sled_node", self)
