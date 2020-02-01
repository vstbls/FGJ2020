extends Node2D

signal level_select(selectedlevel)

func _ready():
	pass


func _on_LevelButton_level_picked(levelname):
	emit_signal("level_select", levelname)
