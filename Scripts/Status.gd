extends Node
var alive = true

var diedTrapDoor = false
var diedMissile = false

var positionXplayer = false
var missileOverlapsWithPlayerForFinalTimer = false


var currentScore = 0
var numberOfCoffeCups = 3 

#timers for xBomb
var initialTimer = Timer.new()
var followUpTimer = Timer.new()
var lastTimerForBomb = Timer.new()

#panic mode timers
var panicModeCD = Timer.new()
var panicModeDuration = Timer.new()

var initialTimerWaitTimer = 1.5  #how often it rolls for the missile to spawn
var followUpTimerWaitTimer = 1 #how much time the missile follow you around
var lastTimerWaitTimer = 0.2
var chance

func createTimer(timerName , setOneShot , setWaitTimer , onTimerOut):
	timerName.set_one_shot(setOneShot)
	timerName.set_wait_time(setWaitTimer)
	timerName.connect("timeout", self, onTimerOut)
	add_child(timerName)





func _ready():

	# initiating timers for bomb
	createTimer(initialTimer , false , initialTimerWaitTimer , "initialTimerTimeout")
	createTimer(followUpTimer , true , followUpTimerWaitTimer , "followUpTimerTimerout" )
	createTimer(lastTimerForBomb, true , lastTimerWaitTimer, "lastTimerTimeout")
	initialTimer.start()
	
	# timers for panic mode 
	createTimer(panicModeCD , true , 6 , "panicModeTrue")
	createTimer(panicModeDuration , true , 3 , "panicModeDuration")
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(positionXplayer == true):
		Spawn.spawnBombWithX.position = Spawn.Player.position
	pass
	
		
	
	pass

func panicModeTrue():
	Spawn.Player.canEnterPanicMode = true
	
func panicModeDuration():
	Spawn.Player.speed = 600
	Spawn.Player.runingAnimation = "Run"

#A bunch of code for the falling bomb


func initialTimerTimeout():
	chance = randi() % 2 
	if (chance == 1 && Status.alive == true):
		Spawn.spawnBombWithX.crossHair()
		positionXplayer = true
		initialTimer.set_paused(true)
		followUpTimer.start()
		
func followUpTimerTimerout():
	positionXplayer = false
#	Spawn.spawnBombWithX.crossHair()
	lastTimerForBomb.start()
	

func lastTimerTimeout():
	Spawn.spawnBombWithX.bombFalling()
	initialTimer.set_paused(false)
	Spawn.spawnBombWithX.overlapsWithPlayer()
	
	if(Status.missileOverlapsWithPlayerForFinalTimer == true && Status.alive == true):
		Status.alive = false
		Status.diedMissile = true
		Status.missileOverlapsWithPlayerForFinalTimer = false
#	
	Status.missileOverlapsWithPlayerForFinalTimer = false
		
	pass
