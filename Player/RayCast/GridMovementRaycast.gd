extends RayCast2D

signal collided

onready var raycast_drawing = $RayCastDrawing

var dir = Vector2(0, 0)

func update_raycast():
	raycast_drawing.clear_points()
	set_cast_to(position + (dir * Global.BLOCK_SIZE))
	force_raycast_update()
	
	if is_colliding():
		emit_signal("collided", get_collider())
		dir = Vector2(0, 0)
	
	draw_raycast()


func draw_raycast():
	raycast_drawing.add_point(raycast_drawing.position)
	raycast_drawing.add_point(raycast_drawing.position + dir * Global.BLOCK_SIZE)


func _on_Player_moved(direction):
	dir = direction
	update_raycast()
	draw_raycast()
