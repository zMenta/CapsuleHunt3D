extends Node


var current_score := 0


func _ready() -> void:
	randomize()
	

func _on_Level_duck_spawned(duck: KinematicBody) -> void:
	duck.connect("duck_died", self, "_on_Duck_died")
	
	
func _on_Duck_died(duck_body: KinematicBody) -> void:
	if not $GameTimer.is_stopped():
		$GUI.point_made_animation()
		current_score += 100
		$GUI.change_score(current_score)
	if duck_body.is_in_group("time_duck"):
		pass


func _on_GameTimer_timeout():
	$GUI.switch_visibility_time_up_label()
