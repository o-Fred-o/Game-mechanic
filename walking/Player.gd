extends KinematicBody2D

#Add acceleration to the movement
export var acceleration = true
#Add drag after key release
export var drag = true
#Allow the player to use jump button
export var jump = true
#Allow double jump
export var double_jump = true

var max_speed = 500
var accel_speed = 50
var jump_speed = -500
var gravity = 2500
var jumps = 0 

var velocity = Vector2()

func get_input():
    
    var right_key = Input.is_action_pressed('ui_right')
    var left_key = Input.is_action_pressed('ui_left')
    var jump_key = Input.is_action_just_pressed('ui_select')
    
    if !acceleration:
        velocity.x = 0
        accel_speed=max_speed

    if is_on_floor():
        if double_jump:
            jumps = 2 
        else:
            jumps=1
    
    if jumps>0 and jump_key and jump:
        velocity.y = jump_speed        
        jumps -=1
        
    if right_key:
        velocity.x += accel_speed
        if velocity.x>max_speed: velocity.x =max_speed    
    elif left_key:
        velocity.x -= accel_speed
        if velocity.x<-max_speed: velocity.x =-max_speed
    else:
         if !drag: velocity.x=0
         else:             
             if velocity.x>0: velocity.x -= accel_speed
             if velocity.x<0: velocity.x += accel_speed

func _physics_process(delta):
    velocity.y += gravity * delta
    get_input()
    velocity = move_and_slide(velocity, Vector2(0, -1))