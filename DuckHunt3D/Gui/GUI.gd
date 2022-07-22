extends Control


func change_score(new_score: int) -> void:
	$CenterContainer/ScoreLabel.text = "Score: %s" %new_score
