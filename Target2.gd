extends Sprite2D

@export var direction = Vector2()
@export var rotations = 0
@export var distance = 0
@onready var P1 = get_node("../../Player1")
@onready var P2 = get_node("../../Player2")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	direction.x = P1.position.x - P2.position.x
	direction.y = P1.position.y - P2.position.y
	direction = direction.rotated(-P2.rotation)
	distance = sqrt((direction.x * direction.x) + (direction.y * direction.y))
	direction = direction.normalized()
	distance = clamp((distance - 650) / 200, 0, 1)
	set_scale(Vector2(distance, distance))
	modulate.a = distance
	rotations = atan2(direction.y, direction.x) - rotation
	rotate(rotations)
	position.x = 200 * direction.x
	position.y = 200 * direction.y
	
