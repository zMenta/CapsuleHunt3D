extends Control


func change_score(new_score: int) -> void:
	$CenterContainer/ScoreLabel.text = "Score: %s" % new_score


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$PointMade.rect_position = get_global_mouse_position()
		$TimeMade.rect_position = get_global_mouse_position() + Vector2(-50, 25)


func point_made_animation() -> void:
	$PointAnimationPlayer.play("PointMadeAnimation")


func time_made_animation() -> void:
	$TimeAnimationPlayer.play("TimeMadeAnimation")


func switch_visibility_time_up_label() -> void:
	$TimesUpLabel.visible = not $TimesUpLabel.visible


func change_time_label(new_value: float) -> void:
	$TimeLabel.text = str(new_value)
