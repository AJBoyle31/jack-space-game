extends KinematicBody2D

const SPEED := 300
const ACCELERATION := 500
const FRICTION := 200
var player_single_laser = preload("res://Ships/Player/Laser.tscn")

var velocity := Vector2.ZERO
var input_velocity := Vector2.ZERO

enum Lasers {
	SINGLE_LASER, DOUBLE_LASER, TRIPLE_LASER
}

var laser = Lasers.SINGLE_LASER

onready var ship_engine := $Engine

func _ready():
	pass


func _physics_process(delta):
	input_velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_velocity = input_velocity.normalized()
	
	if input_velocity == Vector2.ZERO:
		ship_engine.hide()
		velocity = Vector2.ZERO
		velocity = move_and_slide(velocity)
	else: 
		ship_engine.show()
		velocity = input_velocity * SPEED
		velocity = move_and_slide(velocity)
		position.x = clamp(position.x, 0, 1024)
		position.y = clamp(position.y, 0, 600)
	
	if Input.is_action_just_pressed("fire"):
		fire_laser()


func fire_laser():
	var laser_shot = player_single_laser.instance()
	if laser == Lasers.SINGLE_LASER:
		laser_shot.set_global_position(Vector2(global_position.x, global_position.y - 35))
	var world = get_tree().current_scene
	world.add_child(laser_shot)



func _on_HurtBox_area_entered(area):
	queue_free()
