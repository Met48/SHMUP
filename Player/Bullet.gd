extends KinematicBody2D

export var speed = 512

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0, -speed * delta))
	if collision:
		if collision.collider and collision.collider.has_method("receive_damage"):
			collision.collider.receive_damage(self)
		free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
