extends Node2D

func _ready():
	OS.window_size = Vector2(OS.window_size.x * 3, OS.window_size.y * 3)
	$CanvasLayer/SimulationButton.hide()
	$CanvasLayer/PartShop.hide()
	var screen_size = OS.get_screen_size()
	var window_size = OS.window_size
	OS.window_position = screen_size*0.5 - window_size*0.5
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

func _on_Menu_open_options():
	Globals.save_game()


func _on_Menu_quit_game():
	Globals.load_game()
