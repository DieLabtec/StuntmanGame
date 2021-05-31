extends KinematicBody2D
var alive = true
var invincibilityTimer = Timer.new()
var hitStunTimer = Timer.new()

var speed = 600
var friction = 1 #0.5
var acceleration = 0.2
var velocity = Vector2.ZERO
var runingAnimation = "Run"
var idleAnimation = "Idle"
var canEnterPanicMode = true
var hitStun = false

var offsetForClampXRight = 30
var offsetForClampYBottom = 0
var offsetForClampYTop = 120

var clamXLeft = 157.745
var clamXRight = 1753.433 #1773
var clampYTop = 163.824
var clampYBottom = 850.053  #850

func _ready():
#	set_process_input(true)
	invincibilityTimer.set_one_shot(true)
	invincibilityTimer.set_wait_time(2)
	invincibilityTimer.connect("timeout", self, "invincibilityRunsOut")
	add_child(invincibilityTimer)
	
	hitStunTimer.set_one_shot(true)
	hitStunTimer.set_wait_time(0.3)
	hitStunTimer.connect("timeout", self, "hitStunTimeout")
	add_child(hitStunTimer)
	
	
	
	pass

func tookDamage():
	Status.hitPoints = Status.hitPoints - 1
	Status.canTakeDamage = false
	invincibilityTimer.start()
	hitStun = true
	runingAnimation = "hitStun"
	idleAnimation = "hitStun"
	hitStunTimer.start()
	get_node("AudioStreamPlayer").playerHit()
	
	
func invincibilityRunsOut():
	Status.canTakeDamage = true
	runingAnimation = "Run"
	idleAnimation = "Idle"
	pass
	
func hitStunTimeout():
	hitStun = false
	idleAnimation = "IdleInvincible"
	

#func _input(event):
#	if(event.is_action_pressed("ability") && canEnterPanicMode == true && Status.alive == true):
#		print("workssss")
#		canEnterPanicMode = false
#		Status.displayCD.start()
#		speed = 800
#		runingAnimation = "Panic"
#		Status.panicModeCD.start()
#		Status.panicModeDuration.start()



func _physics_process(delta):
	
	
	
	var input_velocity = Vector2.ZERO
	# Check input for "desired" velocity
	
#	if Input.is_action_just_pressed("ability") && canEnterPanicMode == true && Status.alive == true:
#		print("workssss")
#		canEnterPanicMode = false
#		Status.displayCD.start()
#		speed = 800
#		runingAnimation = "Panic"
#		Status.panicModeCD.start()
#		Status.panicModeDuration.start()

#	if Input.is_action_pressed("ability") && Status.alive == true && Status.canTakeDamage == false:
#		speed = 800
#		runingAnimation = "PanicInvincible"
	if Input.is_action_pressed("ability") && Status.alive == true && Status.canTakeDamage == true && hitStun == false:
		speed = 800
		runingAnimation = "Panic"
	elif Input.is_action_pressed("ability") && Status.alive == true && Status.canTakeDamage == false && hitStun == false:
		speed = 800
		runingAnimation = "PanicInvincible"
	elif Status.alive == true && Status.canTakeDamage == false && hitStun == false:
		speed = 600
		runingAnimation = "RuningInvincible"
	elif hitStun == false:
		speed = 600 
		runingAnimation = "Run"

	if Input.is_action_pressed("right") && Status.alive == true:
		input_velocity.x += 1
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play(runingAnimation)
	if Input.is_action_pressed("left") && Status.alive == true:
		input_velocity.x -= 1
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play(runingAnimation)
	if Input.is_action_pressed("down") && Status.alive == true:
		input_velocity.y += 1
		$AnimatedSprite.play(runingAnimation)
	if Input.is_action_pressed("up") && Status.alive == true:
		input_velocity.y -= 1
		$AnimatedSprite.play(runingAnimation)
	input_velocity = input_velocity.normalized() * speed
	# If there's input, accelerate to the input velocity
	if input_velocity.length() > 0:
		velocity = velocity.linear_interpolate(input_velocity, acceleration)
	elif Status.alive == true:
		# If there's no input, slow down to (0, 0)
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction)
		$AnimatedSprite.play(idleAnimation)
	if Status.alive == true:
		velocity = move_and_slide(velocity)
	
	
	
	position.x = clamp(position.x,clamXLeft,clamXRight)
	position.y = clamp(position.y,clampYTop,clampYBottom)
#
	
	
	if(Status.alive == false && Status.diedTrapDoor == true):
		$AnimatedSprite.play("Electrecuted")
		
		
	if(Status.alive == false && Status.diedMissile == true):
		$AnimatedSprite.play("DiedExplosion")
		
		
	if(Status.alive == false && Status.diedFire == true):
		$AnimatedSprite.play("Burning")
		

	if(Status.alive == false && Status.diedByTimeout == true):
		$AnimatedSprite.play("Timeout")
		
