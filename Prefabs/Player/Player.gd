extends KinematicBody2D

var move_speed = 100
var sprint_speed = 2
var speed_multiplier = 1
var motion

func _input(event):
	if event.is_action_pressed("ui_click"):
	    var tilemap = get_node("/root/TestWorld/Paths")
	    var pos = tilemap.world_to_map(get_global_mouse_position())
	    print(pos)
	    tilemap.set_cellv(pos, 12)
	pass

func _physics_process(delta):
	
	motion = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		motion.x += -1
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_up"):
		motion.y += -1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	
	if Input.is_action_pressed("ui_sprint"):
		speed_multiplier = sprint_speed
	else:
		speed_multiplier = 1
	
	move_and_slide(motion.normalized() * (move_speed * speed_multiplier))