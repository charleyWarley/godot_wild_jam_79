class_name InteractingPlayerState
extends PlayerState

#velocity moves toward zero very quickly if there is a velocity

func check_relevance(input: InputPackage) -> String:
	#this state immediately transitions to idle or walking~ change when animation is added
	if not "idle" in input.actions:
		return "walking"
	else: 
		return "idle"
