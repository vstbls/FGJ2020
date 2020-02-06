extends Control
func _ready():
	pass
func _on_Button_pressed():
	var block = get_node("/root/Root").currentBlock
	if(block):
		block.rotate()
	