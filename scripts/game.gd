extends Node2D


func _ready():
	# Connect to the window's size_changed signal
	get_window().size_changed.connect(_on_window_size_changed)
	_on_window_size_changed() # Call it once to set the initial state

func _on_window_size_changed():
	var window_size = get_window().size
	var base_resolution = ProjectSettings.get_setting("display/window/size/viewport_width") / float(ProjectSettings.get_setting("display/window/size/viewport_height"))
	
	# Check the current aspect ratio
	if window_size.x / window_size.y > base_resolution:
		# Landscape mode: Keep the height, expand the width
		get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND
	else:
		# Portrait mode: Keep the width, letterbox the height
		get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP_HEIGHT
