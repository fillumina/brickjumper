extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# Hide the button if the game is NOT exported for a mobile browser.
	if not OS.has_feature("web_android") and not OS.has_feature("web_ios"):
		self.hide()
