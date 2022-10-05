extends Area2D

func _on_Spikes_body_entered(body):
	if body.name == "Player":
		get_tree().call_group("Level", "restart_level")
