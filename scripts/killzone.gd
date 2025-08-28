extends Area2D

# create this line by dragging Timer from the scene panel pressing CTRL
# this is a reference to the node useful because the $xx notation is a 
# a shortcut for a search function that runs at any call and thus is
# not very efficient.
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("you died")
	timer.start()


# runs when the timer ends
func _on_timer_timeout() -> void:
	# restart the game
	get_tree().reload_current_scene()
