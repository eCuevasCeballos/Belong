extends KinematicBody2D

var velocity = Vector2() 
export var direction = -1

#Set enemy direction

func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h = true
	if direction == 1:
		$AnimatedSprite.flip_h = false

func _physics_process(delta):
	if is_on_wall() and is_on_floor():
		direction = direction * -1
		if direction == 1:
			$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	if is_on_wall() or not $Floor_checker.is_colliding() and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = false
	if is_on_wall() or not $Floor_checker2.is_colliding() and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = true
	if direction == 1:
		$AnimatedSprite.flip_h = false
	velocity.y += 20
	velocity.x = 50 * direction
	velocity = move_and_slide(velocity, Vector2.UP)

#Makes enemy die

func enemy_death():
	direction = direction * 0
	$Sides_Checker.queue_free()
	$AudioStreamPlayer.play()
	$AnimatedSprite.play("Death")
	yield(get_tree().create_timer(1),"timeout")
	queue_free()



func hurt(var enemyposx):
	pass

#Hurts the player

func _on_Sides_Checker_body_entered(body):
	if get_collision_mask_bit(0):
		body.hurt(position.x)

