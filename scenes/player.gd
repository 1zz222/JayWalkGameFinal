extends CharacterBody2D

var direction : Vector2 = Vector2(0,0)
var speed :int = 120


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("Left","Right","Up","Down")	
	#position += speed * direction
	velocity = speed * direction
	anim()
	move_and_slide()
	if Input.is_action_just_pressed("Space") : 
		print("WOah")


# Walking Animation module
func anim():
	if direction :
		$AnimatedSprite2D.flip_h = direction.x > 0
		if direction.x != 0 :
			$AnimatedSprite2D.animation = "left"
		else :
			$AnimatedSprite2D.animation = "top" if direction.y < 0 else "down"
	else :
		$AnimatedSprite2D.animation = "idle"
