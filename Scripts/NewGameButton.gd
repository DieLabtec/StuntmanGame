extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(has_focus())
	grab_focus()
	pass # Replace with function body.


	
 
func _process(delta):
	if(has_focus() == true):
		rect_scale = Vector2(1.2 ,1.2)
	else:
		rect_scale = Vector2(1 , 1)
	
	pass
