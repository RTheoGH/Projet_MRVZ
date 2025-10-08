extends Control

@export var player: Node3D
@onready var masque = $masque
@onready var container = $masque/Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	container.pivot_offset = masque.size * 0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.isPaused:
		self.hide()
	else:
		self.show()
	if !player:
		return
	
	var la_camera_du_player = player.get_node("Camera3D")
	container.position = -Vector2(player.global_position.x,player.global_position.y)*100
	container.rotation = -la_camera_du_player.rotation.y
