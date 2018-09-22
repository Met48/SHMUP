extends KinematicBody2D

export var speed = 512

func _physics_process(delta):
	move_and_collide(Vector2(0, -speed * delta))


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
