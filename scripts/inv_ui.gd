extends Control

@onready var inventory : Inventory = preload("res://inventory/player_inventory.tres")
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
	for i in range(min(inventory.items.size(),slots.size())):
		slots[i].update_inventory_visual(inventory.items[i])

func open():
	update_slides()
	visible = true
	is_open = true
	Global.isPaused = true
	
func close():
	visible = false
	is_open = false
	Global.isPaused = false
