extends StaticBody2D

# class member variables go here, for example:
var started = false
var active = false
var stopped = false
var colliding = false
var activations_remaining = 3

signal collected

func _ready():
	add_to_group("flowers")

func start_timer():
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func toggle_active():
	active = not active		# TODO: change sprite

func _on_collision():
	colliding = true
	check_collision()	# TODO: timer!
	
func check_collision():
	if active:
		toggle_active()
		emit_signal("collected")


func _on_collision_end():
	colliding = false
