extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	OS.shell_open("https://soundcloud.com/mutkanto")
	pass # Replace with function body.


func _on_3xBlast_pressed():
	OS.shell_open("https://opengameart.org/content/glitchy-battle")
	pass # Replace with function body.


func _on_controllerhead_pressed():
	OS.shell_open("https://opengameart.org/content/random-battle")
	pass # Replace with function body.


func _on_TheMightyglider_pressed():
	OS.shell_open("https://opengameart.org/content/catching-fire")
	pass # Replace with function body.


func _on_Blender_Foundation_pressed():
	OS.shell_open("https://opengameart.org/content/big-explosion")
	pass # Replace with function body.


func _on_NenadSimic_pressed():
	OS.shell_open("https://opengameart.org/content/picked-coin-echo-2")
	pass # Replace with function body.


func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.


func _on_BuzzerZero_pressed():
	OS.shell_open("https://twitter.com/BuzzerZero")
	pass # Replace with function body.


func _on_blacklodgegames_pressed():
	OS.shell_open("https://opengameart.org/content/27-metal-audio-samples-sfx")
	pass # Replace with function body.


func _on_themightyglider_pressed():
	OS.shell_open("https://opengameart.org/content/catching-fire")
	pass # Replace with function body.
