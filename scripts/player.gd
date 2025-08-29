extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready():
	# don't set autostart animation in the editor because the actual frame
	# is then persisted into the scene when saving cluttering the versioning
	# system.
	animated_sprite.play("idle")


# defferently from _process() this function is called 60 times each second
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()

	if Input.is_action_pressed("quit"):
		get_tree().quit()

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if not audio_stream_player.playing:
			audio_stream_player.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		if direction != 0:
			# Flip the Sprite only if it is moving
			animated_sprite.flip_h = direction < 0
			animated_sprite.play("run")
		else:
			# the sprite is not moving
			animated_sprite.play("idle")
	else:
		# the sprite is on the air
		animated_sprite.play("jump")
	
	# Apply movements
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
