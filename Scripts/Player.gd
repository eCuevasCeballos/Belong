extends KinematicBody2D

const arrowpath = preload("res://Scenes/Moving_rock.tscn")
var velocity = Vector2(0,0)
const speed = 190
const gravity = 20
const jumpforce = -560

func _physics_process(_delta):

#Code to move

	if Input.is_action_pressed("Walk_R"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
		velocity.x = speed
	elif Input.is_action_pressed("Walk_L"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
		velocity.x = -speed
	else: 
		$AnimatedSprite.play("Idle")

#Code to jump

	velocity.y = velocity.y + gravity
	if Input.is_action_pressed("Jump") and is_on_floor():
		$AnimatedSprite.play("Walk")
		velocity.y = jumpforce
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)

#Code to shoot

	if Input.is_action_just_released("Shoot"):
		shoot()
	$AnimatedSprite/Position2D.position.x = position.x
	$AnimatedSprite/Position2D.position.y = position.y

#Function to get hurt

func hurt(var enemyposx):
	Livecounter.lives -= 1
	velocity.y = jumpforce * 0.7
	if position.x < enemyposx:
		velocity.x = -800
	if position.x > enemyposx:
		velocity.x = 800
	$Death_Sound.play()
	if Livecounter.lives == 0:
		Rockscounter.rocks = 0
		$CollisionShape2D.queue_free()
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")

#Function to count how many shoots the player has

func shoot():
	if $AnimatedSprite.flip_h == false:
		if Rockscounter.rocks > 0:
			var direction = 1
			var a = arrowpath.instance()
			a.direction = direction
			get_parent().add_child(a)
			a.position.y = $AnimatedSprite/Position2D.position.y
			a.position.x = $AnimatedSprite/Position2D.position.x
			Rockscounter.rocks -= 1
	elif $AnimatedSprite.flip_h == true:
		if Rockscounter.rocks > 0:
			var direction = -1
			var a = arrowpath.instance()
			a.direction = direction
			get_parent().add_child(a)
			a.position.y = $AnimatedSprite/Position2D.position.y
			a.position.x = $AnimatedSprite/Position2D.position.x
			Rockscounter.rocks -= 1

