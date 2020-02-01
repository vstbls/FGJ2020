extends Node2D

export var isStatic = false
export var isDraggable = false
var can_drag = false

func _ready():
	OS.window_size = Vector2(1024,576)
	if(!isStatic):
		$RigidBody2D.mode = RigidBody2D.MODE_RIGID
	pass

func on_Block_enablePhysics():
	if(!isStatic):
		$RigidBody2D.mode = RigidBody2D.MODE_RIGID
	

func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	print(isDraggable)
	if $RigidBody2D.mode == RigidBody2D.MODE_STATIC and isDraggable:
		if event is InputEventMouseButton:
			can_drag = event.pressed
			print("Draggable")

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag:
		var curPos = get_global_mouse_position()
		var x = fmod(curPos.x, 8)
		var y = fmod(curPos.y, 8)
		if x < 4:
			curPos.x -= x
		else:
			curPos.x += (8-x)
		
		if y < 4:
			curPos.y -= y
		else:
			curPos.y += (8-y)
			
		position = curPos
