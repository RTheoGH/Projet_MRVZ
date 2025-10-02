extends Control

var time_before_transition := 3
var transition_time := 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.volume_db = Global.ui_volume
	$Options.hide()
	$Chargement.hide()
	$chargement_block.hide()
	$Backgrounds.play("default")
	$spirale.material.set_shader_parameter("progression",0)
	$Backgrounds.frame_changed.connect(
		func ():
			transition()
	)
	$Backgrounds.frame += 1
	pass # Replace with function body.

func transition() -> void:
	await get_tree().create_timer(time_before_transition).timeout
	var tween = get_tree().create_tween()
	
	tween.tween_method(
		(func (val: float):
			$spirale.material.set_shader_parameter("progression",val)
			)
		,
		0.0,
		1.1,
		transition_time
	)
	await tween.finished
	$spirale.material.set_shader_parameter("progression",0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AudioStreamPlayer2D.volume_db = Global.ui_volume
	$Chargement.play("default")
	pass

func _on_quitter_pressed() -> void:
	$AudioStreamPlayer2D.play()
	get_tree().quit()

var cpt = 0
const messages = [
	"Chargement de la fac...",
	"Spawn des plantes...",
	"Lancement..."
]

func launch_hide() -> void:
	$plante.hide()
	$plante2.hide()
	$sous_menu.hide()
	$propos.hide()

func _on_jouer_pressed() -> void:
	$AudioStreamPlayer2D.play()
	$Chargement.show()
	$chargement_block.show()
	launch_hide()
	$Timer.start()
	#get_tree().change_scene_to_file("res://scenes/Scene.tscn")


func _on_timer_timeout() -> void:
	if cpt < messages.size():
		$chargement_block/texte.text += " "+messages[cpt]+"\n"
		cpt += 1
	else:
		$Chargement.hide()
		$chargement_block.hide()
		$plante.show()
		get_tree().change_scene_to_file("res://scenes/Scene.tscn")


func _on_propos_pressed() -> void:
	$AudioStreamPlayer2D.play()
	get_tree().change_scene_to_file("res://scenes/propos.tscn")


func _on_options_pressed() -> void:
	$AudioStreamPlayer2D.play()
	$Options.show()
