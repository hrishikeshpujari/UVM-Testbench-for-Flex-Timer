`include "uvm_macros.svh" //including UVM Macros
`include "ftm_pkg.sv" //including flex timer package which includes other UVM Components

module top();

  ftm_if dut_if(); //input interface with clock and reference channel outputs
  ftm_if2 dut_if2(); // output interface with channel outputs
 
  reg clk;
  reg reset;

  initial begin
    dut_if.clk = 0; // Generating the clock
    forever begin
      #5 dut_if.clk = ~dut_if.clk ;
    end
    $display("\n\n\nran out of clocks\n\n\n");
  end

  initial begin
    uvm_config_db#(virtual ftm_if)::set(null, "*", "ftm_if",dut_if); // Setting input interface in Config DB
    uvm_config_db#(virtual ftm_if2)::set(null, "*", "ftm_if2",dut_if2); // Setting output interface in Config DB
    run_test("ftm_test"); // Specifying the test name of the test to be started
  end

  initial begin
    $dumpfile("wave.vpd"); //Generating waveform file
    $dumpvars(0,top);
  end
endmodule : top
