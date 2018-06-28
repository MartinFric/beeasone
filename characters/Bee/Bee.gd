extends Area2D

# class member variables go here, for example:
export (int) var SPEED  # how fast the player will move (pixels/sec)
var screensize  # size of the game window
signal hit

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	screensize = get_viewport_rect().size

func _process(delta):
    var velocity = Vector2() # the player's movement vector
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
    if velocity.length() > 0:
        velocity = velocity.normalized() * SPEED
        $AnimatedSprite.play()
    else:
        $AnimatedSprite.stop()

    position += velocity * delta
    position.x = clamp(position.x, 0, screensize.x)
    position.y = clamp(position.y, 0, screensize.y)

    if velocity.x != 0:
        $AnimatedSprite.animation = "Right"
        $AnimatedSprite.flip_v = false
        $AnimatedSprite.flip_h = velocity.x < 0
    elif velocity.y != 0:
        $AnimatedSprite.animation = "Top"
        $AnimatedSprite.flip_v = velocity.y > 0

func _on_Bee_body_entered(body):
	if (body.get_name() == "Hornet"):
    	hide()
    	emit_signal("hit")
    #$CollisionShape2D.disabled = true
    #position = pos
    #show()
    #$CollisionShape2D.disabled = false