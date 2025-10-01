extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_2_pressed() -> void:
	$AnimatedSprite2D.play("turn_right")


func _on_button_pressed() -> void:
	self.hide()


func _on_button_3_pressed() -> void:
	$AnimatedSprite2D.play("turn_left")
