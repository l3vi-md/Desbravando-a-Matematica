extends CharacterBody2D
class_name Player
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
enum PlayerMode{
	SMALL,
	BIG,
	SHOOTING
}
@onready var animated_sprite_2d = $AnimatedSprite2D as PlayerAnimatedSprite 
@onready var area_collision_shape_2d = $Area2D/AreaCollisionShape2D
@onready var body_collision_shape_2d = $BodyCollisionShape2D
@onready var area_2d = $Area2D
@export_group("Locomotion")
@export var run_speed_damping = 0.5
@export var speed = 130
@export var jump_velocity = -500
@export_group("")
var player_mode = PlayerMode.SMALL
func _physics_process (delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_just_released("jump") and velocity.y < 8:
		velocity.y *= 0.5
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = lerp(velocity.x,speed*direction,run_speed_damping * 1.0)
		animated_sprite_2d.flip_h = direction < 0
	else:
		velocity.x= move_toward(velocity.x, 0, speed * 1.0)
	
	animated_sprite_2d.trigger_animation(velocity, direction, player_mode)
	
	move_and_slide()
