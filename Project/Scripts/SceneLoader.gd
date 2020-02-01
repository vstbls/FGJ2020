extends Node2D

var currentScene
signal scene_changed

func _ready():
	pass

func change_scene(scene):
	currentScene = scene
	var loaded_scene = load("res://Scenes/" + scene + ".tscn")
	var instanced_scene = loaded_scene.instance()
	var simBtn = get_node("/root/Root/CanvasLayer/SimulationButton")
	get_node("/root/Root/CanvasLayer/Transition").transition()
	yield(get_node("/root/Root/CanvasLayer/Transition"), "change_the_scene_right_now")
	simBtn.currentLevelNode = instanced_scene
	if $CanvasLayer.get_child_count() != 0:
		#var prev_scene = get_node("Level")
		for child in $CanvasLayer.get_children():
			child.call_deferred("free")
	$CanvasLayer.add_child(instanced_scene)
	emit_signal("scene_changed")
