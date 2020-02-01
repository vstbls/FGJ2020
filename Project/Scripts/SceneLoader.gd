extends Node2D

func _ready():
	pass

func change_scene(scene):
	var loaded_scene = load("res://Scenes/" + scene + ".tscn")
	var instanced_scene = loaded_scene.instance()
	
	if $CanvasLayer.get_child_count() != 0:
		#var prev_scene = get_node("Level")
		for child in $CanvasLayer.get_children():
			child.call_deferred("free")
	$CanvasLayer.add_child(instanced_scene)
