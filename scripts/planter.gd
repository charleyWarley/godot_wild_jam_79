extends StaticBody2D

const BAMBOO_MATURE_TIME := 10.0
const MOSS_MATURE_TIME := 30.0

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
			var slot_sprite : Sprite2D = PLANTER_SLOTS.get_child(slot_index)
			slot_sprite.texture = Interactables.PLANT_TEXTURES[slot["plant_type"]]
			
			var is_matured : bool = check_grow_time(slot["time_planted"], slot["plant_type"])
			if is_matured: slot_sprite.frame = 1
			else: slot_sprite.frame = 0
			
			if slot["plant_type"] == "bamboo": slot_sprite.offset = slot["offset"]
		
		slot_index += 1


func check_grow_time(time_planted: float, plant_type: StringName) -> bool:
	var time_grown: float = Time.get_unix_time_from_system() - time_planted
	var mature_time : float
	match plant_type:
		"moss": mature_time = MOSS_MATURE_TIME
		"bamboo": mature_time = BAMBOO_MATURE_TIME
	var is_matured := true if time_grown >= mature_time else false
	return is_matured


func interact() -> bool:
	var plant_types : Array[StringName] = [&"bamboo", &"moss"]
	randomize()
	var plant_type : StringName = plant_types.pick_random()
	attempt_plant(plant_type)
	#attempt_harvest()
	return false #returns false because interactable is not destroyed


func attempt_plant(plant_type: StringName) -> void:
	var slot_index := 0
	for slot : Dictionary in slots:
		if slot["plant_type"] != "": #skip full slot
			slot_index += 1
			continue 
		
		var slot_sprite : Sprite2D = PLANTER_SLOTS.get_child(slot_index)
		
		slot["plant_type"] = plant_type
		slot_sprite.texture = Interactables.PLANT_TEXTURES[plant_type]
		
		slot["time_planted"] = Time.get_unix_time_from_system()
		
		if plant_type == "bamboo": slot_sprite.offset = slot["offset"]
		else: slot_sprite.offset = Vector2.ZERO
		
		slot_index += 1
		break


func attempt_harvest() -> void:
	var slot_index := 0
	for slot : Dictionary in slots:
		var slot_sprite : Sprite2D = PLANTER_SLOTS.get_child(slot_index)
		if slot["plant_type"] == "": #skip empty slot
			slot_index += 1
			continue
		if slot_sprite.frame == 1: #full slot contains matured plant
			match slot["plant_type"]:
				"moss": Interactables.moss_harvested += 1
				"bamboo": Interactables.bamboo_harvested += 1
			slot_sprite.texture = null
			empty_slot(slot_index)
		slot_index += 1


func empty_slot(slot_index: int) -> void:
	Interactables.planters[planter_index][slot_index]["plant_type"] = ""
	Interactables.planters[planter_index][slot_index]["time_planted"] = 0.0
	slots[slot_index] = Interactables.planters[planter_index][slot_index]
