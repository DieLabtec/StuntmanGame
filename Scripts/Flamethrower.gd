extends AnimatedSprite
var flame = preload("res://Scenes/Fire.tscn")
var initalizedFlame 

var initialTimer = Timer.new()
var initialTimerTime = 6

var delayBeforeFiring = Timer.new()
var delayBeforeFiringTime = 1.6

var delayBeforeFireballs = Timer.new()
var delayBeforeFireballsTime = 0.6

var numberOfFireballs = 0
var offsetPosition = Vector2(0 , 0)
	


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	createTimer(initialTimer, false , initialTimerTime , "initialTimerTimeout")
	createTimer(delayBeforeFiring,true,delayBeforeFiringTime,"delayBeforeFiringTimeOut")
	createTimer(delayBeforeFireballs,true,delayBeforeFireballsTime , "delayBeforeFireballsTimeOut")
	initialTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func createTimer(timerName , setOneShot , setWaitTimer , onTimerOut):
	timerName.set_one_shot(setOneShot)
	timerName.set_wait_time(setWaitTimer)
	timerName.connect("timeout", self, onTimerOut)
	add_child(timerName)
	
func initialTimerTimeout():
	play("Activate")
	delayBeforeFiring.start()
	
func delayBeforeFiringTimeOut():
	delayBeforeFireballs.start()
	
	play("Firing")
	initalizedFlame = flame.instance()
	add_child(initalizedFlame)
	initalizedFlame.position = get_node("Position2D").position + offsetPosition
		
	numberOfFireballs = numberOfFireballs + 1
	offsetPosition = offsetPosition + Vector2(168,0)
	
func delayBeforeFireballsTimeOut():
	if(numberOfFireballs < 4 ):
		
		initalizedFlame = flame.instance()
		add_child(initalizedFlame)
		initalizedFlame.position = get_node("Position2D").position + offsetPosition
		
		numberOfFireballs = numberOfFireballs + 1
		offsetPosition = offsetPosition + Vector2(168,0)
		delayBeforeFireballs.start()
		
		
		print("some code about spawning fireballs")
		
	else:
		numberOfFireballs = 0
		offsetPosition = Vector2(0,0)
		play("Finished")
