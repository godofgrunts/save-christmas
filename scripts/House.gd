extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sparkles.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = -64 * delta
	self.position += Vector2(x, 0)


func _on_body_entered(body):
	SignalManager.emit_signal("gain_point", 1)
	body.queue_free()
	$AnimationPlayer.play("sparkle")
