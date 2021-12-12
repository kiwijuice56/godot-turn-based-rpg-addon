extends Node
# Collection of associated Fighters in a battle

# Compares Fighters for sorting
# In your extension, override this and implement your own comparison
func compare_fighters(a: Node, b: Node) -> bool:
	return false

# Sorts children Fighters
func sort_fighters() -> void:
	var children : Array = []
	for child in get_children():
		remove_child(child)
		children.append(child)
	children.sort_custom(self, "compare_fighters")
	for child in children:
		add_child(child)

# Continue battle sequence on next Fighter 
func start_next_fighter() -> void:
	pass
