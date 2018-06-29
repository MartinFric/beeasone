extends Node

onready var guard_class = load("res://characters/Guard/Guard.tscn")
signal timerStart
var time = 0
var timeStarted = false
var win = false

var guard
var guard2
var guard3
var guard4

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

	#$"Gethering/flower-pink".play()
	#$"Gethering/flower-blue".play()
	#$"Gethering/flower-white".play()
	
	randomize()
	$"HUD/Try again".hide()
	$"HUD/Menu".hide()
	$"HUD/Failed".hide()
	
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
		
	if time > 60:
		$Win.show()
		global.bees_count += 1000
		if global.bees_count > 2000:
			global.finished = true
		get_node("HornetSpawn").stop()
		win = true
	
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
	if !win:
		$"HUD/Try again".show()
		$"HUD/Menu".show()
		$HUD/Failed.show()

func _on_Start_dialogue_confirmed():
	timeStarted = true
	get_node("HornetSpawn").start()

func _on_Container_callGuards():
	print("jijij")
	guard = guard_class.instance()
	guard2 = guard_class.instance()
	guard3 = guard_class.instance()
	guard4 = guard_class.instance()
	
	guard.position = Vector2(350, 300)
	guard2.position = Vector2(750, 300)
	guard3.position = Vector2(1150, 300)
	guard4.position = Vector2(1550, 300)
	
	add_child(guard)
	add_child(guard2)
	add_child(guard3)
	add_child(guard4)

func _on_Container_releaseGuards():
	if guard != null:
		guard.queue_free()
	if guard2 != null:
		guard2.queue_free()
	if guard3 != null:
		guard3.queue_free()
	if guard4 != null:
		guard4.queue_free()

func _on_Win_pressed():
	get_tree().change_scene("res://screens/Map.tscn")
