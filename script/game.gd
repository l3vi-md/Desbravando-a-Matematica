extends Node2D

var button_type = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/AnimationPlayer.play("Fade_out")



func _on_botao_fase_1_pressed() -> void:
	button_type = "botao_fase1"
	$ColorRect.show()
	$ColorRect/fade_time.start()
	$ColorRect/AnimationPlayer.play("Fade_in")
	pass
	



func _on_botao_fase_2_pressed() -> void:
	button_type = "botao_fase2"
	$ColorRect.show()
	$ColorRect/fade_time.start()
	$ColorRect/AnimationPlayer.play("Fade_in")
	
	pass



func _on_botao_fase_3_pressed() -> void:
	button_type = "botao_fase3"
	$ColorRect.show()
	$ColorRect/fade_time.start()
	$ColorRect/AnimationPlayer.play("Fade_in")
	
	pass
	



func _on_botao_fase_4_pressed() -> void:
	button_type = "botao_fase4"
	$ColorRect.show()
	$ColorRect/fade_time.start()
	$ColorRect/AnimationPlayer.play("Fade_in")
	
	pass


func _on_fade_time_timeout() -> void:
	if button_type == "botao_fase1" :
		get_tree().change_scene_to_file("res://cenas/fase1Chegada.tscn")
	elif button_type == "botao_fase2" :
		get_tree().change_scene_to_file("res://cenas/chegadaFase2.tscn")
	elif button_type == "botao_fase3" :
		get_tree().change_scene_to_file("res://cenas/chegadaFase3.tscn")
	elif button_type == "botao_fase4" :
		get_tree().change_scene_to_file("res://cenas/chegadaFase4.tscn")


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/tela_inicial.tscn")
	
	pass # Replace with function body.
