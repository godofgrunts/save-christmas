extends Control

func _on_return_pressed() -> void:
	self.visible = false
	get_tree().paused = false

func _on_exit_pressed() -> void:
	get_tree().quit()
