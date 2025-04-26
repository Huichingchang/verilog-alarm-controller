`timescale 1ns/1ps
module alarm_controller_tb;
	reg fire_alarm, intruder_alarm;
	wire siren_on, alert_light;
	integer f;
	
	//實例化被側模組(UUT: Unit Under Test)
	alarm_controller uut(
		.fire_alarm(fire_alarm),
		.intruder_alarm(intruder_alarm),
		.siren_on(siren_on),
		.alert_light(alert_light)
	);
	
	initial begin
		$dumpfile("alarm_controller.vcd");
		$dumpvars(0, alarm_controller_tb);
		
		f=$fopen("monitor_log.txt", "w");
		if(!f) begin
			$display("Failed to open monitor_log.txt");
			$finish;
		end
		
		$display("Start Simulation");
		
		//初始值
		fire_alarm = 0; intruder_alarm = 0;
		#10;
		$fwrite(f,"fire_alarm=%b, intruder_alarm=%b -> siren_on=%b,alert_light=%b @ %0t ns\n", fire_alarm, intruder_alarm, siren_on, alert_light, $time);
		
		//觸發觸發火災警報
		fire_alarm = 1; intruder_alarm = 0;
		#10;
		$fwrite(f,"fire_alarm=%b, intruder_alarm=%b -> siren_on=%b,alert_light=%b @ %0t ns\n", fire_alarm, intruder_alarm, siren_on, alert_light, $time);
		
		//觸發入侵警報
		fire_alarm = 0; intruder_alarm = 1;
		#10;
		$fwrite(f,"fire_alarm=%b, intruder_alarm=%b -> siren_on=%b,alert_light=%b @ %0t ns\n", fire_alarm, intruder_alarm, siren_on, alert_light, $time);
		
		//同時有火災+入侵
		fire_alarm = 1; intruder_alarm = 1;
		#10;
		$fwrite(f,"fire_alarm=%b, intruder_alarm=%b -> siren_on=%b,alert_light=%b @ %0t ns\n", fire_alarm, intruder_alarm, siren_on, alert_light, $time);
		
		$fclose(f);
	   $display("Simulation Done");
		#20;
	   $finish;
	end
endmodule
		
		
		
		
		
		
		
		
		