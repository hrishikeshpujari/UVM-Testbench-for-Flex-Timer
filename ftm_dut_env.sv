class dut_env extends uvm_env; // DUT Environment
`uvm_component_utils (dut_env)

  ftm_dut_agent dut_agent;
  
  function new(string name="dut_env", uvm_component parent=null);
    super.new(name,parent);
  endfunction: new;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dut_agent = ftm_dut_agent::type_id::create("dut_agent",this); 
  endfunction: build_phase;
  
endclass : dut_env
