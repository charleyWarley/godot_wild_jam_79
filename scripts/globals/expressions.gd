extends Node

enum Expr {
	DEFAULT, # 0w0, -w-
	EXCITED, # 'o', >w<
	SLEEPING, # u.u, u-u, v-v
	FOCUSED, # omo
	HAPPY,  # :3, :), :]
	SKEPTICAL, # 0.o, o.0
	EMBARRASSED, # >m<
	AHEGAO, # uUu, _0_
	BLINK,
}
const IMAGES: Dictionary[int, Array] = {
	Expr.DEFAULT: [preload("uid://bqnnq07eifbmr")],
	Expr.EXCITED: [preload("uid://cm07pnc3k8e31"), preload("uid://bbjjhag8y2qch")],
	Expr.SLEEPING: [preload("uid://c6jeex5tssjn7"), preload("uid://riypw1xgwd1p"), preload("uid://cq6mlu4nb7gjq")],
	Expr.BLINK: [preload("uid://0ht1wghfcvud"), preload("uid://b0nspehok33yn"), preload("uid://c2ngn3q3kyuo1")],
}

var current_expression := Expr.DEFAULT

#func get_image_resource(expr: Expressions.Expr, random:=true) -> void:
	#print(type_string(typeof(IMAGES[Expr.DEFAULT])))
	#var length = IMAGES[Expr.EXCITED]
