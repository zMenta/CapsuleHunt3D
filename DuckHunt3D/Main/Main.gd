extends Node


var current_score := 0


func _ready() -> void:
	randomize()
	

func _on_Level_duck_spawned(duck: KinematicBody) -> void:
	duck.connect("duck_died", self, "_on_Duck_died")
	
	
func _on_Duck_died() -> void:
	if not $GameTimer.is_stopped():
		print("Valid")
		$GUI.point_made_animation()
		current_score += 100
		$GUI.change_score(current_score)
	else:
		print("kill not valid!")


func _on_GameTimer_timeout():
	$GUI.switch_visibility_time_up_label()
