extends Node2D

@export var speed: float = 200.0
var position_target := Vector2.ZERO

func _ready():
	var viewport_rect = get_viewport().get_visible_rect()
	var mouse_pos = get_global_mouse_position()

	if viewport_rect.has_point(mouse_pos):
		get_parent().position = mouse_pos
	else:
		get_parent().position = viewport_rect.size / 2  # fallback to center


func _process(delta):
	var viewport_rect = get_viewport().get_visible_rect()
	var mouse_pos = get_global_mouse_position()

	if viewport_rect.has_point(mouse_pos):
		position_target = mouse_pos

		var direction = (position_target - get_parent().position).normalized()
		var distance = get_parent().position.distance_to(position_target)

		if distance > 1:
			get_parent().position += direction * speed * delta
