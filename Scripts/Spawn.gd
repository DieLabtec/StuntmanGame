extends Node
var trapDoor = preload("res://Scenes/TrapDoor.tscn")
var coffeCup = preload("res://Scenes/CoffeCup.tscn")
var player = preload("res://Scenes/Player.tscn")
var labelHighScore = preload("res://Scenes/HighScoreLabel.tscn")
var bombWithX = preload("res://Scenes/xWithBomb.tscn")
var mine = preload("res://Scenes/Mine.tscn")
var background = preload("res://Background.tscn")

var testLabel = preload("res://TestLabel.tscn")
var positionForInstanceLabel

const arrStartingX = 206.521  #65
const arrStartingY = 100  #100
var arrAddingToX = 136  #136
var arrAddingToy = 78   #78
var arrEndPointX = 1569.394 #1790  #1705.394
var arrEndPointY = 744.844 #900  #744.844
var canStart = true

var firstTimeGeneration = true

var alive = true

#var spawnTrapdoor = 
var spawnTrapdoor
var spawnBombWithX = bombWithX.instance()
var spawnMine 
var backgroundInstance = background.instance()
var testLabelInstance = testLabel.instance()

var spawnCup


var Player = player.instance()
var labelHSInstance = labelHighScore.instance()

var positionForThisCycleTrapDoor
var positionForThisCycleCoffeCup
var positionForThisCycleMine


var AllPoints = []
var copyAllPoints = []

var AllTrapdoors = []
var AllItems = []
var AllCups = []

var AllMine = []
var currentMine

var doUntill = true
var wrightIntoArray
var currentX 
var currentY 


#difficulty increase parameters
var difIncreaseMines = []
var difIncreaseTrapdoor = []
var additionalMine
var additionalTrapDoor
var wave1 = true
var wave2 = true
var wave3 = true


func initializeTrapsSpawnPoints(startingX , startingY ,  addingToX , addingToY , 
										endPointX, endPointY, arrayToBeFilled):
		currentX = startingX
		currentY = startingY
		
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
	if(Status.currentScore > 999 && wave1 == true):
		for n in range(5):
			AllMine.append(difIncreaseMines[-1])
			difIncreaseMines.pop_back()
			wave1 = false
		print("difficulty increasse mine has been added")
		
	if(Status.currentScore > 2999 && wave2 == true):
		for n in range(5):
			AllMine.append(difIncreaseMines[-1])
			difIncreaseMines.pop_back()
			wave2 = false
		print("difficulty increasse mine has been added #2")
		
	if(Status.currentScore > 7499 && wave3 == true):
		for n in range(5):
			AllMine.append(difIncreaseMines[-1])
			difIncreaseMines.pop_back()
			wave3 = false
		print("difficulty increasse mine has been added #2")
		
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
		positionForThisCycleMine = rand_range(12,copyAllPoints.size())
		AllMine[n].mineCleanUp()
		AllMine[n].position = copyAllPoints[positionForThisCycleMine]
		copyAllPoints.remove(positionForThisCycleMine)
	
	
	pass
#	print("minessize")
#	print(AllMine.size())
#	print("trapdoorsize")
#	print(AllItems.size())

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

func generateLevel1():
		randomize()
	
		
#		add_child(spawnMine)
#		spawnMine.position = Vector2(200 , 200)
		for n in range(15):
			difficultyIncreaseMine()
			print(difIncreaseMines.size())
		pass
		
		
		#adds bomb with x to the scene
		add_child(spawnBombWithX)
		spawnBombWithX.position = Vector2(-200 , -200)
		
		
		#adds label with current score to the scene
		add_child(labelHSInstance)
		
		print(labelHSInstance.text + "stuffs")
		
		#adds player to the scene
		add_child(Player)
		move_child(Player , 1000)
		
		#add background
		add_child(backgroundInstance)
		move_child(backgroundInstance , 0)
		backgroundInstance.position = Vector2(0,0)
		if (firstTimeGeneration == true):
			initializeTrapsSpawnPoints(arrStartingX , arrStartingY , arrAddingToX , arrAddingToy , arrEndPointX , arrEndPointY ,AllPoints)
			AllPoints.pop_back()
			firstTimeGeneration = false
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
		for n in range(30):
			spawnTrapDoor()
			positionForThisCycleTrapDoor = rand_range(12,copyAllPoints.size())
			AllItems[n].position = copyAllPoints[positionForThisCycleTrapDoor]
	#		print(copyAllPoints.size())
			copyAllPoints.remove(positionForThisCycleTrapDoor)
	#		print(copyAllPoints.size())
		pass
		
		for n in range(10):
			positionForThisCycleMine = rand_range(12,copyAllPoints.size())
			spawnMine = mine.instance()
			add_child(spawnMine)
			move_child(spawnMine , 1)
			AllMine.append(spawnMine)
			spawnMine.position = copyAllPoints[positionForThisCycleMine]
			copyAllPoints.remove(positionForThisCycleMine)
			
			
#		Tool to display all positions numbers in the all points array
#		for n in range(AllPoints.size()):
#			testLabelInstance = testLabel.instance()
#			add_child(testLabelInstance)
#			testLabelInstance.rect_position = AllPoints[n]
#			Status.testDisp = Status.testDisp + 1
#			move_child(positionForInstanceLabel , 100)
		
		
			pass 

func clearLevel1():
		for n in range(AllCups.size()):
			remove_child(AllCups[n])
			
		for n in range(AllMine.size()):
			remove_child(AllMine[n])
		
		for n in range(AllItems.size()):
			remove_child(AllItems[n])
			
		remove_child(labelHSInstance)
		remove_child(backgroundInstance)
		remove_child(Player)
		remove_child(spawnBombWithX)
		
#		for n in range(AllPoints.size()):
#			AllPoints.pop_back()
		
		for n in range(copyAllPoints.size()):
			copyAllPoints.pop_back()
		
		for n in range(AllItems.size()):
			AllItems.pop_back()
		
		for n in range(AllMine.size()):
			AllMine.pop_back()
	
func refreshScene():
	print("wave1")
	print(wave1)
	print(Status.currentScore)
	get_tree().paused = false
	Spawn.Player.invincibilityRunsOut()
	Spawn.Player.position = Vector2(100, 100)
	Spawn.labelHSInstance.text = str(0)
	Status.currentScore = 0
	Status.hitPoints = 3
	Status.alive = true
	Status.diedMissile = false
	Status.diedTrapDoor = false
	print(Status.alive)
	Spawn.coffeCupOnEnter()
#	position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
	for n in range(Spawn.AllCups.size()):
		Spawn.AllCups[n].visible = true	
		Spawn.positionForThisCycleCoffeCup = rand_range(12,Spawn.copyAllPoints.size())
		Spawn.AllCups[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleCoffeCup]
	
	while(AllMine.size() > 10):
		AllMine[-1].queue_free()
		AllMine.pop_back()
		difficultyIncreaseMine()
		wave1 = true
		wave2 = true
		wave3 = true
	

		
	
	for n in range(Spawn.AllMine.size()):
		Spawn.AllMine[n].mineCleanUp()
		Spawn.AllMine[n].position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
	Status.numberOfCoffeCups = 3
	randomize()
	get_tree().reload_current_scene()
	
	
	
func difficultyIncreaseMine():
	additionalMine = mine.instance()
	add_child(additionalMine)
	additionalMine.position = Vector2(1900, 100)
	move_child(additionalMine , 1)
	difIncreaseMines.append(additionalMine)
	print("additional mine has been added")

func difficultyIncreaseTrapDoor():
	additionalTrapDoor = trapDoor.instance()
	add_child(additionalTrapDoor)
	additionalTrapDoor.position = Vector2(1900, 100)
	move_child(additionalTrapDoor , 1)
	difIncreaseTrapdoor.append(additionalTrapDoor)
	print("additional trapdoor has been added")
	
# Called when the node enters the scene tree for the first time.
func _ready():
#	generateLevel1()
	print("allMines")
	print(AllMine)
	print("additionalTrapdoors")
	print(difIncreaseTrapdoor)
	print("allitems")
	print(AllItems.size())
	pass

#
#func _process(delta):
#	pass
