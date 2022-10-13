extends Node

export var game_start_time := 30
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
		var score_to_make := 100
		if duck_body.is_in_group("time_duck"):
			score_to_make = 100
			$GameTimer.start($GameTimer.time_left + 4.0)
			$GUI.time_made_animation()
		else:
			score_to_make = 175
		current_score += score_to_make
		$GUI.point_made_animation(score_to_make)
		$GUI.change_score(current_score)


func _on_GameTimer_timeout() -> void:
	$GUI.switch_visibility_game_over_labels()
	$GUI.show_menu()
	$GUI.change_score(0)
	$GUI.change_final_score_label("Final Score:" + str(current_score))
	$Level.game_over()


func _on_Game_Start() -> void:
	$Level.game_start()
	$GameTimer.start(game_start_time)
	current_score = 0
