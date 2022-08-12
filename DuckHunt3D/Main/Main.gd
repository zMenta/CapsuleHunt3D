extends Node

var current_score := 0


func _ready() -> void:
	randomize()
	$GUI.connect("game_start", self, "_on_Game_Start")


func _process(_delta) -> void:
	$GUI.change_time_label($GameTimer.time_left)


func _on_Level_duck_spawned(duck: KinematicBody) -> void:
	duck.connect("duck_died", self, "_on_Duck_died")


func _on_Duck_died(duck_body: KinematicBody) -> void:
	if not $GameTimer.is_stopped():
		$GUI.point_made_animation()
		current_score += 100
		$GUI.change_score(current_score)
		if duck_body.is_in_group("time_duck"):
			$GameTimer.start($GameTimer.time_left + 4.0)
			$GUI.time_made_animation()


func _on_GameTimer_timeout() -> void:
	$GUI.switch_visibility_time_up_label()


func _on_Game_Start() -> void:
	$Level.game_start()
