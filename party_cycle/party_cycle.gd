extends Node
# Collection of all parties in a battle and function as the root of a combat tree

# Compares Parties for sorting
# In your extension, override this and implement your own comparison
func compare_parties(a: Node, b: Node) -> bool:
	return false

# Sorts children Fighters
func sort_parties() -> void:
	var children : Array = []
	for child in get_children():
		remove_child(child)
		children.append(child)
	children.sort_custom(self, "compare_parties")
	for child in children:
		add_child(child)

# Continue battle sequence on next Party 
func start_next_party() -> void:
	pass
