extends "res://Scripts/Block.gd"



func _on_RigidBody2D_body_entered(body):
	if "Tet" in body.get_parent().name and body.get_linear_velocity().length()>20:
		$RigidBody2D/BloodEmitter/Particles2D.set_emitting(true)
		$RigidBody2D/Sprite.play("dead")
	pass
