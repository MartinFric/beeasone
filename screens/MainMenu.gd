extends MarginContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_newGame_pressed():
	get_tree().change_scene("res://DefenseLevel.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _process(delta):
   if Input.is_action_pressed("ui_cancel"):
      get_tree().quit()




func _on_about_pressed():
	get_tree().change_scene("res://screens/Credits.tscn")
