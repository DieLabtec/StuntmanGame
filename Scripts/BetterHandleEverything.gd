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
	

func initializeAudio():
	var speech_player = AudioStreamPlayer.new()
	var audio_file = "res://Random Battle.ogg"
	if File.new().file_exists(audio_file):
		var sfx = load(audio_file) 
		sfx.set_loop(false)
		speech_player.stream = sfx
		speech_player.volume_db = 12
		speech_player.play()
		add_child(speech_player)
		print("speech_player")
		print(speech_player.stream)
		print(speech_player.is_playing())
		print(speech_player.bus)


func _ready():
#	print("is it fucked")
#	print(0.1 + 0.2 == 0.3)
#	initializeAudio()
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
	
	
	if (Status.alive == false):

			
			if(triggerDelay == true):
				triggerDelay = false
				get_node("/root/Node2D/AudioStreamPlayer")._set_playing(false)
				get_node("/root/Node2D/DeathSound")._set_playing(true)
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
	Status.displayCD.stop()
	Spawn.clearLevel1()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
