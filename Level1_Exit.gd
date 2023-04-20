func _on_Area2D_body_entered(body):
	if body.name == "Player":
		var sound = get_node_or_null("/root/Game/Door_Sound")
		if sound != null:
			sound.playing = true
		var _scene = get_tree().change_scene("res://Level2.tscn")
