extends Node2D

func _ready():
	OS.window_size = Vector2(OS.window_size.x * 3, OS.window_size.y * 3)
	$ButtonLayer/SimulationButton.hide()
	$ButtonLayer/PauseButton.hide()
	$CanvasLayer/PartShop.hide()
	var screen_size = OS.get_screen_size()
	var window_size = OS.window_size
	OS.window_position = screen_size*0.5 - window_size*0.5
	$ButtonLayer/PauseButton.connect("pause_game", self, "_on_PauseButton_pressed")
	Globals.load_game()
	pass


func _on_start_game():
	$TransitionLayer/Transition.transition()
	yield($TransitionLayer/Transition, "change_the_scene_right_now")
	$CanvasLayer/Menu.hide()
	$LevelMap.show()
	var level_nodes = get_tree().get_nodes_in_group("Levels")
	for level_node in level_nodes:
		level_node.call("update_stars")
	pass # Replace with function body.


func _on_LevelMap_level_select(selectedlevel):
	$SceneLoader.change_scene(selectedlevel)
	yield($SceneLoader, "scene_changed")
	$LevelMap.hide()
	$CanvasLayer/PartShop.show()
	$ButtonLayer/SimulationButton.show()
	$ButtonLayer/PauseButton.show()

func _on_Menu_open_options():
	Globals.save_game()


func _on_Menu_quit_game():
	Globals.load_game()

func _on_PauseButton_pressed():
	var pauseMenu = load("res://Scenes/PauseMenu.tscn")
	var pMenuInstance = pauseMenu.instance()
	$ButtonLayer/PauseButton.hide()
	$ButtonLayer.add_child(pMenuInstance)
	pMenuInstance.connect("resume_game", self, "_on_PauseMenu_resume")
	pMenuInstance.connect("open_menu", self, "_on_pauseMenu_open_MainMenu")
	pMenuInstance.connect("quit_game", self, "_on_Menu_quit_game")
	get_tree().paused = true


func _on_PauseMenu_resume():
	var pMenu = get_node("ButtonLayer/PauseMenu")
	$ButtonLayer/PauseButton.show()
	get_tree().paused = false
	if pMenu:
		pMenu.call_deferred("free")
		
func _on_pauseMenu_open_MainMenu():
	get_tree().paused = false
	var pMenu = get_node("ButtonLayer/PauseMenu")
	$SceneLoader.unload_current_scene()
	yield(get_node("/root/Root/TransitionLayer/Transition"), "change_the_scene_right_now")
	$LevelMap.show()
	$CanvasLayer/PartShop.hide()
	$ButtonLayer/PauseButton.hide()
	$ButtonLayer/SimulationButton/PlayResetButton.set_pressed(false)
	$ButtonLayer/SimulationButton/SpeedButton.set_pressed(false)
	$ButtonLayer/SimulationButton.isStart = true
	Engine.time_scale = 1
	$ButtonLayer/SimulationButton.isDefaultSpeed = true
	$ButtonLayer/SimulationButton.hide()
	if pMenu:
		pMenu.call_deferred("free")
