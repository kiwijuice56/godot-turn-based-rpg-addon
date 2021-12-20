extends Node
# Represents any action in combat, such as guarding or using a magic skill

signal action_completed

export var save_id := ""

# Called by Fighter to affect the targets and/or the user
# Emits a signal with a dictionary consisting of the report of the action
# In your extension class, override this method and implement things such as damage calculation or graphical effects
func action(user: Node, targets: Array) -> void:
	emit_signal("action_completed", {"Missed": false, "Critical": true, "Hit Weakness": true})
