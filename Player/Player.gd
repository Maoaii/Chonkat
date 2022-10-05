extends KinematicBody2D

onready var camera = $Camera2D

export var SPEED = 200
export var MOVE_COUNTER = 5

var DIRECTIONS = {
	"up": Vector2(0, -SPEED),
	"down": Vector2(0, SPEED),
	"left": Vector2(-SPEED, 0),
	"right": Vector2(SPEED, 0),
}

var velocity = Vector2()
var canMove = true
var isShake = false
var isFrozen = false

func _ready():
	get_tree().call_group("HUD", "update_move_counter", MOVE_COUNTER)

# warning-ignore:unused_argument
func _physics_process(delta):
	if canMove and not isFrozen:
		if Input.is_action_just_pressed("up"):
			set_movement("up")
		elif Input.is_action_just_pressed("down"):
			set_movement("down")
		elif Input.is_action_just_pressed("left"):
			set_movement("left")
		elif Input.is_action_just_pressed("right"):
			set_movement("right")
	
	move()


func set_movement(direction):
	set_velocity(direction)
	set_variables()


func set_velocity(direction):
	velocity = DIRECTIONS[direction]


func set_variables():
	canMove = false
	isShake = true
	MOVE_COUNTER -= 1
	get_tree().call_group("HUD", "update_move_counter", MOVE_COUNTER)
	
	if MOVE_COUNTER < 0:
		get_tree().change_scene("res://Levels/Menus/DeathScreen.tscn")


func move():
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if velocity == Vector2(velocity.x, 0) and is_on_wall():
		canMove = true
		camera_shake()
	elif velocity == Vector2(0, velocity.y) and (is_on_ceiling() or is_on_floor()):
		canMove = true
		camera_shake()


func camera_shake():
	if isShake:
		camera.ready_the_shake()
		isShake = false


func freeze_player():
	isFrozen = true
