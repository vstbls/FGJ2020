extends Control

signal start_game()
signal open_options()
signal quit_game()

func _ready():
	pass


func _on_StartButton_pressed():
	emit_signal("start_game")
	get_node("/root/Root/Music/SfxButton").play()


func _on_OptionsButton_pressed():
	emit_signal("open_options")
	get_node("/root/Root/Music/SfxButton").play()


func _on_QuitButton_pressed():
	emit_signal("quit_game")
	get_node("/root/Root/Music/SfxButton").play()
