extends Area2D
var isTaken = false

signal scoreIncreased


func _ready():
	connect("scoreIncreased" , self , "increaseScore")
#	labelHS = 
	pass # Replace with function body.


func increaseScore():
	Status.currentScore = Status.currentScore + 100
	Spawn.labelHSInstance.text = str(Status.currentScore)
	print(Status.currentScore)

func _on_Area2D_body_entered(body):
	emit_signal("scoreIncreased")
	
	if(visible == true):
		Status.numberOfCoffeCups -= 1
		visible = false
		
		if(Status.numberOfCoffeCups == 0):
			Spawn.coffeCupOnEnter()
#			
			for n in range(Spawn.AllCups.size()):
				Spawn.AllCups[n].visible = true
				Spawn.positionForThisCycleCoffeCup = rand_range(13,Spawn.copyAllPoints.size())
				Spawn.AllCups[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleCoffeCup]
			Status.numberOfCoffeCups = 3

	
pass # Replace with function body.
