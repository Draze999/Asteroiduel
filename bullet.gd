extends RigidBody2D

const speed = 75000.0
var timer = 3

func initi(dir:Vector2, delta):
	linear_velocity = speed * dir * delta

func _process(delta):
	if (timer <= 0):
		queue_free()
	if (abs(linear_velocity.x) + abs(linear_velocity.y) < 25):
		timer -= delta
	if not(position.x < 3000 and position.x > -1000):
		print("test")
		queue_free()
	if not(position.y < 3000 and position.y > -1000):
		print("test")
		queue_free()
func _on_body_entered(body):
	print("Poulet") # Replace with function body.
