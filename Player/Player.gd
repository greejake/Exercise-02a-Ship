extends KinematicBody2D


var velocity = Vector2.ZERO

var rotation_speed = 5.0
var speed = 0.1
var max_speed = 10.00

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position = position + velocity
	velocity = velocity.normalized () * clamp(velocity.length(), 0, max_speed)
	
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		velocity = velocity + Vector2(0, -speed).rotated(rotation)
		$Exhaust.show()
	
	
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - 1
		
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + 1
		
	
	
	if position.x > 1024:
		position.x = 0
	if position.x < 0:
		position.x = 1024
	if position.y < 0:
		position.y = 600
	if position.y > 600:
		position.y = 0
		
		
	position.x = wrapf(position.x, 0, 1024)	
	position.y = wrapf(position.y, 0, 600)	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


