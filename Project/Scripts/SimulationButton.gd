extends Control

var isStart = true
var isDefaultSpeed = true
var currentLevelNode

func _on_TextureButton_pressed():
	if(isStart):
		get_tree().call_group("Blocks", "on_Block_enablePhysics")
		currentLevelNode.get_node("Timer").start()
		isStart = false
	else:
		var sceneLoader = get_node("/root/Root/SceneLoader")
		sceneLoader.change_scene(sceneLoader.currentScene)
		currentLevelNode.get_node("Timer").stop()
		isStart = true
		
	pass # Replace with function body.


func _on_SpeedButton_pressed():
	var timer = currentLevelNode.get_node("Timer")
	if(isDefaultSpeed):
		Engine.time_scale = 2
		isDefaultSpeed = false
	else:
		Engine.time_scale = 1
		isDefaultSpeed = true
	pass # Replace with function body.
