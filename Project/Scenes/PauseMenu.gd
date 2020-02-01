extends Control

signal resume_game
signal open_menu
signal quit_game

func _ready():
	pass


func _on_ResumeButton_pressed():
	emit_signal("resume_game")
	pass


func _on_MenuButton_pressed():
	emit_signal("open_menu")
	pass


func _on_QuitButton_pressed():
	emit_signal("quit_game")
	pass
