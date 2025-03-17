extends CanvasLayer



@export var gui_head: TextureRect
@export var gui_expression: TextureRect

var is_background_up := false

@onready var gui_background := $GUIBackground
@onready var overlap_detect_area := $"../SubViewportContainer/LevelViewport/OverlapDetectArea"


func _on_overlapping_body_entered(body: Node2D) -> void:
	if body.name != "Player": return
	gui_head.modulate = Color(1,1,1,0.3)


func _on_overlapping_body_exited(body: Node2D) -> void:
	if body.name != "Player": return
	gui_head.modulate = Color(1,1,1,1)


func _ready() -> void:
	visible = false
	connect_signals()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("show_gui"):
		is_background_up = !is_background_up
		if is_background_up:
			show_background()
		else:
			hide_background()


func hide_background() -> void:
	var tween := get_tree().create_tween()
	tween.tween_property(gui_background, "position", Vector2(0.0, 360.0), 0.5)

func show_background() -> void:
	var tween := get_tree().create_tween()
	tween.tween_property(gui_background, "position", Vector2(0.0, 328.0), 0.5)


func connect_signals() -> void:
	overlap_detect_area.connect("body_entered", _on_overlapping_body_entered)
	overlap_detect_area.connect("body_exited", _on_overlapping_body_exited)
