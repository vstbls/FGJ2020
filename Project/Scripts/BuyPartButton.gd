extends TextureButton

signal buyButton(btnName)

func _ready():
	pass


func _on_Buy_pressed():
	emit_signal("buyButton", name)
	pass # Replace with function body.
