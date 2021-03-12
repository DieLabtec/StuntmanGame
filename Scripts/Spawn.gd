extends Node
var trapDoor = preload("res://Scenes/TrapDoor.tscn")
var coffeCup = preload("res://Scenes/CoffeCup.tscn")
var player = preload("res://Scenes/Player.tscn")
var labelHighScore = preload("res://Scenes/HighScoreLabel.tscn")
var bombWithX = preload("res://Scenes/xWithBomb.tscn")
var mine = preload("res://Scenes/Mine.tscn")
var background = preload("res://Background.tscn")

var arrStartingX = 206.521  #65
var arrStartingY = 100  #100
var arrAddingToX = 136  #136
var arrAddingToy = 78   #78
var arrEndPointX = 1569.394 #1790  #1705.394
var arrEndPointY = 744.844 #900  #744.844

var alive = true

#var spawnTrapdoor = 
var spawnTrapdoor = trapDoor.instance()
var spawnBombWithX = bombWithX.instance()
var spawnMine 
var backgroundInstance = background.instance()

var spawnCup


var Player = player.instance()
var labelHSInstance = labelHighScore.instance()

var positionForThisCycleTrapDoor
var positionForThisCycleCoffeCup


var AllPoints = []
var copyAllPoints = []

var AllItems = []
var AllCups = []

var AllMine = []
var currentMine

func initializeTrapsSpawnPoints(startingX , startingY ,  addingToX , addingToY , 
										endPointX, endPointY, arrayToBeFilled):
		var doUntill = true
		var wrightIntoArray
		var currentX = startingX
		var currentY = startingY
		
		while(doUntill == true):
			if(currentX > endPointX && currentY > endPointY):
				doUntill = false
			if(currentX >= endPointX):
				currentY = currentY + addingToY
				currentX = startingX
				
			else:
				currentX = currentX + addingToX
				
			wrightIntoArray = Vector2(currentX, currentY)
			arrayToBeFilled.append(wrightIntoArray)
			
			pass
			
func coffeCupOnEnter():
	Spawn.copyAllPoints = Spawn.AllPoints.duplicate()
	print(Spawn.AllPoints.size())
	for n in range(Spawn.AllItems.size()):
		Spawn.positionForThisCycleTrapDoor = rand_range(12,Spawn.copyAllPoints.size())
		Spawn.AllItems[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleTrapDoor]
#		if(Spawn.AllItems[n].overlaps_body(Spawn.Player)):
#			print("please")
		copyAllPoints.remove(positionForThisCycleTrapDoor)
		Spawn.AllItems[n].timer.start()
		Spawn.AllItems[n].trapDoorOpened = false
		Spawn.AllItems[n].playClosing()
	for n in range(AllMine.size()):
		AllMine[n].mineCleanUp()
		AllMine[n].position = copyAllPoints[rand_range(12,copyAllPoints.size())]
	
	pass


func spawnTrapDoor():
		spawnTrapdoor = trapDoor.instance()
		add_child(spawnTrapdoor)
		move_child(spawnTrapdoor , 1)
		AllItems.append(spawnTrapdoor)
		
		pass

func spawnEnemy(enemy):
	add_child(enemy)
	move_child(enemy, 0)
	
	
	
	
	
	
pass



func spawncup():
	spawnCup = coffeCup.instance()
	add_child(spawnCup)
	move_child(spawnCup , 1)
	AllCups.append(spawnCup)
	pass



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	
#	add_child(spawnMine)
#	spawnMine.position = Vector2(200 , 200)
	
	#adds bomb with x to the scene
	add_child(spawnBombWithX)
	spawnBombWithX.position = Vector2(-200 , -200)
	
	
	#adds label with current score to the scene
	add_child(labelHSInstance)
	print(labelHSInstance.text + "stuffs")
	
	#adds player to the scene
	add_child(Player)
	move_child(Player , 6)
	
	#add background
	add_child(backgroundInstance)
	move_child(backgroundInstance , 0)
	backgroundInstance.position = Vector2(0,0)
	
	initializeTrapsSpawnPoints(arrStartingX , arrStartingY , arrAddingToX , arrAddingToy , arrEndPointX , arrEndPointY ,AllPoints)
	

	AllPoints.pop_back()
	print(AllPoints.size())
	copyAllPoints = AllPoints.duplicate()
	
	#creating teacups
	for n in range(3):
		spawncup()
		positionForThisCycleCoffeCup = rand_range(13,copyAllPoints.size())
		AllCups[n].position = copyAllPoints[positionForThisCycleCoffeCup]
##		print(copyAllPoints.size())
#		copyAllPoints.remove(positionForThisCycleCoffeCup)
#		print(copyAllPoints.size())
	pass
	
	#creating trapdoors
	for n in range(20):
		spawnTrapDoor()
		positionForThisCycleTrapDoor = rand_range(12,copyAllPoints.size())
		AllItems[n].position = copyAllPoints[positionForThisCycleTrapDoor]
#		print(copyAllPoints.size())
		copyAllPoints.remove(positionForThisCycleTrapDoor)
#		print(copyAllPoints.size())
	pass
	
	for n in range(10):
		spawnMine = mine.instance()
		add_child(spawnMine)
		move_child(spawnMine , 10)
		AllMine.append(spawnMine)
		spawnMine.position = copyAllPoints[rand_range(12,copyAllPoints.size())]
		
		
	
	
	
	
		pass 



func _process(delta):
	
	pass
