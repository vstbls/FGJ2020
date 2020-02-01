extends Control

signal level_picked(levelname)
export var level = ""

func _on_button_down():
	$TextureButton/Label.margin_top = 4


func _on_button_up():
	$TextureButton/Label.margin_top = 2
	emit_signal("level_picked", level)

