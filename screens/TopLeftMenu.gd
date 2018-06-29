extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass

func _on_menu_mouse_entered():
	pass # replace with function body

func _on_MenuTexture_pressed():
	get_tree().change_scene("res://screens/MainMenu.tscn")

func _on_Bee_recovery(recoveryState):
	if recoveryState > 2.95:
		recoveryState = 3 
	$Speed.value = recoveryState

func _on_Node_timerStart(time):
	$Timer.value = time
