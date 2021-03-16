extends Area2D

var mineCanTrigger = true
#mine timers
var mineTimer = Timer.new()
var mineTimertime = 0.4

signal scoreIncreasedMine

var stuffs = Timer.new()

func createTimer(timerName , setOneShot , setWaitTimer , onTimerOut):
	timerName.set_one_shot(setOneShot)
	timerName.set_wait_time(setWaitTimer)
	timerName.connect("timeout", self, onTimerOut)
	add_child(timerName)

func _ready():
	createTimer(mineTimer , true , mineTimertime , "mineTimeout" )
	connect("scoreIncreasedMine" , self , "increaseScore")
	pass # Replace with function body.

func increaseScore():
	Status.currentScore = Status.currentScore + 50
	Spawn.labelHSInstance.text = str(Status.currentScore)
	print(Status.currentScore)

#func _process(delta):
#	pass


#func _on_Trigger_body_entered(Player):
#	if(canTrigger == true):
#		canTrigger = false
#	$AnimatedSprite.play("Detonating")
#	Status.mineTimer.start()
#
#	pass # Replace with function body.

#is called by rocket
func mineExplode():
	$AnimatedSprite.offset = Vector2(0 , -258)
	$AnimatedSprite.play("Exploading")
	
func mineCleanUp():
	$AnimatedSprite.offset = Vector2(0,0)
	$AnimatedSprite.play("Idle")
	mineCanTrigger = true



func _on_Area2D_body_entered(body):
	if(mineCanTrigger == true):
		mineCanTrigger = false
		emit_signal("scoreIncreasedMine")
		$AnimatedSprite.play("Detonating")
		mineTimer.start()
	
	pass # Replace with function body.

func mineTimeout():
	print("yesyes")
	mineExplode()
	if(overlaps_body(Spawn.Player)):
		Status.alive = false
		Status.diedMissile = true
	pass