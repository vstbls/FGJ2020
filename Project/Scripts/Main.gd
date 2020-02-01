extends Node2D

func _ready():
	OS.window_size = Vector2(OS.window_size.x * 4, OS.window_size.y * 4)
	$CanvasLayer/SimulationButton.hide()
	$CanvasLayer/PartShop.hide()
	pass


func _on_start_game():
	#$SceneLoader.change_scene("Level1")
	$CanvasLayer/Menu.hide()
	$CanvasLayer/PartShop.hide()
	$LevelMap.show()
	$CanvasLayer/SimulationButton.hide()
	pass # Replace with function body.


func _on_LevelMap_level_select(selectedlevel):
	$SceneLoader.change_scene(selectedlevel)
	$LevelMap.hide()
	$CanvasLayer/PartShop.show()
	$CanvasLayer/SimulationButton.show()
