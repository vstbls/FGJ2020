extends Control

var star_sprite = load("res://Sprites/star_big.png")

func get_star():
	$StarEmitter.emit()
	$StarTexture.texture = star_sprite
	pass
