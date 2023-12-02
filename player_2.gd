extends CharacterBody2D


const SPEED = 750.0
var sprite:Sprite2D
var posX = 0
var posY = 0
var Moving

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	sprite = get_node("Sprite2D")
	posX = 1024 - (sprite.texture.get_width() + 1) / 2 - 1
	posY = 1024 - (sprite.texture.get_height() + 1) / 2 - 1

func _physics_process(_delta):
	var directionX = Input.get_axis("MoveLeftP2", "MoveRightP2")
	var directionY = Input.get_axis("MoveUpP2", "MoveDownP2")
	Moving = Vector2(directionX, directionY).normalized()
	velocity = Moving * SPEED
	move_and_slide()
