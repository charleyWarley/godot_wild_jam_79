extends StaticBody2D

@export var planter_index : int

var slots : Array[Dictionary] = []

@onready var PLANTER_SLOTS := $PlanterSlots


func _ready() -> void:
	add_to_group("interactable")
	initialize_planter()


func initialize_planter() -> void:
	slots = Interactables.planters[planter_index]
	var slot_index := 0
	for slot : Dictionary in slots:
		if slot["plant_type"] != "":
			var current_slot := PLANTER_SLOTS.get_child(slot_index)
			current_slot.texture = Interactables.PLANT_TEXTURES[slot["plant_type"]]
			
			if slot["plant_type"] == "bamboo": current_slot.offset = slot["offset"]
		
		slot_index += 1


func interact() -> bool:
	check_slots(&"bamboo")
	return false


func check_slots(plant_type: StringName) -> void:
	var slot_index := 0
	for slot : Dictionary in slots:
		if slot["plant_type"] != "":
			#slot is full
			slot_index += 1
			continue 
		
		#slot is empty
		slot["plant_type"] = plant_type
		var current_slot : Sprite2D = PLANTER_SLOTS.get_child(slot_index)
		current_slot.texture = Interactables.PLANT_TEXTURES[plant_type]
		
		if plant_type == "bamboo": current_slot.offset = slot["offset"]
		else: current_slot.offset = Vector2.ZERO
		
		slot_index += 1
		break
			
