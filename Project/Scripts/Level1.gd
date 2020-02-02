extends Node2D

var firstStage = true
var timeOut = 3

func _on_Timer_timeout():
	if firstStage:
		print("Survived 2 seconds?")
		$Timer.wait_time = 3
		$Timer.start()
		firstStage = false
	else:
		print("5 seconds passed.")
