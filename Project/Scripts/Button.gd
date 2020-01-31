extends Button

func _ready():
	pass

func _toggled(button_pressed):
	if pressed:
		$SceneLoader.change_scene("TestScene")
	else:
		$SceneLoader.change_scene("TestScene2")
