extends Node
var arrayPosTrapdoor = []
var doUntill = true;
var wrightIntoSpawnArray

var spawnCoordX = 200;
var spawnCoordY = 200;



func _ready():
	
	
	while (doUntill == true):
		
		if (spawnCoordX > 5300 && spawnCoordY > 5300):
			doUntill = false
		
		if (spawnCoordX > 5300):
			spawnCoordY = spawnCoordY + 250
			spawnCoordX = 200 
			
		else:
			spawnCoordX = spawnCoordX + 250
		pass
		
		
		wrightIntoSpawnArray = Vector2(spawnCoordX , spawnCoordY)
		arrayPosTrapdoor.append(wrightIntoSpawnArray)
	
	#print(arrayPosTrapdoor)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
