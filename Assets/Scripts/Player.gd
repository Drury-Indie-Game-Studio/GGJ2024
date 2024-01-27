extends CharacterBody2D

const SPEED = 300.0
var intendedRotation = 0.0

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction = Input.get_axis("ui_left", "ui_right")
	var y_direction = Input.get_axis("ui_up", "ui_down")
	
	if x_direction:
		velocity.x = x_direction * SPEED
		if x_direction > 0:
			intendedRotation = 90
			if y_direction:
				if y_direction > 0:
					intendedRotation = 135
				else:
					intendedRotation = 45
		else:
			intendedRotation = -90
			if y_direction:
				if y_direction > 0:
					intendedRotation = -135
				else:
					intendedRotation = -45
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if y_direction:
		velocity.y = y_direction * SPEED
		if !x_direction:
			if y_direction > 0:
				intendedRotation = 180
			else:
				intendedRotation = 0
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if x_direction and y_direction:
		velocity.x *= 1.0/sqrt(2)
		velocity.y *= 1.0/sqrt(2)
	if abs(intendedRotation-$Sprite.rotation_degrees) > 0.05:
		if intendedRotation-$Sprite.rotation_degrees > 180:
			$Sprite.rotation_degrees += 360.0
		elif intendedRotation-$Sprite.rotation_degrees < -180:
			$Sprite.rotation_degrees -= 360.0
		$Sprite.rotation_degrees += (intendedRotation-$Sprite.rotation_degrees)/10.0
	move_and_slide()
	
