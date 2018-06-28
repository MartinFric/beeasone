extends StaticBody2D

# class member variables go here, for example:
var started = false
var active = false
var stopped = false

func _ready():
	add_to_group("flowers")

func start_timer():
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
