extends Node

const PLANT_TEXTURES : Dictionary[String, Variant]= {
	"moss": preload("uid://bdfav7jl36syd"),
	"bamboo": preload("uid://dokkyjl80v2dp"),
}

var bones : Array[int] = [
	0, 1, 2, 3, 4, 5, #area1
	6, 7, 8, 9, 10, 11, 12, 13, 14, 15, #area2
	16, 17, 18, 19, 20, 21, 22, 23, 24, 25, #area4
	]
var planters : Array[Array] = []

var bones_collected : int = 0
var moss_harvested : int = 0
var bamboo_harvested : int = 0



func _ready() -> void:
	for i in range(6):
		var current_planter : Array[Dictionary]= []
		for j in range(5):
			current_planter.append({
				"plant_type": "", 
				"offset": get_random_offset(),
				"time_planted": 0.0,
				})
		planters.append(current_planter)


func get_random_offset() -> Vector2:
	var offset := Vector2.ZERO
	offset.x = randi_range(-2, 2)
	offset.y = randi_range(-3, 0)
	return offset
