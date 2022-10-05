extends Control

onready var buttons = $CanvasLayer/Buttons
export var next_level : PackedScene
var player_prev_treats

func _ready():
	buttons.visible = false
	player_prev_treats = Global.current_treats

func draw_ui():
	buttons.visible = true

func _on_RestartButton_pressed():
# warning-ignore:return_value_discarded
	Global.current_treats = player_prev_treats
	get_tree().change_scene(get_tree().current_scene.filename)


func _on_NextLevelButton_pressed():
	Global.current_level = next_level
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(next_level)
