extends Area2D

# % instead of $ marks an unique node that is a node that is marked as 
# unique (right click on the node and selece "Access as Unique Name".
# Note that unique names are valid only within the same scene.
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# starts the coin animation to avoid having the editor autostart it
	# and persist its last position in the scene cluttering the versioning
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	# remove the coin
	animation_player.play("pickup")
	
