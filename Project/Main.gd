extends Node2D

func _ready():
	pass


func _on_start_game():
	$SceneLoader.change_scene("TestScene")
	$CanvasLayer/Menu.hide()
	pass # Replace with function body.
