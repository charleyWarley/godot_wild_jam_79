extends StaticBody2D


func _ready() -> void:
	add_to_group("interactable")


func interact() -> bool:
	print("poop hands")
	return false
