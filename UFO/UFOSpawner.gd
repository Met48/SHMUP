extends Node2D


export var count = 5
export var interval = 0.2
export(PackedScene) var UFO = load("res://UFO/UFO.tscn")


onready var SpawnInterval = $SpawnInterval
onready var Path = $Path2D

var spawned_count = 0


func _ready():
	SpawnInterval.wait_time = interval
	call_deferred("spawn")


func spawn():
	if spawned_count >= count:
		queue_free()
		return

	var ufo = UFO.instance()
	get_parent().add_child(ufo)
	ufo.set_path(Path)
	spawned_count += 1
	SpawnInterval.start()
