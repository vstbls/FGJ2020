extends Control

func set_text(text):
	$Bg/Label.text = text
	
func timer(t):
	return get_tree().create_timer(t)

func set_victory(starCount):
	Engine.time_scale = 1
	if starCount >= 1:
		yield(timer(0.5), "timeout")
		$Bg/Stars/Star1.get_star()
	if starCount >= 2:
		yield(timer(0.5), "timeout")
		$Bg/Stars/Star2.get_star()
	if starCount >= 3:
		yield(timer(0.5), "timeout")
		$Bg/Stars/Star3.get_star()
		
func _on_Continue_pressed():
	var level_nodes = get_tree().get_nodes_in_group("Levels")
	for level_node in level_nodes:
		level_node.call("update_stars")
	var sceneLoader = get_node("/root/Root/SceneLoader")
	hide()
	sceneLoader.unload_current_scene()
	sceneLoader.hide_buttons()
	yield(get_node("/root/Root/TransitionLayer/Transition/AnimationPlayer"), "animation_finished")
	get_node("/root/Root/LevelMap").show()
	hide()
	Globals.save_game()
	queue_free()


func _on_Retry_pressed():
	Globals.restart_level()
	queue_free()
