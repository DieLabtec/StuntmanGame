extends Node2D
var flameTimer = Timer.new()
var flameTimer2 = Timer.new()
var flameTimer3 = Timer.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Fireball").play("Fireball")
	get_node("Carpet").play("Carpet")
	
	add_child(flameTimer)
	flameTimer.set_one_shot(true)
	flameTimer.set_wait_time(0.9)
	flameTimer.connect("timeout", self, "flameTimerTimeout")
	flameTimer.start()
	
	add_child(flameTimer2)
	flameTimer2.set_one_shot(true)
	flameTimer2.set_wait_time(2)
	flameTimer2.connect("timeout", self, "flameTimerTimeout2")
	
	add_child(flameTimer3)
	flameTimer3.set_one_shot(true)
	flameTimer3.set_wait_time(0.3)
	flameTimer3.connect("timeout", self, "flameTimerTimeout3")
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func flameTimerTimeout():
	get_node("Carpet").play("Loop")
	flameTimer2.start()

func flameTimerTimeout2():
	get_node("Carpet").play("End")
	flameTimer3.start()

func flameTimerTimeout3():
	get_node("Carpet").queue_free()


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
