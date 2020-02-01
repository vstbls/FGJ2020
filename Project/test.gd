extends Node2D

func _ready():
	OS.window_size = Vector2(1024,576)
	pass


func _on_Button_pressed():
	get_tree().call_group("Blocks", "on_Block_enablePhysics")
	pass # Replace with function body.
