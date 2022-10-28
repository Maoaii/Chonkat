extends StaticBody2D

func _on_EatArea_body_entered(body):
	print(body.name)
	if body.name == "Player":
		get_tree().call_group("Player", "freeze_player")
		get_tree().call_group("NextLevelUI", "draw_ui")
