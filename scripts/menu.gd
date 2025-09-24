extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Chargement.hide()
	$chargement_block.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Chargement.play("default")
	pass

func _on_quitter_pressed() -> void:
	get_tree().quit()

var cpt = 0
const messages = [
	"Chargement de la fac...",
	"Spawn des plantes...",
	"Lancement..."
]


func _on_jouer_pressed() -> void:
	$Chargement.show()
	$chargement_block.show()
	$plante.hide()
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
	get_tree().change_scene_to_file("res://scenes/propos.tscn")
