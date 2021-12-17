extends "res://addons/rpg_framework/fighter_cycle/fighter_cycle.gd"

func update_cycle() -> Array:
	var fighter_script : Script = load(RpgFramework.addon_path + "fighter/fighter.gd")
	var party_script : Script = load(RpgFramework.addon_path + "party/party.gd")
	for party in get_children():
		if not party is party_script:
			continue
		var party_cycle: Array = []
		for fighter in party.get_children():
			if not fighter is fighter_script:
				continue
			fighter.connect("tree_exited", self, "remove_fighter_from_cycle", [fighter])
			party_cycle.append(fighter)
			party_cycle.sort_custom(self, "compare_fighters")
		cycle.append(party_cycle)
	return cycle

func start_next_fighter() -> void:
	if len(cycle) > 0:
		for fighter in cycle[0]:
			fighter.call_deferred("act", {"Fighters": cycle})
			var report : Dictionary = yield(fighter, "act_completed")
		
		var temp = cycle[0]
		cycle.remove(0)
		cycle.append(temp)
