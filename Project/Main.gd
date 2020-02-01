extends Node2D

func _ready():
	OS.window_size = Vector2(OS.window_size.x * 4, OS.window_size.y * 4)


func _on_start_game():
	$SceneLoader.change_scene("LevelMap")
	$CanvasLayer/Menu.hide()
