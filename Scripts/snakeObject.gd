extends Node2D

var direction = Vector2(0,0)

func _process(delta):
	if(Input.is_action_pressed("ui_up")):
		direction = Vector2(0,-1)
		pass
	elif(Input.is_action_pressed("ui_down")):
		direction = Vector2(0,1)
		pass
	elif(Input.is_action_pressed("ui_left")):
		direction = Vector2(-1,0)
		pass
	elif(Input.is_action_pressed("ui_right")):
		direction = Vector2(1,0)
		pass
	move()
	pass

func move():
	get_node("head").position += direction
