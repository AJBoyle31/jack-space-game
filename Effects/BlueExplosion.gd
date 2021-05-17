extends AnimatedSprite
class_name laser_explosion

func _ready():
	play("explosion")
	
func _on_BlueExplosion_animation_finished():
	queue_free()
