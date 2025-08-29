extends Node


# the := means that the score is boud to the type of the given value
var score := 0


func add_point():
	score += 1
	print(score)
