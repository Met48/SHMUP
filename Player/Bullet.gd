extends KinematicBody2D

export var speed = 512

func _physics_process(delta):
	move_and_collide(Vector2(0, -speed * delta))
