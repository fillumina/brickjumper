extends Node2D

# speed in FPS
const SPEED := 60

# direction is -1 when it goes backwards and 1 if it goes forward
var direction := 1


@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# start the animation here instead of setting autostart so the editor
	# won't persist its last frame
	animated_sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# To move the slime it could have been used the animation but this way is
# more generic because the slime can be put everywhere in the scene 
# between two hard blocks and it would go right and left all by itself!
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
