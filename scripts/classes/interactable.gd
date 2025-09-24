extends Area3D
class_name Interactable

@export var is_collectible : bool

func on_pick_up():
	print(self, " : Tu as intéragis avec moi !")
	pass
