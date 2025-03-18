extends Node

var current_state : PlayerState

@onready var STATES := {
	"idle": $Idle,
	"walking": $Walking,
	"interacting": $Interacting,
}
@onready var ANIMATION_PLAYER := $"../AnimationPlayer"
@onready var PLAYER := $".."


func _ready() -> void:
	current_state = STATES["idle"]
	for state: PlayerState in STATES.values():
		state.ANIMATION_PLAYER = ANIMATION_PLAYER
		state.PLAYER = PLAYER


func update(input: InputPackage, delta: float) -> void:
	current_state.update(input, delta)


func physics_update(input: InputPackage, delta: float) -> void:
	var relevant_state : String = current_state.check_relevance(input)
	if relevant_state != "continue":
		transition_to(relevant_state)
	update_current_direction(input)
	current_state.physics_update(input, delta)


func update_current_direction(input: InputPackage) -> void:
	match input.input_direction:
		Vector2.DOWN: PLAYER.current_direction = "down"
		Vector2.LEFT: PLAYER.current_direction = "left"
		Vector2.RIGHT: PLAYER.current_direction = "right"
		Vector2.UP: PLAYER.current_direction = "up"


func transition_to(new_state_name: StringName) -> void:
	if not new_state_name in STATES:
		push_warning(new_state_name, " state does not exist")
		return
	if current_state != STATES[new_state_name]:
		current_state.exit()
	print(new_state_name)
	current_state = STATES[new_state_name]
	current_state.enter()
