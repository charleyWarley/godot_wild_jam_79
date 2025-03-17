extends StaticBody2D

const PLANT_TEXTURES : Dictionary[String, Variant]= {
	"moss": preload("uid://bdfav7jl36syd"),
}

@export var planter_index : int

var slots : Array = [
	"",
	"",
	"",
	"",
	"",
]

@onready var PLANTER_SLOTS := $PlanterSlots


func _ready() -> void:
	add_to_group("interactable")
	initialize_planter()


func initialize_planter() -> void:
	slots = Interactables.planters[planter_index]
	var slot_index := 0
	for slot : String in slots:
		if slot == "":
			return
		else:
			PLANTER_SLOTS.get_child(slot_index).texture = PLANT_TEXTURES[slots[slot_index]]
			slot_index += 1


func interact() -> bool:
	check_slots("moss")
	return false


func check_slots(plant_type: String) -> void:
	var slot_index := 0
	for slot : String in slots:
		if slot == "":
			slots[slot_index] = plant_type
			PLANTER_SLOTS.get_child(slot_index).texture = PLANT_TEXTURES[plant_type]
			break
		else:
			slot_index += 1
			
