extends Control

var isStart = true
var isDefaultSpeed = true
var currentLevelNode

#func reset_buttons():
#	$PlayResetButton.pressed = false
#	$SpeedButton.pressed = false
#	^^ broken or something, see globals

func _on_TextureButton_pressed():
	if(isStart):
		get_tree().call_group("Blocks", "on_Block_enablePhysics")
		currentLevelNode.get_node("Timer").start()
		currentLevelNode.get_node("Countdown").start()
		isStart = false
	else:
		Globals.restart_level()
		
	pass # Replace with function body.


func _on_SpeedButton_pressed():
	if(isDefaultSpeed):
		Engine.time_scale = 2
		isDefaultSpeed = false
	else:
		Engine.time_scale = 1
		isDefaultSpeed = true
	pass # Replace with function body.
