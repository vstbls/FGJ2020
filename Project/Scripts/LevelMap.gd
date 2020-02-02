extends Node2D

signal level_select(selectedlevel)

func _ready():
	pass


func _on_LevelButton_level_picked(levelname):
	emit_signal("level_select", levelname)


func _on_MenuButton_pressed():
	get_node("/root/Root/TransitionLayer/Transition").transition()
	yield(get_node("/root/Root/TransitionLayer/Transition"), "change_the_scene_right_now")
	hide()
	get_node("/root/Root/CanvasLayer/Menu").show()
	pass
