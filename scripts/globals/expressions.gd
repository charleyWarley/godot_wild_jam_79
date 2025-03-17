extends Node

enum EXPRESSIONS {
	DEFAULT, # 0w0, -w-
	EXCITED, # 'o', >w<
	SLEEPING, # u.u, u-u, v-v
	FOCUSED, # omo
	HAPPY,  # :3, :), :]
	SKEPTICAL, # 0.o, o.0
	EMBARRASSED, # >m<
	AHEGAO, # uUu, _0_
}

var current_expression := EXPRESSIONS.DEFAULT
