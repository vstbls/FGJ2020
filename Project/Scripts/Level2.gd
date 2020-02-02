extends Node2D

var firstStage = true
var timeOut = 3
var tomPos
var stars

func _ready():
	stars = 0
	tomPos = $NPC/RigidBody2D.position

func _on_Timer_timeout():
	var curPos = $NPC/RigidBody2D.position
	var blockCount
	if firstStage:
		if curPos.y<48:
			stars = 1
		$Timer.wait_time = 3
		$Timer.start()
		firstStage = false
	else:
		blockCount = get_node("/root/Root/SceneLoader/CanvasLayer").get_child_count() - 1
		if curPos.y<48:
			stars = 2
			if blockCount < 4:
				stars = 3
		var levelComplete = load("res://Scenes/LevelComplete.tscn")
		var complete_instance = levelComplete.instance()
		complete_instance.set_text("Blocks used: " + str(blockCount))
		complete_instance.set_victory(stars)
		get_node("/root/Root/TransitionLayer").add_child(complete_instance)
		if Globals.levelstats["Level2"].stars < stars: Globals.levelstats["Level2"].stars = stars
