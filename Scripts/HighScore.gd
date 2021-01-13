extends Node

var level = 1
var test

var coffeCupOnScreen = 3

func _ready():
	load_level()
	print(level)
	level = level + 1
	save_level()
	print(level)

func load_level():
	print("Loading...")

	var save_file = File.new()
	if not save_file.file_exists("user://savefile.save"):
		print("Aborting, no savefile")
		return

	save_file.open("user://savefile.save", File.READ)
	level = int(save_file.get_line())
	save_file.close()

func save_level():
	print("Saving...")

	var save_file = File.new()
	save_file.open("user://savefile.save", File.WRITE)
	save_file.store_line(str(level))
	save_file.close()
