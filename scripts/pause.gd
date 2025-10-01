extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Book.hide()
	$Options.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Global.isPaused:
		$Options.hide()
	pass


func _on_continuer_pressed() -> void:
	Global.isPaused = false
	

func _on_quitter_pressed() -> void:
	Global.isPaused = false
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")


func _on_progress_pressed() -> void:
	$Book.show()
	$Book/AnimatedSprite2D.play("default")

func _on_options_pressed() -> void:
	$Options.show()
