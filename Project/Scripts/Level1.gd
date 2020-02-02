extends Node2D

var firstStage = true
var timeOut = 3
var timeLeft = 5
var timeLeftCurrent = 5
var tomPos
var stars

func _ready():
	stars = 0
	tomPos = $NPC/RigidBody2D.position
	timeLeftCurrent = timeLeft
	$TimeLeft.text = "Time Left: " + str(timeLeftCurrent)

func _on_Timer_timeout():
	var curPos = $NPC/RigidBody2D.position
	var blockCount
	if firstStage:
		if abs(curPos.x-tomPos.x)<0.5 and abs(curPos.y-tomPos.y)<0.5:
			stars = 1
		$Timer.wait_time = 3.1
		$Timer.start()
		firstStage = false
	else:
		blockCount = get_node("/root/Root/SceneLoader/CanvasLayer").get_child_count() - 1
		if abs(curPos.x-tomPos.x)<0.5 and abs(curPos.y-tomPos.y)<0.5:
			stars = 2
			if blockCount == 1:
				stars = 3
		$Countdown.stop()
		var levelComplete = load("res://Scenes/LevelComplete.tscn")
		var complete_instance = levelComplete.instance()
		complete_instance.set_text("Blocks used: " + str(blockCount))
		complete_instance.set_victory(stars)
		get_node("/root/Root/TransitionLayer").add_child(complete_instance)
		if Globals.levelstats["Level1"].stars < stars: Globals.levelstats["Level1"].stars = stars


func _on_Countdown_timeout():
	timeLeftCurrent -= 1
	$TimeLeft.text = "Time Left: " + str(timeLeftCurrent)
	pass
