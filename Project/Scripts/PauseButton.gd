extends Control

signal pause_game

func _on_PauseBtn_pressed():
	emit_signal("pause_game")
	pass # Replace with function body.
