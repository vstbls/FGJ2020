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
	var inst
	match btnName:
		"BuyI":
			inst = blockI.instance()
		"BuyJ":
			inst = blockJ.instance()
		"BuyL":
			inst = blockL.instance()
		"BuyO":
			inst = blockO.instance()
		"BuyS":
			inst = blockS.instance()
		"BuyZ":
			inst = blockZ.instance()
		"BuyT":
			inst = blockT.instance()
			
	canvas.add_child(inst)
	inst.position = get_global_mouse_position()
	inst.isDraggable = true
	inst.get_node("RigidBody2D").set_pickable(true)
	inst.modulate = Color(rand_range(0.8, 1),rand_range(0, 0.3),rand_range(0, 0.3))
	inst.can_drag = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.
