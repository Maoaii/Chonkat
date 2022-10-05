extends Control

onready var ui_settings = $CanvasLayer/UISettings

func _ready():
	ui_settings.visible = false

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_PlayButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(Global.current_level)


func _on_SettingsButton_pressed():
	ui_settings.visible = true
