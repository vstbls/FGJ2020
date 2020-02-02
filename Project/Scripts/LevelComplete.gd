extends Control

func set_text(text):
	$Panel/Label.text = text

func set_victory(starCount):
	match starCount:
		0:
			$Panel/Complete.text = "LEVEL FAILED!"
		1:
			pass
		2:
			pass
		3:
			pass

func _on_button_pressed():
	var sceneLoader = get_node("/root/Root/SceneLoader")
	sceneLoader.unload_current_scene()
	sceneLoader.hide_buttons()
	get_node("/root/Root/LevelMap").show()
	queue_free()
