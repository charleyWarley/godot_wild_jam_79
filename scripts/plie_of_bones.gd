extends StaticBody2D

const EXPR_TIME: float = 0.65

@export var bone_index : int

var current_volume := 0
var expression_manager: Node = GlobalNodes.expressions_manager

@onready var PARTICLES := $CPUParticles2D
@onready var SPRITE := $Sprite2D
@onready var SFX := $SFX
@onready var COLLISION_SHAPE := $CollisionShape2D

func _ready() -> void:
	if not bone_index in Interactables.bones:
		queue_free()
		return
	add_to_group("interactable")


func _process(_delta: float) -> void:
	check_volume()


func interact() -> bool:
	expression_manager.change_expression(Expressions.Expr.EXCITED, EXPR_TIME)
	
	destroy()
	return true


func destroy() -> void:
	SFX.play()
	Interactables.bones.erase(bone_index)
	SPRITE.visible = false
	PARTICLES.emitting = true
	COLLISION_SHAPE.queue_free()
	await PARTICLES.finished
	queue_free()


func check_volume() -> void:
	if current_volume == Settings.sfx_volume: return
	current_volume = Settings.sfx_volume
	SFX.volume_db = current_volume
