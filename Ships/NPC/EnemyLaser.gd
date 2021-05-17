extends Area2D

const SPEED := Vector2(0, 400)

var green_explosion = preload("res://Effects/GreenExplosion.tscn")

var velocity := Vector2.ZERO

func _physics_process(delta):
	position += SPEED * delta
	if position.y < 0 or position.y > 600:
		queue_free()


func _on_Hitbox_area_entered(area):
	queue_free()
	var explosion = green_explosion.instance()
	explosion.set_global_position(Vector2(global_position.x, global_position.y))
	var world = get_tree().current_scene
	world.add_child(explosion)
