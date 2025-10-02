extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$turn.volume_db = Global.ui_volume
	$close.volume_db = Global.ui_volume
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$turn.volume_db = Global.ui_volume
	$close.volume_db = Global.ui_volume
	pass



func _on_button_2_pressed() -> void:
	$turn.play()
	$AnimatedSprite2D.play("turn_right")


func _on_button_pressed() -> void:
	$close.play()
	self.hide()


func _on_button_3_pressed() -> void:
	$turn.play()
	$AnimatedSprite2D.play("turn_left")
