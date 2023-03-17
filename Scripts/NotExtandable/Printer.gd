class_name Printer;
extends Label

signal on_start;
signal on_end;

@export_multiline var __new_text: String;
@export var __duration: float;

func print_chars():
	text = "";
	
	for one_char in __new_text:
		await  get_tree().create_timer(__duration / __new_text.length()).timeout;
		text += one_char;

