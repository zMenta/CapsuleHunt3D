extends Control

signal game_start


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$PointMade.rect_position = get_global_mouse_position()
		$TimeMade.rect_position = get_global_mouse_position() + Vector2(-50, 25)


func point_made_animation(point_amount: int = 100) -> void:
	$PointMade.text = "+" + str(point_amount)
	$PointAnimationPlayer.play("PointMadeAnimation")


func time_made_animation() -> void:
	$TimeAnimationPlayer.play("TimeMadeAnimation")


func switch_visibility_game_over_labels() -> void:
	$TimesUpLabel.visible = not $TimesUpLabel.visible
	$FinalScoreLabel.visible = not $FinalScoreLabel.visible


func change_time_label(new_value: float) -> void:
	var time_label := $"%TimeLabel"
	time_label.text = "%.2f" % new_value
	
	if float(time_label.text) <= 5:
		time_label.add_color_override("font_color", Color(20,0,0))
	else:
		time_label.add_color_override("font_color", Color(1,1,1))


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
