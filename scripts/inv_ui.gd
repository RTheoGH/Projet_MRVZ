extends Control


@onready var slots : Array = $PanelContainer/MarginContainer/HBoxContainer.get_children()

var is_open = false

func _ready():
	close()
	
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		print("hello")
		if is_open:
			close()
		else:
			open()

func update_slides():
	print(slots[0])
	for i in range(min(Global.player_inventory.items.size(),slots.size())):
		slots[i].update_inventory_visual(Global.player_inventory.items[i])

func open():
	update_slides()
	visible = true
	is_open = true
	Global.is_inventory_open = true
	
func close():
	visible = false
	is_open = false
	Global.is_inventory_open = false
