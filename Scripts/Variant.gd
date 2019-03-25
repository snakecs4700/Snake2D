extends Node2D

onready var tail1 = preload("res://Scenes/tail.tscn")
onready var tail2 = preload("res://Scenes/tail2.tscn")
onready var score_label = get_node("Score/Label")
onready var score_label2 = get_node("Score2/Label")

var p1Score = 0
var p2Score = 0

func _ready():
	pass

func spawn_tail_trail():
	get_node("snake2").add_tail() #Reference the add_tail method in the node snake.
	get_node("snake2b").add_tail()

func _on_Timer_timeout():
	get_node("snake2").add_tail()
	get_node("snake2b").add_tail()
	var d1 = tail1.instance()
	var d2 = tail2.instance()
	d1.connect("_on_tail_area_entered", self,"_on_score")
	d2.connect("_on_tail_area_entered", self, "_on_score2")
	pass # Replace with function body.

func _on_score():
	p1Score += 1
	score_label.set_text("Score: " + str(p1Score))
	
func _on_score2():
	p2Score += 1
	score_label2.set_text("Score: " + str(p2Score))