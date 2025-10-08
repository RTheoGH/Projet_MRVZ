extends Node

var isPaused
var cam_speed = 0.3
var music_volume = 100
var ui_volume = 100

func _ready() -> void:
	isPaused = false

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("pause")):
		isPaused = !isPaused

	if(Input.is_action_just_pressed("fullscreen")):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
