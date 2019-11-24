class ftm_env extends uvm_env;
  `uvm_component_utils (ftm_env)

  ftm_agent agent; // UVM Environment Agent handle

  function new(string name="ftm_env", uvm_component parent=null);
    super.new(name,parent);
  endfunction: new;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = ftm_agent::type_id::create("agent",this); // Building Agent class  
  endfunction: build_phase;

endclass : ftm_env
