extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Resource) var test1
export(Resource) var test2
export(Resource) var test3

#var sfx
#var audio1 = "res://Audio/Battle.ogg"
#var audio2 = "res://Audio/Random Battle.ogg"
#var audio3 = "res://fight.ogg"
var arrAudio = [test1 , test2 , test3]
#var deathSound = "res://GAMEOVER.wav"

#func deathSound():
#	sfx = load(deathSound)
##	sfx.set_loop(false)
#	stream = sfx
#	stream_paused = true
#	stream_paused = false


# Called when the node enters the scene tree for the first time.
func _ready():

#
#	stream = test1
#	play()
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var audioForIsntance = rng.randi_range(0,2)
	print(audioForIsntance)
	
	if(audioForIsntance == 0):
		stream = test1
		play()
	if(audioForIsntance == 1):
		stream = test2
		play()
	if(audioForIsntance == 2):
		stream = test3
		play()

		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
