extends Node


@export var blink0_time: float = .3
@export var blink1_time: float = .5
@export var blink2_time: float = .5

@export var gui_expression: TextureRect

var is_blinking: bool = false

func _ready() -> void:
	GlobalNodes.expressions_manager = self

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("blink"):
		start_blink()


func change_expression(expr: Expressions.Expr, time_sec: float = -1, random: bool = true, index: int = 0) -> void:
	if time_sec <= 0: # <=0 means switch to expr without switching back automatically
		Expressions.current_expression = expr #overwrite previous curr expr
			
	gui_expression.texture = _get_expr(expr, random, index)
	
	if time_sec > 0:
		await get_tree().create_timer(time_sec).timeout
		gui_expression.texture = Expressions.IMAGES[Expressions.current_expression][0]
		

func start_blink() -> void:
	is_blinking = true	
	change_expression(Expressions.Expr.BLINK, blink0_time, false, 0)
	await get_tree().create_timer(blink0_time).timeout
	change_expression(Expressions.Expr.BLINK, blink1_time, false, 1)
	await get_tree().create_timer(blink1_time).timeout
	#change_expression(Expressions.Expr.BLINK, blink2_time, false, 2)
	#await get_tree().create_timer(blink2_time).timeout
	change_expression(Expressions.Expr.DEFAULT)
	is_blinking = false
	
func _get_expr(expr: Expressions.Expr, random: bool, index: int) -> Resource:
	if random:
		var available_images: Array = Expressions.IMAGES[expr]
		return available_images.pick_random()
	else:
		return Expressions.IMAGES[expr][index]
