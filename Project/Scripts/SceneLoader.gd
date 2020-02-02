extends Node2D

var currentScene
signal scene_changed

func _ready():
	pass

func change_scene(scene):
	currentScene = scene
	var loaded_scene = load("res://Scenes/Levels/" + scene + ".tscn")
	var instanced_scene = loaded_scene.instance()
	get_node("/root/Root/TransitionLayer/Transition").transition()
	yield(get_node("/root/Root/TransitionLayer/Transition"), "change_the_scene_right_now")
	var simBtn = get_node("/root/Root/ButtonLayer/SimulationButton")
	simBtn.currentLevelNode = instanced_scene
	if $CanvasLayer.get_child_count() != 0:
		#var prev_scene = get_node("Level")
		for child in $CanvasLayer.get_children():
			child.call_deferred("free")
	$CanvasLayer.add_child(instanced_scene)
	emit_signal("scene_changed")

func unload_current_scene():
	get_node("/root/Root/TransitionLayer/Transition").transition()
	yield(get_node("/root/Root/TransitionLayer/Transition"), "change_the_scene_right_now")
	if $CanvasLayer.get_child_count() != 0:
		for child in $CanvasLayer.get_children():
			child.call_deferred("free")
	emit_signal("scene_changed")

func hide_buttons():
	var buttonLayer = get_node("/root/Root/ButtonLayer")
	var canvasLayer = get_node("/root/Root/CanvasLayer")
	var simButton = buttonLayer.get_node("SimulationButton")
	simButton.get_node("PlayResetButton").set_pressed(false)
	simButton.get_node("SpeedButton").set_pressed(false)
	simButton.isStart = true
	Engine.time_scale = 1
	simButton.isDefaultSpeed = true
	simButton.hide()
	buttonLayer.get_node("PauseButton").hide()
	canvasLayer.get_node("PartShop").hide()
	
func show_buttons():
	var buttonLayer = get_node("/root/Root/ButtonLayer")
	var canvasLayer = get_node("/root/Root/CanvasLayer")
	buttonLayer.get_node("SimulationButton").show()
	buttonLayer.get_node("PauseButton").show()
	canvasLayer.get_node("PartShop").show()
