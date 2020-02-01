extends Control

func set_text(text):
	$Panel/Panel/Label.text = text


func _on_button_pressed():
	queue_free()
