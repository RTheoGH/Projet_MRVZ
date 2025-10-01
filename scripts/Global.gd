extends Node

var isPaused
var cam_speed = 0.3
var music_volume = 100

func _ready() -> void:
	isPaused = false

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("pause")):
		isPaused = !isPaused
