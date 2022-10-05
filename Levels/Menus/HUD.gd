extends Control

onready var treats_label = $CanvasLayer/TreatsLabel

func _process(_delta):
	treats_label.text = "Treats: " + str(Global.current_treats)
	
