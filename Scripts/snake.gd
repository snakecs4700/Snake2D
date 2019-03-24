extends Node2D

# Declare variables for snake control
var direction = Vector2(1,0)
var speed = 5 # NEVER CHANGE THIS...ONLY ONE AND FIVE WORK
const gap = -65 # NEVER MAKE THIS POSITIVE.
var next_tail_dir = Vector2(1,0)
var prev_dir = Vector2(1,0)
# Load the tails on ready
onready var tail = preload("res://Scenes/tail.tscn")

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Directional input handling
	if(Input.is_action_pressed("ui_up")):
		direction = Vector2(0,-1)
	elif(Input.is_action_pressed("ui_down")):
		direction = Vector2(0,1) 
	elif(Input.is_action_pressed("ui_left")):
		direction = Vector2(-1,0)
	elif(Input.is_action_pressed("ui_right")):
		direction = Vector2(1,0)
	move_snake()

# Handles the repositioning of the sprite during movement
func move_snake():
	var dir_change = false
	if(prev_dir != direction):
		prev_dir = direction
		dir_change = true
	var head_pos = get_node("head").position
	get_node("head").position += direction * speed
	#print(direction)
	
	if(dir_change): #Change direction for all the tails.
		for i in range(1,get_child_count()):
			get_child(i).add_to_tail(head_pos, direction)

# Appends a tail at the rearmost part of the snake
func add_tail():
	var inst = tail.instance()
	var prev_tail = get_child(get_child_count() -1 )
	if(prev_tail.name != "head"): #The previous tail is not head
		inst.cur_dir = prev_tail.cur_dir  #we need to connect new tail to prev tail instead.
		for i in range(0,prev_tail.pos_array.size()):
			inst.pos_array.append(prev_tail.pos_array[i])
			inst.directions.append(prev_tail.directions[i])
		inst.position = prev_tail.position + prev_tail.cur_dir * gap
	else:
		inst.cur_dir = direction
		inst.position = prev_tail.position + direction * gap 
	add_child(inst)
		