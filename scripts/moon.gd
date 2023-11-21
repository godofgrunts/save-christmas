extends Node2D

@onready var path = $Path2D/PathFollow2D
@export var level_time : float = 70.0
var length_of_path : float
var pps : float

func _ready():
	path.set_progress_ratio(100.0)
	length_of_path = path.get_progress()
	path.set_progress_ratio(0)
	pps = length_of_path/level_time
	

func _process(delta):
	path.set_progress(path.get_progress() + 4.92 * delta)
	#path.set_progress_ratio(path.get_progress_ratio() + (0.0238 * delta))
	pass



