extends RigidBody2D

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
    screen_size = get_viewport_rect().size
    
func _process(delta):
    if (position.x<0 or position.x>screen_size.x or position.y<0 or position.y>screen_size.y):
        get_parent().bullet_count -=1
        queue_free()
        