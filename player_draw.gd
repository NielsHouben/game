extends Node2D

const EYE_RADIUS = 8
const PUPIL_RADIUS = 4
const EYE_OFFSET = Vector2(7, -5)  # Eyes offset from circle center
const PUPIL_MOVE_RADIUS = 3  # How far the pupil moves inside the eye
const RADIUS = 15  # Radius of the face circle
@export var size: float = 1

func _draw():
	# Draw the big red circle (the face)
	draw_circle(Vector2.ZERO, RADIUS * size, Color(1, 0, 0))
	
	# Convert mouse position to local coordinates relative to this node
	var mouse_local_pos = to_local(get_global_mouse_position())
	var to_mouse = (mouse_local_pos).normalized()
	
	# Left eye center relative to circle center
	var left_eye_center = EYE_OFFSET * size
	# Right eye center is mirrored horizontally
	var right_eye_center = Vector2(-EYE_OFFSET.x * size, EYE_OFFSET.y * size)
	
	# Draw eyes (white)
	draw_circle(left_eye_center, EYE_RADIUS, Color(1, 1, 1))
	draw_circle(right_eye_center, EYE_RADIUS, Color(1, 1, 1))
	
	# Calculate pupil positions inside eyes
	var left_pupil_pos = left_eye_center + to_mouse * PUPIL_MOVE_RADIUS
	var right_pupil_pos = right_eye_center + to_mouse * PUPIL_MOVE_RADIUS
	
	# Draw pupils (black)
	draw_circle(left_pupil_pos, PUPIL_RADIUS, Color(0, 0, 0))
	draw_circle(right_pupil_pos, PUPIL_RADIUS, Color(0, 0, 0))

func _process(delta):
	queue_redraw()  # This requests redraw for Godot 4
