extends Node

var levelstats = {
	"Level1": {"stars": 0},
	"Level2": {"stars": 0},
	"Level3": {"stars": 0}
}
var dialogue = preload("res://Scenes/Dialogue.tscn")

func save_game():
	var save_file = File.new()
	save_file.open("user://savegame.save", File.WRITE)
	save_file.store_line(to_json(levelstats))
	save_file.close()
	
func load_game():
	var save_file = File.new()
	if not save_file.file_exists("user://savegame.save"):
		return
	save_file.open("user://savegame.save", File.READ)
	levelstats = parse_json(save_file.get_line())
	save_file.close()

func show_dialogue(text):
	var dialogue_instance = dialogue.instance()
	get_node("/root/Root/TransitionLayer").add_child(dialogue_instance)
	get_node("/root/Root/TransitionLayer/Dialogue").set_text(text)
