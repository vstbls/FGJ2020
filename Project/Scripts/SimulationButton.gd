extends Control

var isStart = true

func _on_TextureButton_pressed():
	if(isStart):
		get_tree().call_group("Blocks", "on_Block_enablePhysics")
		isStart = false
	else:
		var sceneLoader = get_node("/root/Root/SceneLoader")
		sceneLoader.change_scene(sceneLoader.currentScene)
	pass # Replace with function body.
