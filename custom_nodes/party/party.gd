extends Node
# Collection of associated Fighters in a battle

export var fighter_scene_path := "res://"
export var save_id := ""

func save_data() -> Array:
	var fighter_data := []
	for fighter in get_children():
		fighter_data.append([fighter.save_id, fighter.save_data()])
	return fighter_data

func load_data(save_array: Array) -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	for fighter_data in save_array:
		var new_fighter = load(fighter_scene_path + "%s/%s" % [fighter_data[0], fighter_data[0]] + ".tscn").instance()
		add_child(new_fighter)
		new_fighter.load_data(fighter_data[1])
