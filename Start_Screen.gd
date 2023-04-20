extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/Start Button".grab_focus()


func _on_Start_Button_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit()
