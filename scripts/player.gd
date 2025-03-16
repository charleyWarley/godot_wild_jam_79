extends CharacterBody2D

#const ACCELERATION := 35
#const DECELERATION := 850
const SPEED = 160.0

@onready var SFX_MANAGER := $SFXManager
@onready var ANIMATION_PLAYER := $AnimationPlayer

var direction_name := "down"


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	set_direction_name(direction)
	direction = direction.normalized()
	if direction:
		velocity = direction * SPEED
		play_animation("walk_" + direction_name)
	else:
		play_animation("idle_" + direction_name)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()


func set_direction_name(direction: Vector2) -> void:
	match direction:
		Vector2.ZERO: return
		Vector2.DOWN: direction_name = "down"
		Vector2.LEFT: direction_name = "left"
		Vector2.RIGHT: direction_name = "right"
		Vector2.UP: direction_name = "up"


func play_animation(animation_name: String) -> void:
	if ANIMATION_PLAYER.current_animation == animation_name:
		return
	if ANIMATION_PLAYER.current_animation == "blink": return
	ANIMATION_PLAYER.play(animation_name)
