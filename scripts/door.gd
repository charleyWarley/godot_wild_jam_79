extends Area2D

@onready var ANIMATION_PLAYER := $AnimationPlayer
@onready var SFX := $SFX

func _on_body_entered(body: Node2D) -> void:
	if !body.name == "Player": return
	play_animation("open")
	SFX.play()


func _on_body_exited(body: Node2D) -> void:
	if !body.name == "Player": return
	play_animation("close")
	await get_tree().create_timer(0.05).timeout
	SFX.play()


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func play_animation(animation_name: String) -> void:
	if ANIMATION_PLAYER.current_animation == animation_name: return
	ANIMATION_PLAYER.play(animation_name)
