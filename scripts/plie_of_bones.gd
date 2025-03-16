extends StaticBody2D


@export var bone_index : int

var current_volume := 0

@onready var PARTICLES := $CPUParticles2D
@onready var SPRITE := $Sprite2D
@onready var SFX := $SFX


func _ready() -> void:
	if not bone_index in Interactables.bones:
		queue_free()
		return
	add_to_group("interactable")


func _process(_delta: float) -> void:
	check_volume()


func interact() -> bool:
	destroy()
	return true


func destroy() -> void:
	SFX.play()
	Interactables.bones.erase(bone_index)
	SPRITE.visible = false
	PARTICLES.emitting = true
	await PARTICLES.finished
	queue_free()


func check_volume() -> void:
	if current_volume == Settings.sfx_volume: return
	current_volume = Settings.sfx_volume
	SFX.volume_db = current_volume
