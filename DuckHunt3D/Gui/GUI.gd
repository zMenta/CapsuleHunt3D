extends Control


func change_score(new_score: int) -> void:
	$CenterContainer/ScoreLabel.text = "Score: %s" %new_score


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$PointMade.rect_position = get_global_mouse_position()
		

func point_made_animation() -> void:
	$AnimationPlayer.play("PointMadeAnimation")
	

func switch_visibility_time_up_label() -> void:
	$TimesUpLabel.visible = not $TimesUpLabel.visible 
	
