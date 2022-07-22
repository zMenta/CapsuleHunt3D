extends Node


var current_score := 0


func _ready() -> void:
	randomize()
	

func _on_Level_duck_spawned(duck: KinematicBody) -> void:
	duck.connect("duck_died", self, "_on_Duck_died")
	
	
func _on_Duck_died() -> void:
	current_score += 100
	$GUI.change_score(current_score)
