extends Area2D

const SPEED := Vector2(0, -500)

var blue_explosion = preload("res://Effects/BlueExplosion.tscn")


var velocity := Vector2.ZERO


func _physics_process(delta):
	position += SPEED * delta
	if position.y < 0 or position.y > 600:
		queue_free()


func _on_Hitbox_area_entered(area):
	queue_free()
	var explosion = blue_explosion.instance()
	explosion.set_global_position(Vector2(global_position.x - 18.5, global_position.y -18.5))
	var world = get_tree().current_scene
	world.add_child(explosion)
