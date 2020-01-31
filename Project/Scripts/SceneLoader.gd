extends Node2D

func _ready():
	pass

func change_scene(scene):
	var loaded_scene = load("res://Scenes/" + scene + ".tscn")
	var instanced_scene = loaded_scene.instance()
	
	if has_node("Level"):
		var prev_scene = get_node("Level")
		remove_child(prev_scene)
		prev_scene.call_deferred("free")
		
	add_child(instanced_scene)
