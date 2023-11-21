extends ParallaxBackground
@export var SPEED : int
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= SPEED*delta
