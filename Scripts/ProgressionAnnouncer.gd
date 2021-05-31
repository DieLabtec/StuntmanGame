extends AudioStreamPlayer
var rng = RandomNumberGenerator.new()

export(Resource) var voiceLine1
export(Resource) var voiceLine2
export(Resource) var voiceLine3
export(Resource) var voiceLine4
export(Resource) var voiceLine5
export(Resource) var voiceLine6
export(Resource) var voiceLine7
export(Resource) var voiceLine8
export(Resource) var voiceLine9
export(Resource) var voiceLine10
export(Resource) var voiceLine11
export(Resource) var voiceLine12
export(Resource) var voiceLine13
export(Resource) var voiceLine14

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playProgression():
	var arrAudio = [voiceLine1, voiceLine2 , voiceLine3, voiceLine4, voiceLine5, voiceLine6, voiceLine7, 
voiceLine8, voiceLine9, voiceLine10, voiceLine11, voiceLine12, voiceLine13, voiceLine14]
	rng.randomize()
	var audioForIsntance = rng.randi_range(0,13)
	stream = arrAudio[audioForIsntance]
	play()
	print(arrAudio[audioForIsntance])
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
