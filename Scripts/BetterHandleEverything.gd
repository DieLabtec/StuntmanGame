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

#func refreshScene():
#	get_tree().paused = false
#	Spawn.Player.position = Vector2(100, 100)
#	Spawn.labelHSInstance.text = str(0)
#	Status.currentScore = 0
#	Status.alive = true
#	Status.diedMissile = false
#	Status.diedTrapDoor = false
#	print(Status.alive)
#	Spawn.coffeCupOnEnter()
##	position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
#	for n in range(Spawn.AllCups.size()):
#		Spawn.AllCups[n].visible = true	
#		Spawn.positionForThisCycleCoffeCup = rand_range(12,Spawn.copyAllPoints.size())
#		Spawn.AllCups[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleCoffeCup]
#	for n in range(Spawn.AllMine.size()):
#		Spawn.AllMine[n].mineCleanUp()
#		Spawn.AllMine[n].position = Spawn.copyAllPoints[rand_range(12,Spawn.copyAllPoints.size())]
#	Status.numberOfCoffeCups = 3
#	randomize()
#	get_tree().reload_current_scene()

	
#func _input(event):
#	if(event.is_action_pressed("ui_accept") && loseScreen.visible == true):
#		refreshScene()
#	pass

func _ready():
	randomize()
#	get_tree().paused = true
	if(Status.initialRestart == false):
		Status.initialRestart = true
		Spawn.refreshScene()
		
	position = Vector2(0,0)
	player = get_node("Player")
	
	delayBeforeEndScreen = Timer.new()
	delayBeforeEndScreen.set_one_shot(true)
	delayBeforeEndScreen.set_wait_time(2)
	delayBeforeEndScreen.connect("timeout",self,"loseScreenAppear")
	add_child(delayBeforeEndScreen)
	set_process_input(true)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
#	while(Spawn.spawnTrapdoor.overlaps_area(Spawn.Player) == true):
#		print("overlaps")
	
	
	
	if (Status.alive == false):

			
			if(triggerDelay == true):
				triggerDelay = false
				delayBeforeEndScreen.start()

	
	
	
func _on_Button_pressed():
	Spawn.refreshScene()
	
	pass


func loseScreenAppear():
	loseScreen.visible = true
	get_node("/root/Node2D/CanvasLayer/Lost/Control/Restart").grab_focus()
	
func loseScreenDissapear():
	loseScreen.visible = false


func _on_Restart_pressed():
	get_tree().paused = true
	pass # Replace with function body.


func _on_Main_Menu_pressed():
	get_tree().paused = false
	Spawn.clearLevel1()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
