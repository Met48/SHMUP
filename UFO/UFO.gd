extends KinematicBody2D


export var speed = 600


var path_curve = null
var path_offset = null
var path_pos = 0.0


func set_path(new_path):
	path_offset = new_path.global_position
	path_curve = new_path.curve.duplicate()
	path_pos = 0.0



func _physics_process(delta):
	if not path_curve:
		return
	path_pos += delta * speed
	var curve_length = path_curve.get_baked_length()
	if path_pos > curve_length:
		# TODO
		queue_free()
	else:
		global_position = path_offset + path_curve.interpolate_baked(path_pos)

