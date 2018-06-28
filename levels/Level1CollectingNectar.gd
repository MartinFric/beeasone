extends Node

var objectivePopupMenu
# class member variables go here, for example:
# var a = 2
var nectarCollected = 0

func _ready():
	objectivePopupMenu = get_node("ObjectiveFlowersPopup")
	objectivePopupMenu.show()

func on_collected:
	nectarCollected += 3
	
func start_game():
	var flowers = get_tree().get_nodes_in_group("flowers")
	for f in flowers:
		f.connect("collected", self, "on_collected")
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
