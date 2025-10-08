extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Map.visible = Global.minimap_activated
	$Pause.visible = false
	$Musique.volume_db = Global.music_volume
	$Musique.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Musique.volume_db = Global.music_volume
	if Global.isPaused:
		$Pause.visible = true
		$Map.visible = false
		$Musique.stream_paused = true
	else:
		$Pause.visible = false
		$Map.visible = Global.minimap_activated
		$Musique.stream_paused = false
