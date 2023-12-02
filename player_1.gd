extends CharacterBody2D

const bullet = preload("res://bullet.tscn")
const SPEED = 50000.0
var sprite:Sprite2D
var posX = 0
var posY = 0
var Moving
var distance = 0
var rotations

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	sprite = get_node("Sprite2D")
	posX = 1024 - (sprite.texture.get_width() + 1) / 2 - 1
	posY = 1024 - (sprite.texture.get_height() + 1) / 2 - 1

func spawn_bullet(delta):
	var curr_b = bullet.instantiate()
	get_parent().add_child(curr_b)
	curr_b.position = position
	curr_b.initi(Vector2.from_angle(rotation - PI / 2), delta)
	curr_b.rotate(rotation - PI / 2)

func _shoot(_delta):
	if Input.is_action_just_pressed("ShootP1"):
		spawn_bullet(_delta)

func _physics_process(_delta):
	var directionX = Input.get_axis("MoveLeftP1", "MoveRightP1")
	var directionY = Input.get_axis("MoveUpP1", "MoveDownP1")
	
	distance = sqrt((directionX * directionX) + (directionY * directionY))
	if (distance > 0.2):
		rotations = atan2(directionY, directionX) - rotation + PI/2
		rotate(rotations)
	
	Moving = Vector2(directionX, directionY).normalized()
	velocity = Moving * SPEED * _delta
	_shoot((_delta))
	move_and_slide()

