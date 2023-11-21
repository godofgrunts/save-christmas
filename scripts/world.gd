extends Node2D

@onready var present : PackedScene = preload("res://scenes/presents.tscn")
var can_drop_present : bool = true
var is_round_ended : bool = false
var points : int = 0

func _ready():
	SignalManager.connect("gain_point", gained_point)
	SignalManager.connect("round_finished", round_end)

func _unhandled_input(event) -> void:
	if Input.is_action_just_pressed("drop"):
		drop_present()

func round_end() -> void:
	$RoundEnd.position = (get_viewport_rect().size / 2) - ($RoundEnd.get_minimum_size() / 2)
	$RoundEnd.visible = true
	$PresentCooldown.queue_free()
	can_drop_present = false
	is_round_ended = true

func drop_present() -> void:
	if can_drop_present:
		can_drop_present = false
		$PresentCooldown.start()
		var new_present = present.instantiate()
		new_present.position = $Sled/Base.global_position
		self.add_child(new_present)

func gained_point() -> void:
	can_drop_present = true
	points += 1
	$Points.text = "Points: %s" % str(points)


func _on_present_cooldown_timeout():
	if is_round_ended == false:
		can_drop_present = true


func _on_kill_zone_body_entered(body):
	body.queue_free()
