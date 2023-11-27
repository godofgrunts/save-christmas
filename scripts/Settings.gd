extends Control

@onready var volume_slider = $HBoxContainer/MarginContainer/VBoxContainer/HBoxContainer2/VolumeSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	volume_slider.value = 0

func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	


func _on_full_screen_toggle_toggled(button_pressed):
	print(button_pressed)
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_button_pressed():
	SignalManager.emit_signal("exit_settings")
