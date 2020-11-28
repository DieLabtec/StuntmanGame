extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) var char_nodepath
export(NodePath) var animationSpritePath
var animationSprite
var char_node

var playerIsDead = false
var isInArea = false
var trapDoorOpened = false
var timer 
var waitTimeForTrapDoor = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	char_node  = get_node(char_nodepath)
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_wait_time(waitTimeForTrapDoor)
	timer.connect("timeout",self,"endOfTimer")
	add_child(timer)
	timer.start()
	#print("works")
	pass # Replace with function body.
	
func endOfTimer():
#	print("works")
	if trapDoorOpened == false:
		$AnimatedSprite.play("opening")
		trapDoorOpened = true
	else:
		$AnimatedSprite.play("closing")
		trapDoorOpened = false

func _on_Trigger_body_entered(Player):
	print("entered")
	isInArea=true
	
	pass # Replace with function body. 
	
func _on_Trigger_body_exited(Player):
	print("exited")
	isInArea=false
	pass # Replace with function body.



 
func _process(delta):
	if isInArea == true && trapDoorOpened == true:
		char_node.alive = false
		






