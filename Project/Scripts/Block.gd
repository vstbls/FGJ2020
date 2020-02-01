extends Node2D

export var isStatic = false
export var isDraggable = false
var can_drag = false
var preventDouble = false
var timer = 0

func _ready():
	$RigidBody2D.mode = RigidBody2D.MODE_STATIC
	var mass = 0
	for node in $RigidBody2D.get_children():
		if(node.is_class("Sprite")):
			mass += 1
	$RigidBody2D.mass = mass
	set_process(true)
	pass

func on_Block_enablePhysics():
	if(!isStatic):
		$RigidBody2D.mode = RigidBody2D.MODE_RIGID
	

func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	if $RigidBody2D.mode == RigidBody2D.MODE_STATIC and isDraggable:
		if Input.is_mouse_button_pressed(BUTTON_LEFT) and !can_drag and !preventDouble:
			can_drag = true
			timer = 0
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if can_drag:
		var curPos = get_global_mouse_position()
		position = curPos		
		var x = fmod(position.x, 8)
		var y = fmod(position.y, 8)
		if x < 4:
			position.x -= x
		else:
			position.x += (8-x)
		position.y -= y
	elif preventDouble:
		timer += delta
		if(timer > 0.05):
			preventDouble = false

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(BUTTON_RIGHT) and can_drag:
			rotation_degrees += 90
			if(rotation_degrees == 360):
				rotation_degrees = 0
		elif Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag:
			can_drag = false
			preventDouble = true
			
			var currentMousePos = get_global_mouse_position()
			if(currentMousePos.x > 170 && currentMousePos.y < 50):
				call_deferred("free")
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
