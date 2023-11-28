extends Area2D
@export var SPEED : int = -64
@onready var sound : AudioStreamPlayer = $AudioStreamPlayer
@onready var particles : PackedScene = preload("res://scenes/score_particles.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if LevelInfo.level > 1:
		var bus_name = "Level" + str(LevelInfo.level)
		sound.bus = bus_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = SPEED * delta
	self.position += Vector2(x, 0)


func _on_body_entered(body):
	SignalManager.emit_signal("clear_queue")
	LevelInfo.score += 1
	body.queue_free()
	$AudioStreamPlayer.play()
	var new_particle = particles.instantiate()
	new_particle.emitting = true
	add_child(new_particle)
