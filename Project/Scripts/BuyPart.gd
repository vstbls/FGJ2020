extends Control

var blockI
var blockJ
var blockL
var blockO
var blockS
var blockZ
var blockT
var canvas

func _ready():
	blockI = preload("res://Scenes/TetBlocks/TetI.tscn")
	blockJ = preload("res://Scenes/TetBlocks/TetJ.tscn")
	blockL = preload("res://Scenes/TetBlocks/TetL.tscn")
	blockO = preload("res://Scenes/TetBlocks/TetO.tscn")
	blockS = preload("res://Scenes/TetBlocks/TetS.tscn")
	blockZ = preload("res://Scenes/TetBlocks/TetZ.tscn")
	blockT = preload("res://Scenes/TetBlocks/TetT.tscn")
	
	canvas = get_node("/root/Root/SceneLoader/CanvasLayer")
	pass # Replace with function body.

func _on_ShopButton_pressed(btnName):
	print(btnName)
	match btnName:
		"BuyI":
			var inst = blockI.instance()
			canvas.add_child(inst)
			inst.position = get_global_mouse_position()
			print(inst.get_path())
		"BuyJ":
			var inst = blockJ.instance()
			canvas.add_child(inst)
		"BuyL":
			var inst = blockL.instance()
			canvas.add_child(inst)
		"BuyO":
			var inst = blockO.instance()
			canvas.add_child(inst)
		"BuyS":
			var inst = blockS.instance()
			canvas.add_child(inst)
		"BuyZ":
			var inst = blockZ.instance()
			canvas.add_child(inst)
		"BuyT":
			var inst = blockT.instance()
			canvas.add_child(inst)
	pass # Replace with function body.
