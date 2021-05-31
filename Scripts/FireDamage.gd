extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(overlaps_body(Spawn.Player) && Status.canTakeDamage == true && Status.hitPoints > 1):
		Spawn.Player.tookDamage()
#		Status.alive = false
#		Status.diedMissile = true
	if(overlaps_body(Spawn.Player) && Status.canTakeDamage == true && Status.hitPoints == 1):
		Status.alive = false
		Status.diedFire = true
		Status.hitPoints = Status.hitPoints - 1
	pass
