extends Node2D

@onready var path = $Path2D/PathFollow2D
@export var level_time : float
var length_of_path : float
var pps : float

func _ready() -> void:
	path.set_progress_ratio(1.0)
	length_of_path = path.get_progress()
	path.set_progress_ratio(0)
	pps = length_of_path/level_time
	

func _process(delta) -> void:
	path.set_progress(path.get_progress() + pps * delta)
	_check_time()

func _check_time() -> void:
	if path.get_progress_ratio() >= 1.0:
		SignalManager.emit_signal("round_finished")
