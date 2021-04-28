extends Area2D
var isTaken = false
onready var progressCoffeane = get_node("/root/Node2D/ProgressBar")

signal scoreIncreased
signal timeIncrease


func _ready():
	connect("scoreIncreased" , self , "increaseScore")
	connect("timeIncrease" , self , "upTime")
	pass # Replace with function body.


func increaseScore():
	Status.currentScore = Status.currentScore + 100
	Spawn.labelHSInstance.text = str(Status.currentScore)
	print(Status.currentScore)
	
func upTime():
	get_node("/root/Node2D/ProgressBar").value = get_node("/root/Node2D/ProgressBar").value + 5


func _on_Area2D_body_entered(body):
	emit_signal("scoreIncreased")
	emit_signal("timeIncrease")
	
	if(visible == true):
		Status.numberOfCoffeCups -= 1
		visible = false
		get_node("AudioStreamPlayer").play()
		
		if(Status.numberOfCoffeCups == 0):
			Spawn.coffeCupOnEnter()
#			
			for n in range(Spawn.AllCups.size()):
				Spawn.AllCups[n].visible = true
				Spawn.positionForThisCycleCoffeCup = rand_range(13,Spawn.copyAllPoints.size())
				Spawn.AllCups[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleCoffeCup]
			Status.numberOfCoffeCups = 3

	
pass # Replace with function body.
