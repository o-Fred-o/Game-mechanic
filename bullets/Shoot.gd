extends Node2D

export var shoot_delay = 200
export var bullet_speed = 500
export var number_of_bullet = 1

var bullet_count = 0

var Bullet = preload("res://bullets/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _input(event):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and event.pressed and bullet_count<number_of_bullet:
            var b = Bullet.instance()
            add_child(b)
            bullet_count +=1
            b.position= get_node("Sprite").position
            b.gravity_scale = 0
            b.linear_velocity.x += bullet_speed