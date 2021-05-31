extends Area2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	set_process(false)
	
	pass # Replace with function body.



	pass # Replace with function body. 
	

	



func _process(delta):
	
#	position = Spawn.Player.position
	
	
	pass

func crossHair():
	$bomb.position = Vector2(-0.23 , -2.939)
	$bomb.play("crosshair")
	
func bombFalling():
	$bomb.play("bombFalling")
	$bomb.position = Vector2(-5 , -310)
	
func playX():
	$bomb.play("x")
		
func overlapsWithPlayer():
		if(overlaps_body(Spawn.Player)):
			Status.missileOverlapsWithPlayerForFinalTimer = true
			
			
func playExplosion():
	get_node("AudioStreamPlayer").mineExploadingSFX()
