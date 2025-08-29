extends Node

@onready var score_label: Label = $ScoreLabel

# the := means that the score is boud to the type of the given value
var score := 0


func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
