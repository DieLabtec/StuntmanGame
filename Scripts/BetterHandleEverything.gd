extends Node2D

var player
#spawn points params
var arrStartingX = 50
var arrStartingY = 10
var arrAddingToX = 135
var arrAddingToy = 80
var arrEndPointX = 1800
var arrEndPointY = 1100

#trapdoor params
var trapDoorSpawnPoints = []
var trapDoorArray = []
var howManyTrapDoors = 10
var coord
var delayBeforeEndScreen
var triggerDelay = true



var coffeCupArray = []
var howManyCoffeCups = 3

var trapDoor = preload("res://Scenes/TrapDoor.tscn")
var coffeCup = preload("res://Scenes/CoffeCup.tscn")


var coordRand
onready var loseScreen = get_node("CanvasLayer/Lost")


func initializeTrapsSpawnPoints(startingX , startingY ,  addingToX , addingToY , 
										endPointX, endPointY, arrayToBeFilled):
		var doUntill = true
		var wrightIntoArray
		var currentX = startingX
		var currentY = startingY
		
		while(doUntill == true):
			if(currentX > endPointX && currentY > endPointY):
				doUntill = false
			if(currentX > endPointX):
				currentY = currentY + addingToY
				currentX = startingX
				
			else:
				currentX = currentX + addingToX
				
			wrightIntoArray = Vector2(currentX, currentY)
			arrayToBeFilled.append(wrightIntoArray)
			
			pass
	
func spawnEnemies(arrayOfObjectsInTheGame ,arrayOfPoints , typeOfObject , howMany ):
		print("something")
		if (howMany > arrayOfPoints.size()):
			howMany = arrayOfPoints.size() 
		for n in range (howMany):
			var spawn = "spawn" + str(n)
			spawn = typeOfObject.instance()
			add_child(spawn)
			move_child(spawn , 0)
			arrayOfObjectsInTheGame.append(spawn)
#			
			coord = (rand_range(0 , arrayOfPoints.size()) +  rand_range(0 , arrayOfPoints.size()) + rand_range(0 , arrayOfPoints.size())) / 3
			coord as int
			arrayOfObjectsInTheGame[n].position = Vector2(arrayOfPoints[coord])
#			arrayOfPoints.remove(arrayOfPoints[rand_range(0 , arrayOfPoints.size())])
			
			
			pass
	

func clearItem(arrayOfTheObjectToBeCleared):
	for n in range (arrayOfTheObjectToBeCleared.size()):
			arrayOfTheObjectToBeCleared[n].queue_free()
			pass


	

func _ready():
	randomize()
	
	position = Vector2(0,0)
	
	player = get_node("Player")
	
	delayBeforeEndScreen = Timer.new()
	delayBeforeEndScreen.set_one_shot(true)
	delayBeforeEndScreen.set_wait_time(2)
	delayBeforeEndScreen.connect("timeout",self,"loseScreenAppear")
	add_child(delayBeforeEndScreen)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
#	while(Spawn.spawnTrapdoor.overlaps_area(Spawn.Player) == true):
#		print("overlaps")
	
	
	
	if (Status.alive == false):
#			get_node("CanvasLayer/Lost").visible = true
			
			if(triggerDelay == true):
				triggerDelay = false
				delayBeforeEndScreen.start()
#			loseScreen.visible = true
	
	if (Input.is_action_pressed("ui_accept") && loseScreen.visible == true):
		Spawn.labelHSInstance.text = str(0)
		Status.currentScore = 0
		Status.alive = true
		Status.diedMissile = false
		Status.diedTrapDoor = false
		print(Status.alive)
		Spawn.coffeCupOnEnter()
		position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
		for n in range(Spawn.AllCups.size()):
			Spawn.AllCups[n].visible = true	
			Spawn.positionForThisCycleCoffeCup = rand_range(12,Spawn.copyAllPoints.size())
			Spawn.AllCups[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleCoffeCup]
		for n in range(Spawn.AllMine.size()):
			Spawn.AllMine[n].mineCleanUp()
			Spawn.AllMine[n].position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
		Status.numberOfCoffeCups = 3
		randomize()
		get_tree().reload_current_scene()
	
	pass
	
	

	
func _on_Button_pressed():
	triggerDelay = true
	Spawn.labelHSInstance.text = str(0)
	Status.currentScore = 0
	Status.alive = true
	Status.diedMissile = false
	Status.diedTrapDoor = false
	print(Status.alive)
	Spawn.coffeCupOnEnter()
	position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
	for n in range(Spawn.AllCups.size()):
		Spawn.AllCups[n].visible = true	
		Spawn.positionForThisCycleCoffeCup = rand_range(12,Spawn.copyAllPoints.size())
		Spawn.AllCups[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleCoffeCup]
	for n in range(Spawn.AllMine.size()):
		Spawn.AllMine[n].mineCleanUp()
		Spawn.AllMine[n].position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
	Status.numberOfCoffeCups = 3
	randomize()
	get_tree().reload_current_scene()
	
	pass


func loseScreenAppear():
	loseScreen.visible = true
	


