extends Node

var objectivePopupMenu
# class member variables go here, for example:
# var a = 2
var nectarCollected = 0

func _ready():
	objectivePopupMenu = get_node("ObjectiveFlowersPopup")
	objectivePopupMenu.show()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
