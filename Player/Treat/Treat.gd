extends Area2D

func _on_Treat_area_entered(area):
	if area.name == "PlayerBody":
		PlayerConfig.current_treats_increment()
		self.queue_free()
