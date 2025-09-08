extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var x_direction
var y_direction 

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	x_direction = Input.get_axis("ui_left", "ui_right")
	y_direction = Input.get_axis("ui_up", "ui_down")
	
	if x_direction:
		if (x_direction > 0): animated_sprite.play("Turnright")
		if (x_direction < 0): animated_sprite.play("Turnleft")
		velocity.x = x_direction * SPEED	
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	if y_direction:
		if (y_direction < 0): animated_sprite.play("Walkup")
		if (y_direction > 0): animated_sprite.play("walkdown")
		velocity.y = y_direction * SPEED
		
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		

	move_and_slide()
