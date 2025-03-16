extends Area2D

enum Direction {TOP, BOTTOM, LEFT, RIGHT}

@export var next_area_name : String
@export var enter_from : Direction

var player_direction_name : String


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player": return
	var new_player_position := body.position
	match enter_from:
		Direction.TOP: new_player_position.y = 34
		Direction.BOTTOM: new_player_position.y = 363
		Direction.LEFT: new_player_position.x = 1
		Direction.RIGHT: new_player_position.x = 641
	GlobalNodes.screen_manager.set_current_screen(next_area_name, new_player_position, body.direction_name)


func _ready() -> void:
	connect_signals()


func connect_signals() -> void:
	body_entered.connect(_on_body_entered)
