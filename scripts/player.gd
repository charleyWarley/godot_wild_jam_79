extends CharacterBody2D

#const ACCELERATION := 35
#const DECELERATION := 850
const SPEED = 160.0

@onready var SFX_MANAGER := $SFXManager
@onready var ANIMATION_PLAYER := $AnimationPlayer


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = direction.normalized()
	if direction:
		velocity = direction * SPEED
		play_animation("walk")
	else:
		play_animation("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()


func play_animation(animation_name: String) -> void:
	if ANIMATION_PLAYER.current_animation == animation_name:
		return
	ANIMATION_PLAYER.play(animation_name)
