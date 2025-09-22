extends Node

var isPaused

func _ready() -> void:
	isPaused = false

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("pause")):
		isPaused = !isPaused
