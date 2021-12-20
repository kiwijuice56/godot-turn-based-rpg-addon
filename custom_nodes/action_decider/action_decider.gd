extends Node
# Component node of Fighter that controls decisions of a fighter

export var action_scene_path := "res://"

# Called by Fighter parent to receive input of what actions to take
# Input context consists of other parties in a battle and other conditional information
# Returns a dictionary detailing the action, targets, or any other information needed by the Fighter
# In your extension class, override this method and implement logic for your players and enemies
func decide(context: Dictionary) -> Dictionary:
	return {"Action": null, "Target": []}

func get_action_array() -> Array:
	var save_ids := []
	for action in get_children():
		save_ids.append(action.save_id)
	return save_ids

func save_data() -> Array:
	return get_action_array()

func load_data(save_ids: Array) -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	for save_id in save_ids:
		var new_action = load(action_scene_path + "%s/%s" % [save_id, save_id] + ".tscn").instance()
		add_child(new_action)
