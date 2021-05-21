extends Node

onready var file = 'res://textFiles/AudioStuffs.tres'
var music = AudioServer.get_bus_index("Music")
var sfx = AudioServer.get_bus_index("SFX")
var SFX 
var Music

# Called when the node enters the scene tree for the first time.
func _ready():
	var f = File.new()
	f.open(file, File.READ)
	SFX = f.get_line()
	Music = f.get_line()
#	f.open(file, File.WRITE)
#	f.store_line("-20")
#	f.store_line("-20")
	f.close()
	
	AudioServer.set_bus_volume_db(music, float(SFX))
	AudioServer.set_bus_volume_db(sfx, float(Music))
	AudioServer.set_bus_mute(sfx, false)
	AudioServer.set_bus_mute(music, false)
	print("audio")
	print(SFX)
	print(Music)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
