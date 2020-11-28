#tool
extends Node2D


var arrayPosTrapdoor = []
var doUntill = true;
var wrightIntoSpawnArray
var spawnCoordX = 200;
var spawnCoordY = 200;

var trapDoor = load("res://Scenes/TrapDoor.tscn")
var trap = trapDoor.instance()
var enemiesGenerated = []
var numberOfEnemies = 30
var player
var randx 
var randy 
var trap1
var trap2
var lostScreen


#wait a second timer



func initialize_spots(arrayOfSpots):
	while (doUntill == true):
		
		if (spawnCoordX > 1900 && spawnCoordY > 1000):
			doUntill = false
		
		if (spawnCoordX > 1900):
			spawnCoordY = spawnCoordY + 300
			spawnCoordX = 50 
			
		else:
			spawnCoordX = spawnCoordX + 400
		pass
		
		
		wrightIntoSpawnArray = Vector2(spawnCoordX , spawnCoordY)
		arrayOfSpots.append(wrightIntoSpawnArray)
	
	
	pass
	

	
# Called when the node enters the scene tree for the first time.
func _ready():
	initialize_spots(arrayPosTrapdoor)
	randomize()
	var numb = rand_range(0 , 1000)
	
	
	player = get_node("Player")
	
	
	
	for n in range(numberOfEnemies):

#		

		var trapToBeMade = "trap"+str(n)
		trapToBeMade = trapDoor.instance()

		add_child(trapToBeMade)
		move_child(trapToBeMade,0)
		enemiesGenerated.append(trapToBeMade)
		enemiesGenerated[n].position = Vector2(arrayPosTrapdoor[rand_range(0,arrayPosTrapdoor.size())])


func _process(delta):
	
	for n in range(numberOfEnemies):
		if (player.alive == false):
			get_node("CanvasLayer/Lost").visible = true
	pass
		
		


func _on_Button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
