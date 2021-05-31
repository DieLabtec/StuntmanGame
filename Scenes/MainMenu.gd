extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	get_node("Start").grab_focus()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
	get_node("Quit2").rect_position.x = get_node("Start2").rect_position.x
	get_node("Quit2").rect_position.y = get_node("Quit2").rect_position.y
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Node2D.tscn")
	Spawn.generateLevel1()
	Status.initialRestart = false
	pass # Replace with function body.



func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Start2_pressed():
	get_tree().change_scene("res://Scenes/Node2D.tscn")
	Spawn.generateLevel1()
	Status.initialRestart = false
	pass # Replace with function body.


func _on_Quit2_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Settings_button_down():
	get_tree().change_scene("res://Scenes/AudioMenu.tscn")
	pass # Replace with function body.


func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")
	pass # Replace with function body.
