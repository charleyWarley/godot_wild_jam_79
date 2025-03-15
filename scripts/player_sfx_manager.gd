extends Node

const SOUNDS := {
	"step1": preload("res://audio/carpetstep6.mp3"),
	"step2": preload("res://audio/carpetstep1.mp3"),
	"step3": preload("res://audio/carpetstep3.mp3"),
	"step4": preload("res://audio/carpetstep2.mp3")
}

@onready var SFX1 := $SFX1
@onready var SFX2 := $SFX2

func play_sound(sound_name: String, pitch_scale:=1.0) -> void:
	if not sound_name in SOUNDS:
		push_warning("sound ", sound_name, " does not exist")
		return
	if SFX1.playing:
		SFX2.pitch_scale = pitch_scale
		SFX2.set_stream(SOUNDS[sound_name])
		SFX2.play()
	else:
		SFX1.pitch_scale = pitch_scale
		SFX1.set_stream(SOUNDS[sound_name])
		SFX1.play()

func play_walk_sound() -> void:
	randomize()
	var step_index := randi_range(1, 4)
	var random_pitch := randf_range(0.85, 1.15)
	play_sound("step" + str(step_index), random_pitch)
