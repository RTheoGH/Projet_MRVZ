extends Area3D
class_name Interactable

@export var is_collectible : bool

func on_interaction():
	print(self, " : Tu as intéragis avec moi !")
	if is_collectible:
		pick_up()

func pick_up():
	print("Tu m'as récupéré !")
