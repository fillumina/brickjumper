extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# starts the coin animation to avoid having the editor autostart it
	# and persist its last position in the scene cluttering the versioning
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("+1 coin!")
	# remove the coin
	queue_free()
