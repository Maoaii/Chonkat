extends Area2D

func _on_Treat_area_entered(area):
	if area.name == "PlayerBody":
		Global.current_treats += 1
		self.queue_free()
