extends StaticBody2D

@onready var PARTICLES := $CPUParticles2D
@onready var SPRITE := $Sprite2D
@onready var SFX := $SFX

func _ready() -> void:
	add_to_group("interactable")


func interact() -> bool:
	destroy()
	return true

func destroy() -> void:
	SFX.play()
	SPRITE.visible = false
	PARTICLES.emitting = true
	await PARTICLES.finished
	queue_free()
