extends Node2D

signal moved

onready var camera = $Camera2D
onready var movement_timer = $MovementTimer
onready var animation_player = $AnimationPlayer

export var MOVE_COUNTER = 5

var DIRECTIONS = {
	"up": Vector2(0, -1),
	"down": Vector2(0, 1),
	"left": Vector2(-1, 0),
	"right": Vector2(1, 0),
}

var STATES = {
	"idle": "idle",
}

var state = STATES["idle"]
var dir = Vector2(1, 0)
var canMove = true
var isFrozen = false

func _ready():
	get_tree().call_group("HUD", "update_move_counter", MOVE_COUNTER)

func _process(_delta):
	animation_player.play(state)

func _unhandled_input(event):
	if canMove and not isFrozen:
		if Input.is_action_just_pressed("up"):
			set_movement("up")
		elif Input.is_action_just_pressed("down"):
			set_movement("down")
		elif Input.is_action_just_pressed("left"):
			set_movement("left")
		elif Input.is_action_just_pressed("right"):
			set_movement("right")


func move(direction):
	position += direction * Global.BLOCK_SIZE


func _on_MovementTimer_timeout():
	if !canMove:
		emit_signal("moved", dir)
		move(dir)
	
	movement_timer.start()


func _on_RayCast_collided(collider):
	if collider.name == "Food":
		next_level()
	
	canMove = true
	dir = Vector2(0, 0)
	camera_shake()


func set_movement(direction):
	dir = DIRECTIONS[direction]
	set_variables()


func set_variables():
	canMove = false
	MOVE_COUNTER -= 1
	get_tree().call_group("HUD", "update_move_counter", MOVE_COUNTER)
	
	if MOVE_COUNTER < 0:
		get_tree().change_scene("res://Levels/Menus/DeathScreen.tscn")


func camera_shake():
	camera.ready_the_shake()


func freeze_player():
	isFrozen = true


func next_level():
	freeze_player()
	get_tree().call_group("NextLevelUI", "draw_ui")
