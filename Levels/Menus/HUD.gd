extends Control

onready var treats_label = $CanvasLayer/TreatsLabel
onready var moves_label = $CanvasLayer/MovesLabel

func _process(_delta):
	treats_label.text = "Treats: " + str(PlayerConfig.current_treats_get())

func update_move_counter(value):
	moves_label.text = "Moves: " + str(value)
