extends CharacterBody2D

const bullet = preload("res://bullet.tscn")
const SPEED = 50000.0
var sprite:Sprite2D
var posX = 0
var posY = 0
var Moving
var distance = 0
var rotations
@export var Health = 5
var canDash = true
@export var MaxDashTimer = 0.05
var DashTimer = MaxDashTimer
var DashDirection = Vector2.ZERO
@export var MaxDashResetTimer = 1
var DashResetTimer = MaxDashResetTimer

@export var canShoot = true
@export var MaxShootResetTimer = 0.25
var ShootResetTimer = MaxShootResetTimer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _dash(delta, direction):
	if Input.is_action_just_pressed("DashP2") and canDash:
		DashDirection = direction.normalized() * 4
		canDash = false
	elif not canDash:
		DashTimer -= delta
		DashResetTimer -= delta
	if DashTimer <= 0:
		DashTimer = MaxDashTimer
		DashDirection = Vector2.ZERO
	if DashResetTimer <= 0:
		DashResetTimer = MaxDashResetTimer
		canDash = true

func _ready():
	sprite = get_node("Sprite2D")
	posX = 1024 - (sprite.texture.get_width() + 1) / 2 - 1
	posY = 1024 - (sprite.texture.get_height() + 1) / 2 - 1

func spawn_bullet(delta):
	var curr_b = bullet.instantiate()
	get_parent().add_child(curr_b)
	curr_b.position = position
	curr_b.initi(Vector2.from_angle(rotation - PI / 2), delta, 2)
	curr_b.rotate(rotation - PI / 2)

func _shoot(_delta):
	if Input.is_action_pressed("ShootP2") and canShoot:
		spawn_bullet((_delta))
		canShoot = false
	elif not canShoot:
		ShootResetTimer -= _delta
	if ShootResetTimer <= 0:
		ShootResetTimer = MaxShootResetTimer
		canShoot = true

func _physics_process(delta):
	var directionX = Input.get_axis("MoveLeftP2", "MoveRightP2")
	var directionY = Input.get_axis("MoveUpP2", "MoveDownP2")
	
	distance = sqrt((directionX * directionX) + (directionY * directionY))
	if (distance > 0.05):
		rotations = atan2(directionY, directionX) - rotation + PI/2
		rotate(rotations)
	
	Moving = Vector2(directionX, directionY).normalized()
	velocity = (Moving + DashDirection) * SPEED * delta
	_shoot(delta)
	_dash(delta, Vector2(directionX, directionY))
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if (collider.name == "TileMap" || collider.collision_layer != 8):
			continue
		var bulletno = get_node(collider.get_path())
		bulletno.queue_free()
		Health -= 1
