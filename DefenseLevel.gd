extends Node

onready var guard_class = load("res://characters/Guard/Guard.tscn")
signal timerStart
var time = 0
var timeStarted = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

	#$"Gethering/flower-pink".play()
	#$"Gethering/flower-blue".play()
	#$"Gethering/flower-white".play()
	
	randomize()
	$"HUD/Try again".hide()
	$"HUD/Menu".hide()
	$HUD/Failed.hide()
	
	$"Start dialogue".popup()

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	if timeStarted:
		time += delta
		emit_signal("timerStart", time)

	if time > 20:
		$HornetSpawn.wait_time = 0.4
	
	if time > 40:
		$HornetSpawn.wait_time = 0.3
	
func _on_HornetSpawn_timeout():
    # choose a random location on Path2D
    $HornetPath/HornetSpawn.set_offset(randi())
    # create a Hornet instance and add it to the scene
    var hornet = preload("res://characters/Hornet/Hornet.tscn").instance()
	
    add_child(hornet)
    # set the hornet's direction perpendicular to the path direction
    var direction = $HornetPath/HornetSpawn.rotation + PI/2
    # set the hornet's position to a random location
    hornet.position = $HornetPath/HornetSpawn.position
    # add some randomness to the direction
    direction += rand_range(-PI/4, PI/4)
    hornet.rotation = direction
    # choose the velocity
    hornet.set_linear_velocity(Vector2(rand_range(hornet.MIN_SPEED, hornet.MAX_SPEED), 0).rotated(direction))

func _on_HoneyBringer_killed():
	game_over()

func _on_HoneyBringer2_killed():
	game_over()

func _on_HoneyBringer3_killed():
	game_over()
	
func game_over():
	$"HUD/Try again".show()
	$"HUD/Menu".show()
	$HUD/Failed.show()

func _on_Start_dialogue_confirmed():
	timeStarted = true
	get_node("HornetSpawn").start()

func _on_Container_callGuards():
	var guard = guard_class.instance()
	var pos = Vector2(350, 300)
	guard.position = pos
	add_child(guard)
