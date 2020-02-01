extends Node2D

export var isStatic = false
export var isDraggable = false
var can_drag = false
var offset
var firstBuy = false

func _ready():
	$RigidBody2D.mode = RigidBody2D.MODE_STATIC
	var mass = 0
	for node in $RigidBody2D.get_children():
		if(node.is_class("Sprite")):
			mass += 1
	$RigidBody2D.mass = mass
	#print(get_class() + " Mass: " + str(mass))
	offset = $RigidBody2D.position-position
	pass

func on_Block_enablePhysics():
	if(!isStatic):
		$RigidBody2D.mode = RigidBody2D.MODE_RIGID
	

func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	if $RigidBody2D.mode == RigidBody2D.MODE_STATIC and isDraggable:
		if event is InputEventMouseButton:
			can_drag = event.pressed

func _process(delta):
	if (Input.is_mouse_button_pressed(BUTTON_LEFT)):
		if(firstBuy):
			firstBuy = false
	elif (Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag) or firstBuy:
		var curPos = get_global_mouse_position()
			
		print(str(offset) + " : " + str(position))
		position = curPos-offset		
		var x = fmod(position.x, 8)
		var y = fmod(position.y, 8)
		if x < 4:
			position.x -= x
		else:
			position.x += (8-x)
		position.y -= y
