extends Node

const ZOOM_VECTOR := Vector2(2.0, 2.0)
const UNZOOM_VECTOR := Vector2(1.0, 1.0)

@export var PLAYER : CharacterBody2D
@export var CAMERA : Camera2D


func _ready() -> void:
	if Settings.is_camera_following: 
		CAMERA.zoom = ZOOM_VECTOR
	else: 
		CAMERA.zoom = UNZOOM_VECTOR


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("zoom"):
		set_following()


func set_following() -> void:
	Settings.is_camera_following = !Settings.is_camera_following
	if !Settings.is_camera_following:
		var tween := get_tree().create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.set_trans(Tween.TRANS_SINE)
		tween.tween_property(CAMERA, "zoom", UNZOOM_VECTOR, 0.3)
	else:
		var tween := get_tree().create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.set_trans(Tween.TRANS_SINE)
		tween.tween_property(CAMERA, "zoom", ZOOM_VECTOR, 0.3)
