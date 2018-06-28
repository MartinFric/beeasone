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
	started = true
	toggle_active()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func toggle_active():
	active = not active		# TODO: change sprite
	if active:
		print("timer started")
		self.hide()
		get_node("Timer").start()
	else:
		self.show()

func _on_collision():
	print("collision")
	colliding = true
	check_collision()	# TODO: timer!
	
func check_collision():
	if active:
		toggle_active()
		emit_signal("collected")


func _on_collision_end():
	colliding = false


func _on_timeout():
	if colliding:
		print("collision")
		check_collision()
	else:
		toggle_active()		# TODO: refactor
