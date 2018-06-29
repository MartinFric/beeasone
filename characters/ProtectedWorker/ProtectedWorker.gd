extends Area2D

# class member variables go here, for example:
signal killed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$AnimatedSprite.play()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_HoneyBringer_body_entered(body):
	#if ("Hornet" in body.get_name()):
	hide()
	emit_signal("killed")
