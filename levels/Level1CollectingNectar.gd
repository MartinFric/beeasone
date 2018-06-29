extends Node

var objectivePopupMenu
# class member variables go here, for example:
# var a = 2
var nectarCollected = 0

func _ready():
	#objectivePopupMenu = get_node("ObjectiveFlowersPopup")
	#objectivePopupMenu.connect("hidden", self, "on_objectives_read")
	#objectivePopupMenu.show()
	start_game()

func on_objectives_read():
	print("objectives read")
	start_game()
	
func on_collected():
	print("COLLECTED!!")
	nectarCollected += 3
	
func start_game():
	var flowers = get_tree().get_nodes_in_group("flowers")
	for f in flowers:
		f.connect("collected", self, "on_collected")
		f.start_timer()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
