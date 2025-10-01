extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Pause.visible = false
	$AudioStreamPlayer2D.volume_db = Global.music_volume
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AudioStreamPlayer2D.volume_db = Global.music_volume
	if Global.isPaused:
		$Pause.visible = true
	else:
		$Pause.visible = false
