tool
extends EditorPlugin
class_name RpgFramework

const addon_path: String = "res://addons/rpg_framework/"

func _enter_tree():
	add_custom_type("Fighter", "Node",
	load(addon_path+"fighter/fighter.gd"), 
	load(addon_path+"fighter/fighter_icon.png"))
	
	add_custom_type("Party", "Node",
	load(addon_path+"party/party.gd"),
	load(addon_path+"party/party_icon.png"))
	
	add_custom_type("PartyCycle", "Node",
	load(addon_path+"party_cycle/party_cycle.gd"),
	load(addon_path+"party_cycle/party_cycle_icon.png"))
	
	add_custom_type("Action", "Node",
	load(addon_path+"action/action.gd"),
	load(addon_path+"action/action_icon.png"))
	
	add_custom_type("ActionDecider", "Node",
	load(addon_path+"action_decider/action_decider.gd"),
	load(addon_path+"action_decider/action_decider_icon.png"))

func _exit_tree():
	remove_custom_type("Fighter")
	remove_custom_type("Party")
	remove_custom_type("PartyCycle")
	remove_custom_type("Action")
	remove_custom_type("ActionDecider")
