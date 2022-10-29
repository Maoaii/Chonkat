extends Control

onready var buttons = $CanvasLayer/Buttons
export var next_level : PackedScene

func _ready():
	buttons.visible = false
	PlayerConfig.level_init_treats_set()

func draw_ui():
	buttons.visible = true

func _on_RestartButton_pressed():
# warning-ignore:return_value_discarded
	PlayerConfig.reset_level_treats()
	get_tree().change_scene(get_tree().current_scene.filename)


func _on_NextLevelButton_pressed():
	Global.next_level(next_level)
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(next_level)


func _on_MenuButton_pressed():
	Global.reset_level()
	PlayerConfig.reset_treats()
	get_tree().change_scene_to(Global.LEVELS[0])
