tool
extends Node
# Basic framework for a fighter in an RPG

# Array of strings that represent special abilities or traits of this fighter
export var attributes: Array

# Called by Party parent node to continue turn-based battle sequence
# Input context consists of other parties in a battle and other conditional information
# Returns report of this fighter's turn
# In your extension class, override this method and implement any unique game logic
func act(context: Dictionary) -> Dictionary:
	var decision : Dictionary = get_action_decider().decide(context)
	return {"Success": true}

func get_action_decider() -> Node:
	var action_decider_script : Script = load(RpgFramework.addon_path + "action_decider/action_decider.gd")
	for child in get_children():
		if child is action_decider_script:
			return child
	push_error("Missing ActionDecider as child of Fighter")
	return null

# Overrides built-in configuration warning to display warning when missing an ActionDecider
func _get_configuration_warning() -> String:
	var action_decider_script : Script = load(RpgFramework.addon_path + "action_decider/action_decider.gd")
	var action_decider_count : int = 0
	for child in get_children():
		if child is action_decider_script:
			action_decider_count += 1
	if action_decider_count == 0:
		return "A Fighter node requires one ActionDecider (or extension) as a child node"
	if action_decider_count > 1:
		return "Multiple ActionDecider children detected; the Fighter node will only use the first in the node tree"
	return ""
