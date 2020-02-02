extends Node

var levelstats = {
	"Level1": {"stars": 0},
	"Level2": {"stars": 0},
	"Level3": {"stars": 0},
	"Level4": {"stars": 0}
}
var levelmsgs = {
	"Level1": "Tom: Please... just make the tower stop collapsing on me...\nStars:\n*: Keep Tom alive for 2s\n**: 5 seconds\n***: 5 seconds - using one block",
	"Level2": "Tom: Please... This tower I climbed is about to collapse...\nStars:\n*: Keep Tom above line for 2s\n**: 5 seconds\n***: 5 s - using < 4 blocks",
	"Level3": "Tom: Please... my attic is too heavily loaded!...\nStars:\n*: Keep Tom alive for 2s\n**: 5 seconds\n***: 5 s - using one block",
	"Level4": "Tom: Please... stop my fall before terminal velocity...\nStars:\n*: Keep Tom above line for 2s\n**: 5 seconds\n***: 5 s - using < 6 blocks"
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
	
func quit_game():
	get_node("/root/Root/TransitionLayer/Transition").transition()
	yield(get_node("/root/Root/TransitionLayer/Transition"), "change_the_scene_right_now")
	get_tree().quit()
	pass
