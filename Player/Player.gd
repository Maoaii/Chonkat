extends KinematicBody2D

onready var camera = $Camera2D

export var SPEED = 200
var velocity = Vector2()
var canMove = true
var isShake = false
var isFrozen = false


# warning-ignore:unused_argument
func _physics_process(delta):
	if canMove and not isFrozen:
		if Input.is_action_just_pressed("up"):
			velocity = Vector2(0, -SPEED)
			canMove = false
			isShake = true
		elif Input.is_action_just_pressed("down"):
			velocity = Vector2(0, SPEED)
			canMove = false
			isShake = true
		elif Input.is_action_just_pressed("left"):
			velocity = Vector2(-SPEED, 0)
			canMove = false
			isShake = true
		elif Input.is_action_just_pressed("right"):
			velocity = Vector2(SPEED, 0)
			canMove = false
			isShake = true
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if velocity == Vector2(velocity.x, 0) and is_on_wall():
		canMove = true
		
		if isShake:
			camera.ready_the_shake()
			isShake = false
		
	elif velocity == Vector2(0, velocity.y) and (is_on_ceiling() or is_on_floor()):
		canMove = true
		
		if isShake:
			camera.ready_the_shake()
			isShake = false
			

func freeze_player():
	isFrozen = true
