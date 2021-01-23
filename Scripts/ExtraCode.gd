#print(get_node("trap1/Sprite").texture.get_size())

	trap1 = get_node("trap1")
	trap2 = get_node("trap2")
	
	overlaping_traps(trap1 , trap2 , 150)
#	if ((trap1.position.x >= trap2.position.x && trap1.position.x <= trap2.position.x + 500 || trap2.position.x >= trap1.position.x && trap2.position.x <= trap1.position.x +500) && (trap2.position.y >= trap1.position.y && trap2.position.y <= trap1.position.y + 500 ||trap2.position.y <= trap1.position.y && trap2.position.y >= trap1.position.y - 500)):
#		print("overlaps")
#	

if (trap1.position.x >= trap2.position.x && trap1.position.x <= trap2.position.x + 500 || trap2.position.x >= trap1.position.x && trap2.position.x <= trap1.position.x +500):
#		print("stuffsX")
#		pass
#
#	if trap2.position.y >= trap1.position.y && trap2.position.y <= trap1.position.y + 500 ||trap2.position.y <= trap1.position.y && trap2.position.y >= trap1.position.y - 500 :
#		print("stuffsY")

#	if trap2.position.x > trap1.position.x && trap2.position.x < trap1.position.x +500:
#		print("works")

#	if (trap1.position.x >= trap2.position.x && trap1.position.x <= trap2.position.x + 500 || trap2.position.x >= trap1.position.x && trap2.position.x <= trap1.position.x +500):
##		print("stuffs")
##		pass

	
	#if (trap1.position == trap2.position):
	#	print("overlaps")
	#trap1.position = trap1.position + Vector2(0,100)
	#print(trap1.position)
	
	
randx = rand_range(0 , 1000)
#		randy = rand_range(0 , 1000)
		
		
		
		#print(enemiesGenerated[n].get_position())

#		for i in range(enemiesGenerated.size()):
#			if overlaping_traps(enemiesGenerated[i],enemiesGenerated[i-1],150):
#				print("overlaping")
#				enemiesGenerated[n].set_position(Vector2(0,0)) 


		
		
		
#		for i in range(enemiesGenerated.size()):
#			if (enemiesGenerated[i].position == enemiesGenerated[n].position + Vector2(300,300)):
#				enemiesGenerated[i].position = Vector2(randx,randy)
		
		
		#enemiesGenerated[n] = Vector2(randx,randy) works too 
		
		#print(enemiesGenerated)
		


			
	
	
	#for n in range(numberOfEnemies):
	
	#remove_child(enemiesGenerated[4])
	
	
	func overlaping_traps(trap1 , trap2 , distanceBeforeOverlap):
		if ((trap1.position.x >= trap2.position.x && trap1.position.x <= trap2.position.x + distanceBeforeOverlap || trap2.position.x >= trap1.position.x && trap2.position.x <= trap1.position.x +distanceBeforeOverlap) && (trap2.position.y >= trap1.position.y && trap2.position.y <= trap1.position.y + distanceBeforeOverlap ||trap2.position.y <= trap1.position.y && trap2.position.y >= trap1.position.y - distanceBeforeOverlap)):
			print("hello")
		pass
		
	#	var arr1 = [1, 2 ,3]
#	var arr2 = []
#
#	arr2 = arr1.duplicate()
#	arr2.remove(1)
#	print(arr1.size())
#	print(arr2.size())
	
#	Spawn.copyAllPoints = Spawn.AllPoints.duplicate()
#	print(Spawn.AllPoints.size())
#	for n in range(Spawn.AllItems.size()):
#		Spawn.positionForThisCycleTrapDoor = rand_range(0,Spawn.copyAllPoints.size())
#		Spawn.AllItems[n].position = Spawn.copyAllPoints[Spawn.positionForThisCycleTrapDoor]
