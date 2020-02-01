extends Node2D

func update_stars(count):
	count = clamp(count, 0, 3)
	$AnimatedSprite.frame = count
