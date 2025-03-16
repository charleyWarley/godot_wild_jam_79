extends CanvasLayer

var is_background_up := false

@onready var gui_background := $GUIBackground


func _ready() -> void:
	visible = false


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
