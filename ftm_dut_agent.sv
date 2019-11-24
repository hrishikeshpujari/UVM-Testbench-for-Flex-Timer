class ftm_dut_agent extends uvm_agent; // FTM DUT Enivornment Agent 
  `uvm_component_utils(ftm_dut_agent)
  
  ftm_dut dut;  // DUT handle
  outcompare output_compare; // Output Compare Handle
  edgealigned epwm; // EPWM handle
  centeraligned cpwm; // CPWM Handle
   
  function new(string name = "ftm_dut_agent", uvm_component parent = null);
   super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
   begin
    super.build_phase(phase);
    dut = ftm_dut::type_id::create("dut",this);
    output_compare = outcompare::type_id::create("output_compare",this);
    epwm = edgealigned::type_id::create("epwm",this);
    cpwm = centeraligned::type_id::create("cpwm",this);
   end
  endfunction: build_phase;

  function void connect_phase(uvm_phase phase);
    dut.dut_port.connect(output_compare.counter_fifo.analysis_export);
    dut.dut_port1.connect(epwm.counter_fifo.analysis_export);
    dut.dut_port2.connect(cpwm.counter_fifo.analysis_export);
  endfunction: connect_phase;
    
endclass: ftm_dut_agent
