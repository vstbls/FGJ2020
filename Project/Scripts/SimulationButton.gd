extends Control



func _on_TextureButton_pressed():
	get_tree().call_group("Blocks", "on_Block_enablePhysics")
	pass # Replace with function body.
