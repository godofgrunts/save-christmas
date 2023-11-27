extends Control

func _on_return_pressed():
	self.visible = false
	get_tree().paused = false

func _on_exit_pressed():
	get_tree().quit()
