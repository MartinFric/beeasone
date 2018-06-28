extends RigidBody2D

# class member variables go here, for example:
var started = false
var active = false
var stopped = false
var colliding = false

signal collected

func _ready():
	add_to_group("flowers")

func reset_timer():
	var duration = (randi() % 400) / 100.0 + 1
	print(duration)
	var timer = get_node("Timer")
	timer.stop()
	timer.wait_time = duration
	timer.start()
	
func start_timer():
	started = true
	reset_timer()
	toggle_active()

func toggle_active():
	active = not active		# TODO: change sprite
	if active:
		print("activating")
		self.show()
		reset_timer()
	else:
		print("deactivating")
		self.hide()

func _on_collision(obj):
	if not started:
		pass
	colliding = true
	print("on_collision")
	check_collision()	# TODO: timer!
	
func check_collision():
	if active:
		toggle_active()
		stopped = true
		emit_signal("collected")

func _on_collision_end(obj):
	print("on_collision_end")
	colliding = false

func _on_timeout():
	if stopped or not started:
		pass
	elif colliding:
		print("time collision")
		check_collision()
	else:
		print("switch")
		toggle_active()		# TODO: refactor
