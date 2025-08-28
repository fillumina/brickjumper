extends Area2D

# create this line by dragging Timer from the scene panel pressing CTRL
# this is a reference to the node useful because the $xx notation is a 
# a shortcut for a search function that runs at any call and thus is
# not very efficient.
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("you died")
	# modify the game timescale so the game will slow down
	Engine.time_scale = 0.5
	# the body is the node the killzone collided with so in this case is the player
	# so we search for the player's node collision shape and remove it making
	# the player falling down with dramatic effect (and slowly because of the
	# time scale).
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


# runs when the timer ends
func _on_timer_timeout() -> void:
	# restart the game
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
