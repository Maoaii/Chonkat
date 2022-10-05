extends Area2D

func _on_Treat_body_entered(body):
	if body.name == "Player":
		Global.current_treats += 1
		self.queue_free()
