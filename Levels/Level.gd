extends Node2D

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		Global.current_level = Global.LEVELS[1]
# warning-ignore:return_value_discarded
		get_tree().change_scene_to(Global.LEVELS[0])

func restart_level():
# warning-ignore:return_value_discarded
	get_tree().change_scene(get_tree().current_scene.filename)
