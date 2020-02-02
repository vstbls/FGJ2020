extends Node2D

signal level_select(selectedlevel)

func _ready():
	pass


func _on_LevelButton_level_picked(levelname):
	emit_signal("level_select", levelname)


func _on_MenuButton_pressed():
	hide()
	get_node("/root/Root/CanvasLayer/Menu").show()
	pass
