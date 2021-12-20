extends Node
# Manages saving and loading player data using Godot's group system 
# Nodes in each group within save_groups have their save_data functions called to fill the group key of the save file dictionary

export(Array, String) var save_groups: Array

# Developer path can be used to save files within the project root folder to allow for quick editing and testing
# Note that any files saved in res:// are impossible to be read in an exported game, so it is ideal to keep the actual save path within user://
export var save_folder_path: String = "user://"
export var developer_save_folder_path: String = "res://"

var save_file_template_path: String = "res://addons/rpg_framework/save_file/save_file_template.gd"

# Developer files are saved as .tres files without encryption
func save_file(id: int, developer_mode: bool) -> void:
	var file = load(save_file_template_path).new()
	for group in save_groups:
		var group_data := {}
		for node in get_tree().get_nodes_in_group(group):
			group_data[node.save_id] = node.save_data()
		file.data[group] = group_data
	var dir = Directory.new()
	if developer_mode:
		dir.remove(developer_save_folder_path + "%02d.tres" % id)
		ResourceSaver.save(developer_save_folder_path + "%02d.tres" % id, file)
	else:
		dir.remove(save_folder_path + "%02d.tres" % id)
		ResourceSaver.save(save_folder_path + "%02d.tres" % id, file)

func load_file(id: int, developer_mode: bool) -> void:
	var file
	if developer_mode:
		file = load(developer_save_folder_path + "%02d.tres" % (id)) 
	else:
		file = load(save_folder_path + "%02d.tres" % (id)) 
	for group in save_groups:
		for node in get_tree().get_nodes_in_group(group):
			node.load_data(file.data[group][node.save_id])
