extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# start the animation here instead of setting autostart so the editor
	# won't persist its last frame
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
