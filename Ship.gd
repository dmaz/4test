extends CharacterBody2D

@export var velocity := Vector2(0,10)
@export var smooth:bool = false

var oldPosition := Vector2.ZERO


func _ready() -> void:
	oldPosition = global_position
	if !smooth:
		$Sprite.modulate = Color.AQUA


func _process(delta: float) -> void:
	if smooth:
		var fraction = Engine.get_physics_interpolation_fraction()
		$Sprite.global_position = oldPosition.lerp(global_position, fraction)

func _physics_process(delta: float) -> void:
	if smooth:
		oldPosition = global_position
		motion_velocity = velocity
		move_and_slide()
		if position.y > 656:
			position.y = 0-16
			oldPosition = global_position

	else:
		motion_velocity = velocity*delta*60
		move_and_slide()
		if position.y > 656: position.y = 0-16
