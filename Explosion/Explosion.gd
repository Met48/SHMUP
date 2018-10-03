extends AnimatedSprite

func _ready():
	playing = true

func _on_finish_playing():
	queue_free()
