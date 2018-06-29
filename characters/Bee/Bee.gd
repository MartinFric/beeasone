extends KinematicBody2D

# class member variables go here, for example:
var speed = 400
var screensize  # size of the game window
var isExhausted = false
var isRecoverying = false
var recoveryState = 3
signal hit
signal recovery

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	emit_signal("recovery", recoveryState)
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
    if (Input.is_action_pressed("ui_accept") && !isExhausted):
        speed = 1000
        isExhausted = true
        $SpeedDuration.start()
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
    $AnimatedSprite.play()
	
    if isRecoverying:
        recoveryState += delta
        emit_signal("recovery", recoveryState)
	
    position += velocity * delta
    position.x = clamp(position.x, 0, screensize.x)
    position.y = clamp(position.y, 0, screensize.y)

    if velocity.x != 0:
        $AnimatedSprite.animation = "Right"
        $AnimatedSprite.flip_v = false
        $AnimatedSprite.flip_h = velocity.x > 0
    elif velocity.y != 0:
        $AnimatedSprite.animation = "Top"
        $AnimatedSprite.flip_v = velocity.y > 0

func _on_Bee_body_entered(body):
	if (body.get_name() == "Hornet"):
    	hide()
    	emit_signal("hit")
	elif (body.get_name() == "Flower"):
		print("HIT a FLOWER!")
    #$CollisionShape2D.disabled = true
    #position = pos
    #show()
    #$CollisionShape2D.disabled = false

func _on_SpeedDuration_timeout():
	speed = 400
	recoveryState = 0
	isRecoverying = true
	$Recovery.start()

func _on_Recovery_timeout():
	isExhausted = false
	isRecoverying = false
