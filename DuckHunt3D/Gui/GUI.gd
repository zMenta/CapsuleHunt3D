extends Control

signal game_start
signal game_restart


func change_score(new_score: int) -> void:
	$"%ScoreLabel".text = "Score: %s" % new_score


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$PointMade.rect_position = get_global_mouse_position()
		$TimeMade.rect_position = get_global_mouse_position() + Vector2(-50, 25)


func point_made_animation() -> void:
	$PointAnimationPlayer.play("PointMadeAnimation")


func time_made_animation() -> void:
	$TimeAnimationPlayer.play("TimeMadeAnimation")


func switch_visibility_game_over_labels() -> void:
	$TimesUpLabel.visible = not $TimesUpLabel.visible
	$FinalScoreLabel.visible = not $FinalScoreLabel.visible


func change_time_label(new_value: float) -> void:
	$"%TimeLabel".text = str(new_value)


func change_final_score_label(new_value: String) -> void:
	$FinalScoreLabel.text = new_value


func show_menu():
	$Menus.visible = true


func _on_Start_pressed():
	emit_signal("game_start")
	$Menus.visible = false
	$TimesUpLabel.visible = false
	$FinalScoreLabel.visible = false
	$"%Start".text = "Play Again"


func _on_Quit_pressed():
	get_tree().quit()
