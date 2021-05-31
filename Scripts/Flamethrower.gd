extends AnimatedSprite
var flame = preload("res://Scenes/Fire.tscn")
var initalizedFlame 

var initialTimer = Timer.new()
var initialTimerTime = 15

var delayBeforeFiring = Timer.new()
var delayBeforeFiringTime = 1.4

var delayBeforeFireballs = Timer.new()
var delayBeforeFireballsTime = 0.2

var readyTimer = Timer.new()
var readyTimerTime = 1

var readyTimer2 = Timer.new()
var readyTimerTime2 = 1

var wait2Frames = Timer.new()
var wait2FramesTime = 0.4

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
	createTimer(readyTimer, true, readyTimerTime, "waitASec"  )
	createTimer(readyTimer2,true , readyTimerTime2, "waitASec2")
	createTimer(wait2Frames,true , wait2FramesTime , "wait2FramesTimeout")
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
	play("Ready")
	readyTimer.start()
	
func delayBeforeFireballsTimeOut():
	if(numberOfFireballs < 13 ):
		
		initalizedFlame = flame.instance()
		add_child(initalizedFlame)
		move_child(initalizedFlame, 1001)
		initalizedFlame.position = get_node("Position2D").position + offsetPosition
		
		numberOfFireballs = numberOfFireballs + 1
		offsetPosition = offsetPosition + Vector2(140,0)
		delayBeforeFireballs.start()
		
		
	else:
		numberOfFireballs = 0
		offsetPosition = Vector2(0,0)
		readyTimer2.start()
		wait2Frames.start()
		
func waitASec():
	delayBeforeFireballs.start()
	play("Firing")
	initalizedFlame = flame.instance()
	add_child(initalizedFlame)
	move_child(initalizedFlame, 1001)
	initalizedFlame.position = get_node("Position2D").position + offsetPosition
	
	numberOfFireballs = numberOfFireballs + 1
	offsetPosition = offsetPosition + Vector2(130,0)
	
func waitASec2():
	numberOfFireballs = 0
	offsetPosition = Vector2(0,0)
	play("Finished")
	
func wait2FramesTimeout():
	play("Ready")
	

	
