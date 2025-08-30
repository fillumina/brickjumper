extends Node


@onready var score_label: Label = $ScoreLabel
@onready var win_label: Label = $WinLabel

# the := means that the score is boud to the type of the given value
var score := 0
var win_score: int

func _ready():
	# initialize the win_score to the total amount of coins
	win_score = get_parent().get_node("Coins").get_child_count()
	

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
	
	if score == win_score:
		win_label.text = "YOU WON!"
