extends NPC

var SPEED := 200

var enemy_laser = preload("res://Ships/NPC/EnemyLaser.tscn")

export var move_enemy: bool = true

var velocity := Vector2.ZERO
var direction := 1
var score = Score

func _ready():
	if not move_enemy:
		SPEED = 0


func _physics_process(delta):
	velocity = SPEED * direction * Vector2.RIGHT
	velocity = move_and_slide(velocity)

func fire_laser():
	var laser_shot = enemy_laser.instance()
	laser_shot.set_global_position(Vector2(global_position.x, global_position.y + 35))
	var world = get_tree().current_scene
	world.add_child(laser_shot)


func _on_LaserTimer_timeout() -> void:
	fire_laser()


func _on_MovementTimer_timeout() -> void:
	direction *= -1


func _on_HurtBox_area_entered(area) -> void:
	score.myScore += 10
	queue_free()
