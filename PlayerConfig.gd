extends Node

var current_treats = 0 setget current_treats_increment, current_treats_get

var level_init_treats = 0 setget level_init_treats_set, level_init_treats_get

func current_treats_increment(vall = null):
	current_treats += 1

func current_treats_get():
	return current_treats

func level_init_treats_set(val = null):
	level_init_treats = current_treats_get()

func level_init_treats_get():
	return level_init_treats

func reset_treats():
	current_treats = 0

func reset_level_treats():
	current_treats = level_init_treats
