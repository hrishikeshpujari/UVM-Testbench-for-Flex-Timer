class ftm_test extends uvm_test; // UVM Test to be run
 `uvm_component_utils(ftm_test) 
  
  ftm_env environment; // UVM Environment handle
  dut_env dut_environment; // DUT Environment handle
  ftm_sequence seq; // Sequence class handle

 function new(string name = "ftm_test", uvm_component parent = null);
   super.new(name, parent);
 endfunction
 
 function void build_phase(uvm_phase phase);
   environment = ftm_env::type_id::create("ftm_env",this); //Building UVM Environment
   seq = ftm_sequence::type_id::create("seq",this); // Building sequence class
   dut_environment = dut_env::type_id::create("dut_env",this); // Building DUT Environment
 endfunction: build_phase

 task run_phase(uvm_phase phase);
  phase.raise_objection(this, "start of test");
  seq.start(environment.agent.seqr); // Starting the Sequence on Sequencer
  phase.drop_objection(this, "end of test");
  endtask: run_phase;

endclass: ftm_test
