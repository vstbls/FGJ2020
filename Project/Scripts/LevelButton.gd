extends Control

signal level_picked(levelname)
export var level = ""

func _ready():
	if level != "":
		$Stars.update_stars(Globals.levelstats[level].stars)
	pass

func _on_button_down():
	$TextureButton/Label.margin_top = 4


func _on_button_up():
	$TextureButton/Label.margin_top = 2

func _on_pressed():
	load_level()

func load_level():
	emit_signal("level_picked", level)
