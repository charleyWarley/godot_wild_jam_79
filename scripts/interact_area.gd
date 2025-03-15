extends Area2D

var interactable_objects := []


func _on_body_entered(body: Node2D) -> void:
	if !body.is_in_group("interactable"): return
	interactable_objects.append(body)


func _on_body_exited(body: Node2D) -> void:
	interactable_objects.erase(body)


func _ready() -> void:
	connect_signals()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		attempt_interaction()


func attempt_interaction() -> void:
	if interactable_objects == []:
		print("there are no interactable objects")
		return
	var is_destroyed : bool = interactable_objects[0].interact()
	if is_destroyed: interactable_objects.remove_at(0)



func connect_signals() -> void:
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
