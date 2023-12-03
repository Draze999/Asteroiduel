extends CanvasLayer

class_name ui
signal game_started

@onready var start= $start

func _on_start_button_pressed():
	game_started.emit()
