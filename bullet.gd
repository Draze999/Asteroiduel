extends RigidBody2D

const speed = 60000.0
var timer = 3
var ownerplayer:int
var Bullet = load("res://Assets/bullet.png") 
@onready var bulletnode = get_node("./Sprite2D")
var current_frame = false
var MaxframeTime = 0.05
var frameTime = MaxframeTime

func initi(dir:Vector2, delta, player):
	linear_velocity = speed * dir * delta
	ownerplayer = player
	if (player == 2):
		set_collision_layer_value(4, false)
		set_collision_layer_value(5, true)
		set_collision_mask_value(3, false)
		set_collision_mask_value(2, true)
	else:
		var newTexture = AtlasTexture.new()
		newTexture.set_atlas(Bullet)
		newTexture.region = Rect2(418,5,12,7)
		bulletnode.texture = (newTexture)

func _process(delta):
	frameTime -= delta
	if (frameTime <= 0):
		bulletnode.flip_v = (!current_frame)
		current_frame = !current_frame
		frameTime = MaxframeTime
	if (timer <= 0):
		queue_free()
	if (abs(linear_velocity.x) + abs(linear_velocity.y) < 25):
		timer -= delta
	if not(position.x < 3000 and position.x > -1500):
		queue_free()
	if not(position.y < 3000 and position.y > -1500):
		queue_free()

