extends Node2D

signal change_the_scene_right_now

func transition():
	$AnimationPlayer.play("ToBlack")
	yield($AnimationPlayer, "animation_finished")
	emit_signal("change_the_scene_right_now")
	$AnimationPlayer.play("FromBlack")
	yield($AnimationPlayer, "animation_finished")
