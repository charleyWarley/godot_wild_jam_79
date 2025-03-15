extends Node

const LEVELS := {
	"title_menu": preload("res://scenes/title_menu.tscn"),
	"test": preload("res://scenes/test_level.tscn"),
	}

var current_level : Node

@onready var VIEWPORT := $"../SubViewportContainer/LevelViewport"

func _ready() -> void:
	current_level = $"../SubViewportContainer/LevelViewport/TitleMenu"


func set_current_level(level_name: String) -> void:
	if not level_name in LEVELS: 
		push_warning("Level ", level_name, " does not exist")
		return
	current_level.queue_free()
	current_level = null
	var new_level : Node2D = LEVELS[level_name].instantiate()
	VIEWPORT.add_child(new_level)
	current_level = new_level
