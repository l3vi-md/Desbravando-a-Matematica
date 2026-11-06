extends Node

var serial: GdSerial
var direcao_joystick = 0.0

func _ready():
	serial = GdSerial.new()
	serial.set_port("COM3")
	serial.set_baud_rate(115200)
	serial.open()

func _process(delta):
	
	if serial != null:
		var data = serial.readline()
		if data != "":
			print("Recebido: ", data)
			var values = data.strip_edges().split(",")
			if values.size() == 2:
				var x = float(values[0])
				direcao_joystick = (x - 2048.0) / 2048.0
				print(direcao_joystick)
				if abs(direcao_joystick) < 0.1:
					direcao_joystick = 0.0

func get_direcao() -> float:
	return direcao_joystick

func _exit_tree():
	if serial != null:
		serial.close()
		
