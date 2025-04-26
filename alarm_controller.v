`timescale 1ns/1ps
module alarm_controller(
	input wire fire_alarm,
	input wire intruder_alarm,
	output wire siren_on,
	output wire alert_light
);

//只要任一警報成立,輸出就開啟
assign siren_on = fire_alarm | intruder_alarm;
assign alert_light = fire_alarm | intruder_alarm;

endmodule