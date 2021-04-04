extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Resource) var mineExplodeSFX


func mineExploadingSFX():
#		if File.new().file_exists(mineExplodeSFX):
#			sfx = load(mineExplodeSFX) 
#			sfx.set_loop(false)
#			stream = sfx
			mineExplodeSFX.set_loop(false)
			stream = mineExplodeSFX
			play()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
