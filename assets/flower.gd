extends Area2D

# class member variables go here, for example:
var started = false
var active = false
var stopped = false
var colliding = false

signal collected

func _ready():
	add_to_group("flowers")

func reset_timer():
	var duration = (randi() % 200) / 100.0 + 1
	print(duration)
	var timer = get_node("Timer")
	timer.stop()
	timer.wait_time = duration
	timer.start()
	
func start_timer():
	print("started")
	started = true
	reset_timer()

func toggle_active():
	active = not active		# TODO: change sprite
	if active:
		print("activating")
		get_node("Sprite").texture = load("res://assets/flowers/flower-white-active.png")
		reset_timer()
	else:
		print("deactivating")
		get_node("Sprite").texture = load("res://assets/flowers/flower-white-inactive.png")

func _on_collision(obj):
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
		check_collision()
	else:
		print("switch")
		toggle_active()		# TODO: refactor


func _on_area_entered(area):
	print("Enter " + area)


func _on_area_exited(area):
	print("Exit " + area)
