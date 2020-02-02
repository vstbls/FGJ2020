extends Control

signal level_picked(levelname)
export var level = ""

func _ready():
	if level != "":
		$Stars.update_stars(Globals.levelstats[level].stars)
	pass

func _on_button_down():
	$TextureButton/Label.margin_top = 4


func _on_button_up():
	$TextureButton/Label.margin_top = 2

func _on_pressed():
	emit_signal("level_picked", level)
	yield(get_node("/root/Root/TransitionLayer/Transition"), "change_the_scene_right_now")
	yield(get_node("/root/Root/TransitionLayer/Transition/AnimationPlayer"), "animation_finished")
	Globals.show_dialogue("Tom: Please... just make the tower stop collapsing on me...\nStars:\n*: Keep Tom alive for 2s\n**: 5 seconds\n***: 5 seconds - using one block")
	
