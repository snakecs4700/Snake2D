extends Node2D

func _ready():
	pass

func _fixed_process(delta):
	get_node("snake2").add_tail()
	get_node("snake").add_tail()


func spawn_tail_trail():
	get_node("snake2").add_tail() #Reference the add_tail method in the node snake.
	get_node("snake").add_tail()
