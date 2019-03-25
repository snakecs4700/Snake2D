extends Node2D

onready var tail1 = preload("res://Scenes/tail.tscn")
onready var tail2 = preload("res://Scenes/tail2.tscn")

func _ready():
	pass

func spawn_tail_trail():
	get_node("snake2").add_tail() #Reference the add_tail method in the node snake.
	get_node("snake2b").add_tail()

func _on_Timer_timeout():
	get_node("snake2").add_tail()
	get_node("snake2b").add_tail()
	pass # Replace with function body.
