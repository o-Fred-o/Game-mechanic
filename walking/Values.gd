extends Container

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _on_MaxSpeed_HSlider_value_changed(value):
    get_node("MaxSpeed_Value").text= String(value)+" %"
    
func _on_JumpSpeed_HSlider_value_changed(value):
    get_node("JumpSpeed_Value").text= String(value)+" %"
