extends PopupDialog

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal hidden

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_OkButton_pressed():
	self.hide()
	emit_signal("hidden")
