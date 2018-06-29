extends Node

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	get_node("HornetSpawn").start()
	randomize()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_HornetSpawn_timeout():
    # choose a random location on Path2D
    $HornetPath/HornetSpawn.set_offset(randi())
    # create a Mob instance and add it to the scene
    var hornet = preload("res://characters/Hornet/Hornet.tscn").instance()
	
	
    add_child(hornet)
    # set the mob's direction perpendicular to the path direction
    var direction = $HornetPath/HornetSpawn.rotation + PI/2
    # set the mob's position to a random location
    hornet.position = $HornetPath/HornetSpawn.position
    # add some randomness to the direction
    direction += rand_range(-PI/4, PI/4)
    hornet.rotation = direction
    # choose the velocity
    hornet.set_linear_velocity(Vector2(rand_range(hornet.MIN_SPEED, hornet.MAX_SPEED), 0).rotated(direction))


func _on_Bee_hit():
	pass # replace with function body


func _on_Worker1_killed():
	get_tree().quit()


func _on_Bee_recovery():
	pass # replace with function body