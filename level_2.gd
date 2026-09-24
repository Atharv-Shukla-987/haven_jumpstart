extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group ("player"):
		get_tree().reload_current_scene()
