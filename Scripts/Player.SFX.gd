extends AudioStreamPlayer

export(Resource) var playerSFX

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func playerHit():		
	playerSFX.set_loop(false)
	stream = playerSFX
	play()
	

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
