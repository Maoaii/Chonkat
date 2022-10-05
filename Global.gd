extends Node

var LEVELS = {
	0: load("res://Levels/Menus/MenuScreen.tscn"),
	1: load("res://Levels/Level1.tscn"),
	2: load("res://Levels/Level2.tscn"),
	3: load("res://Levels/Menus/WinScreen.tscn"),
}

var current_level : PackedScene = LEVELS[1]

var current_treats = 0

var move_counter = 0
