extends Node
# Represents any action in combat, such as guarding or using a magic skill

# Called by Fighter to affect the targets and/or the user
# Returns a dictionary consisting of the report of the action
# In your extension class, override this method and implement things such as damage calculation or graphical effects
func do(user: Node, targets: Array) -> Dictionary:
	return {"Missed": false, "Critical": true, "Hit Weakness": true}
