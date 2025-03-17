extends Node2D

@onready var player := $Player

func set_player_position(player_position: Vector2, direction_name: String) -> void:
	player.position = player_position
	player.current_direction = direction_name
