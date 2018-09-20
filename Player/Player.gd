extends KinematicBody2D

const SPEED = 256

onready var Bullet = load("res://Player/Bullet.tscn")
var cannons = []
var cannon_index = 0
var can_fire = true


func _ready():
	cannons.append($LeftCannon)
	cannons.append($RightCannon)


func _process(delta):
	if Input.is_action_pressed("fire"):
		fire_shot()

func _physics_process(delta):
	var movement = Vector2(0, 0)
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
	if Input.is_action_pressed("ui_up"):
		movement.y -= 1
	movement = movement.normalized()
	move_and_slide(movement * SPEED)


func fire_shot():
	if not can_fire:
		return

	can_fire = false
	$CanFireTimer.start()

	var cannon = cannons[cannon_index]

	cannon_index += 1
	if cannon_index >= len(cannons):
		cannon_index = 0

	var bullet = Bullet.instance()
	bullet.global_position = cannon.global_position
	var parent = get_parent()
	parent.add_child(bullet)
	parent.move_child(bullet, get_index())


func _on_CanFireTimer_timeout():
	can_fire = true
	if Input.is_action_pressed("fire"):
		fire_shot()
