extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) var char_nodepath
var char_node


var isInArea = false


# Called when the node enters the scene tree for the first time.
func _ready():
	char_node  = get_node(char_nodepath)
	
	
	print("works")
	pass # Replace with function body.

func _on_Trigger_body_entered(Player):
	print("entered")
	isInArea=true
	
	pass # Replace with function body. 
	
func _on_Trigger_body_exited(Player):
	print("exited")
	isInArea=false
	pass # Replace with function body.



 
func _process(delta):
	if isInArea == true:
		print("should be dead")






