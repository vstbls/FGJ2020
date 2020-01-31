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
	if $RigidBody2D.mode == RigidBody2D.MODE_STATIC and isDraggable:
		if event is InputEventMouseButton:
			can_drag = event.pressed
			print("Draggable")

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag:
		position = get_global_mouse_position()
