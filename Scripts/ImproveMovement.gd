extends KinematicBody2D
var alive = true


var speed = 600
var friction = 0.5
var acceleration = 0.2
var velocity = Vector2.ZERO

var offsetForClampXRight = 80
var offsetForClampYBottom = 70
var offsetForClampYTop = 50


func _physics_process(delta):
	var input_velocity = Vector2.ZERO
	# Check input for "desired" velocity

	if Input.is_action_pressed("right") && Status.alive == true:
		input_velocity.x += 1
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	if Input.is_action_pressed("left") && Status.alive == true:
		input_velocity.x -= 1
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	if Input.is_action_pressed("down") && Status.alive == true:
		input_velocity.y += 1
		$AnimatedSprite.play("Run")
	if Input.is_action_pressed("up") && Status.alive == true:
		input_velocity.y -= 1
		$AnimatedSprite.play("Run")
	input_velocity = input_velocity.normalized() * speed
	# If there's input, accelerate to the input velocity
	if input_velocity.length() > 0:
		velocity = velocity.linear_interpolate(input_velocity, acceleration)
	elif Status.alive == true:
		# If there's no input, slow down to (0, 0)
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction)
		$AnimatedSprite.play("Idle")
	if Status.alive == true:
		velocity = move_and_slide(velocity)
	
	
	
	position.x = clamp(position.x,0,get_viewport_rect().end.x - offsetForClampXRight)
	position.y = clamp(position.y,offsetForClampYTop,get_viewport_rect().end.y - offsetForClampYBottom)
#
	
	
	if(Status.alive == false && Status.diedTrapDoor):
		$AnimatedSprite.play("Falling")
