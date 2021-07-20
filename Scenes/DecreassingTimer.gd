extends ProgressBar

var decreasingTimer = Timer.new()




func _ready():
	decreasingTimer.set_one_shot(false)
	decreasingTimer.set_wait_time(0.4)
	decreasingTimer.connect("timeout", self, "onTimerOut")
	add_child(decreasingTimer)
	decreasingTimer.start()
	
	
	print(get_node("/root/Node2D/ProgressBar").value)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func onTimerOut():
	if(value > 0 && Status.alive == true && get_tree().paused == false):
		value = value - 2
		print(value)
	elif(Status.diedFire == false && Status.diedMissile == false && Status.diedTrapDoor == false):
		Status.alive = false
		Status.diedByTimeout = true
		

