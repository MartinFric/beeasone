extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal pressed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _input_event(viewport, event, shape_idx):
	print(event)
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == BUTTON_LEFT):
			if(event.pressed):
				print("pressed")
			else:
				emit_signal("pressed")
