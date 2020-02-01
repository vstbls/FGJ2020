extends Node2D

func _ready():
	OS.window_size = Vector2(OS.window_size.x * 4, OS.window_size.y * 4)
	$CanvasLayer/SimulationButton.hide()
	$CanvasLayer/PartShop.hide()
	pass


func _on_start_game():
	#$SceneLoader.change_scene("Level1")
	$CanvasLayer/Menu.hide()
	$CanvasLayer/PartShop.show()
	$LevelMap.show()
	$CanvasLayer/SimulationButton.show()
	pass # Replace with function body.
