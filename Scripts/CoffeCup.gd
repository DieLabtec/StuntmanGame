extends Area2D
var isTaken = false





func _ready():
	
	pass # Replace with function body.





func _on_Area2D_body_entered(body):
#	var arr1 = [1, 2 ,3]
#	var arr2 = []
#
#	arr2 = arr1.duplicate()
#	arr2.remove(1)
#	print(arr1.size())
#	print(arr2.size())
	
	Spawn.copyAllPoints = Spawn.AllPoints.duplicate()
	print(Spawn.AllPoints.size())
	for n in range(Spawn.AllItems.size()):
		Spawn.positionForThisCycle = rand_range(0,Spawn.copyAllPoints.size())
		Spawn.AllItems[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycle]
	
	position = Spawn.copyAllPoints[rand_range(0,Spawn.copyAllPoints.size())]
	
	pass # Replace with function body.
