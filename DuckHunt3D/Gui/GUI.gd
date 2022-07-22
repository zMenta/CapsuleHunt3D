extends Control


func change_score(new_score: int) -> void:
	$CenterContainer/ScoreLabel.text = "Score: %s" %new_score


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$PointMade.rect_position = get_global_mouse_position()
		
	if event.is_action_pressed("ui_down"):
		$AnimationPlayer.play("PointMadeAnimation")
