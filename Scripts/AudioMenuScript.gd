extends Control


var music = AudioServer.get_bus_index("SFX")
var sfx = AudioServer.get_bus_index("Music")
onready var file = 'res://textFiles/AudioStuffs.tres'

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioServer.set_bus_volume_db(music, float(AudioManagment.Music))
	AudioServer.set_bus_volume_db(sfx, float(AudioManagment.SFX))
	get_node("Music").value = int(AudioManagment.Music)
	get_node("SFX").value = int(AudioManagment.SFX)
	print(AudioManagment.Music)
	print(AudioManagment.SFX)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_IncreasseSFX_button_down():
	get_node("SFX").value = get_node("SFX").value + 4
	pass # Replace with function body.


func _on_DecreasseSFX_button_down():
	get_node("SFX").value = get_node("SFX").value - 4
	pass # Replace with function body.


func _on_IncreasseMusic_button_down():
	get_node("Music").value = get_node("Music").value + 4
	pass # Replace with function body.


func _on_DecreasseMusic_button_down():
	get_node("Music").value = get_node("Music").value - 4
	pass # Replace with function body.


	
	pass # Replace with function body.


func _on_Exit_button_down():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.


func _on_Submit_pressed():
	AudioServer.set_bus_volume_db(music, get_node("Music").value)
	AudioServer.set_bus_volume_db(sfx, get_node("SFX").value)
	var f = File.new()
	f.open(file, File.WRITE)
	f.store_line(str(get_node("Music").value))
	f.store_line(str(get_node("SFX").value))
	f.close()
	AudioManagment.Music =  get_node("Music").value
	AudioManagment.SFX =  get_node("SFX").value
	
	print("ThisOne")
	print(get_node("Music").value)
	print(get_node("SFX").value)
	pass # Replace with function body.
