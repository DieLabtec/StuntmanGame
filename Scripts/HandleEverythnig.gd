extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var trapDoor = load("res://Scenes/TrapDoor.tscn")
var trap = trapDoor.instance()
var enemiesGenerated = []
var numberOfEnemies = 8
var player
var randx 
var randy 
var trap1
var trap2

var tryUntil = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	trap1 = get_node("Trigger")
	trap2 = get_node("Trigger2")
	
	
	
	#if (trap1.position == trap2.position):
	#	print("overlaps")
	trap1.position = trap1.position + Vector2(0,100)
	print(trap1.position)
	
	for n in range(numberOfEnemies):
		randomize()
		randx = rand_range(0 , 1000)
		randy = rand_range(0 , 1000)
		
		
		
		var trapToBeMade = "trap"+str(n)
		trapToBeMade = trapDoor.instance()
		add_child(trapToBeMade)
		enemiesGenerated.append(trapToBeMade)
		
		enemiesGenerated[n].position = Vector2(randx,randy)
		print(enemiesGenerated[n].get_position())
		
		
		
#		for i in range(enemiesGenerated.size()):
#			if (enemiesGenerated[i].position == enemiesGenerated[n].position + Vector2(300,300)):
#				randomize()
#				enemiesGenerated[i].position = Vector2(randx,randy)
		
		
		#enemiesGenerated[n] = Vector2(randx,randy) works too 
		
		#print(enemiesGenerated)
		


			
	
	
	#for n in range(numberOfEnemies):
	
	

func _process(delta):

	for n in range(numberOfEnemies):
		if (enemiesGenerated[n].isInArea == true):
		 player.alive = false
	
		
		
