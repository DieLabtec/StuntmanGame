extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	
	pass # Replace with function body.

func _input(event):
 if(event.is_action_pressed("ui_cancel")):
  if(get_tree().paused == true):
			get_tree().paused = false
			get_node("/root/Node2D/CanvasLayer/Lost").visible = false
			get_node("/root/Node2D/CanvasLayer/Lost/Resume").visible = false
		else:
			get_tree().paused = true
			get_node("/root/Node2D/CanvasLayer/Lost").visible = true
			get_node("/root/Node2D/CanvasLayer/Lost/Resume").visible = true

func _process(delta):
#	if Input.is_action_pressed("ui_cancel"):
#		if(get_tree().paused == true):
#			get_tree().paused = false
#		else:
#			get_tree().paused = true
	


	
	pass


func _on_Resume_pressed():
	get_tree().paused = false
	get_node("/root/Node2D/CanvasLayer/Lost").visible = false
	pass # Replace with function body.
