extends Node
var trapDoor = preload("res://Scenes/TrapDoor.tscn")
var coffeCup = preload("res://Scenes/CoffeCup.tscn")

var arrStartingX = 65 #65
var arrStartingY = 100
var arrAddingToX = 136
var arrAddingToy = 78
var arrEndPointX = 1790 #1790 
var arrEndPointY = 1000 #1100

var alive = true

var spawnTrapdoor
var spawnCup

var positionForThisCycle


var AllPoints = []
var copyAllPoints = []

var AllItems = []

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


func spawnTrapDoor():
		spawnTrapdoor = trapDoor.instance()
		add_child(spawnTrapdoor)
		move_child(spawnTrapdoor , 0)
		AllItems.append(spawnTrapdoor)
		
		pass
	
	
pass

func copyArray(from , to):
	to = from



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawnCup = coffeCup.instance()
	add_child(spawnCup)
	spawnCup.position = Vector2(500 , 500)
	
	
	initializeTrapsSpawnPoints(arrStartingX , arrStartingY , arrAddingToX , arrAddingToy , arrEndPointX , arrEndPointY ,AllPoints)
	
	copyAllPoints = AllPoints.duplicate()
	for n in range(15):
		spawnTrapDoor()
		positionForThisCycle = rand_range(0,copyAllPoints.size())
		AllItems[n].position = copyAllPoints[positionForThisCycle]
		print(copyAllPoints.size())
		copyAllPoints.remove(positionForThisCycle)
		print(copyAllPoints.size())
	pass
	
	
	
#	spawnTrapDoor()
#	AllItems[0].position = AllPoints[0]
	
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	pass
