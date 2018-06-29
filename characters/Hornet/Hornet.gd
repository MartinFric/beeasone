extends RigidBody2D

# class member variables go here, for example:
export (int) var MIN_SPEED # minimum speed range
export (int) var MAX_SPEED # maximum speed range

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$AnimatedSprite.play()

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Hornet_body_entered(body):
	print(body)
