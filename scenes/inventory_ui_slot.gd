extends Panel

@onready var item_display : TextureRect = $item_display

func update_inventory_visual(item : InventoryItem):
	if(!item):
		item_display.visible = false
	else:
		item_display.visible = true
		item_display.texture = item.texture
		
