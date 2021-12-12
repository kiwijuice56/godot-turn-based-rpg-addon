extends Node
# Component node of Fighter that controls decisions of a fighter

# Called by Fighter parent to receive input of what actions to take
# Input context consists of other parties in a battle and other conditional information
# Returns a dictionary detailing the action, targets, or any other information needed by the Fighter
# In your extension class, override this method and implement logic for your players and enemies
func decide(context: Dictionary) -> Dictionary:
	return {"Action": null, "Target": []}
