extends Node
var alive = true


var testDisp = 0 

var hitPoints = 3
var canTakeDamage = true

var diedTrapDoor = false
var diedMissile = false
var diedFire = false
var diedByTimeout = false

var positionXplayer = false
var missileOverlapsWithPlayerForFinalTimer = false


var currentScore = 0
var numberOfCoffeCups = 3 

var initialRestart = false

#timers for xBomb
var initialTimer = Timer.new()
var followUpTimer = Timer.new()
var lastTimerForBomb = Timer.new()

var initialTimerWaitTimer = 1.5  #how often it rolls for the missile to spawn
var followUpTimerWaitTimer = 1 #how much time the missile follow you around
var lastTimerWaitTimer = 0.2
var chance

var statusProgression = 0

#panic mode timers
var panicModeCD = Timer.new()
var panicModeDuration = Timer.new()

var panicModeCDtime = 6
var panicModeDurationtime = 3

var displayCD = Timer.new()
var bombDelay = Timer.new()

#progress bar
onready var progressBar = get_node("/root/Node2D/ColdownSpecial")





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
	createTimer(panicModeCD , true , panicModeCDtime , "panicModeTrue")
	createTimer(panicModeDuration , true , panicModeDurationtime , "panicModeDuration")
	createTimer(displayCD , false , 1 , "displayFunc")
	createTimer(bombDelay , true , 0.14 , "bombDelayFunc")
	
	
	
	pass
	
func bombDelayFunc():
	Spawn.spawnBombWithX.playExplosion()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(positionXplayer == true):
		Spawn.spawnBombWithX.position = Spawn.Player.position
		pass
	
	
	pass


# panic mode code
func panicModeTrue():
	Spawn.Player.canEnterPanicMode = true
	
func panicModeDuration():
	Spawn.Player.speed = 600
	Spawn.Player.runingAnimation = "Run"

func displayFunc():
		#take the value of the coldown progress bar and if it's not 0 decreasse it if it is zero refresh it 
		if(get_node("/root/Node2D/ColdownSpecial").value >0):
			get_node("/root/Node2D/ColdownSpecial").value = get_node("/root/Node2D/ColdownSpecial").value -1
		else:
			displayCD.stop()
			get_node("/root/Node2D/ColdownSpecial").value = 5
		pass

# mine code	



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
	Spawn.spawnBombWithX.crossHair()
	lastTimerForBomb.start()
	

func lastTimerTimeout():
	Spawn.spawnBombWithX.bombFalling()
	initialTimer.set_paused(false)
	Spawn.spawnBombWithX.overlapsWithPlayer()
	bombDelay.start()
	
	if(Status.missileOverlapsWithPlayerForFinalTimer == true && Status.alive == true && Status.canTakeDamage == true && Status.hitPoints > 1):
		Spawn.Player.tookDamage()
	if(Status.missileOverlapsWithPlayerForFinalTimer == true && Status.alive == true && Status.canTakeDamage == true && Status.hitPoints == 1):
		Status.alive = false
		Status.diedMissile = true
		Status.hitPoints = Status.hitPoints - 1
		Status.missileOverlapsWithPlayerForFinalTimer = false
		get_node("/root/Node2D/End").playEnd()
	Status.missileOverlapsWithPlayerForFinalTimer = false
		
	pass
