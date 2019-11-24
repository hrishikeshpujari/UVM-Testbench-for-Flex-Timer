class ftm_agent extends uvm_agent; //UVM Agent with verification components
  `uvm_component_utils(ftm_agent)

  ftm_op_monitor op_mon; // Output Monitor handle
  ftm_inp_monitor inp_mon; // Input Monitor handle
  calculation_scoreboard csb; // Clock Period calculation scoreboard handle
  ftm_driver driver; // FTM driver handle 
  ftm_seqr seqr; // FTM sequencer handle
  epwm_reference_sb ersb; // Edge Aligned PWM reference model Scoreboard 
  cpwm_reference_sb crsb; // Centre Aligned PWM reference model Scoreboard
  opcompare_reference_sb ocrsb; // Output Compare Reference Model Scoreboard
  epwm_checker echecker; // Edge Aligned Checker Scoreboard
  cpwm_checker cchecker; // Centre Aligned Checker Scoreboard
  output_compare_checker op_checker; // Output Compare Checker Scoreboard

  function new(string name = "ftm_agent", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    begin
      super.build_phase(phase);
      op_mon = ftm_op_monitor::type_id::create("op_mon",this); // Building Output Monitor
      inp_mon = ftm_inp_monitor::type_id::create("inp_mon",this); // Building Input Monitor 
      driver = ftm_driver::type_id::create("driver",this); // Building Driver 
      seqr = ftm_seqr::type_id::create("seqr",this); // Building Sequencer 
      ersb = epwm_reference_sb::type_id::create("ersb",this); // Building EPWM reference Scoreboard
      crsb = cpwm_reference_sb::type_id::create("crsb",this);// Building cPWM reference Scoreboard
      ocrsb = opcompare_reference_sb::type_id::create("ocrsb",this);// Building Output Compare reference Scoreboard
      csb = calculation_scoreboard::type_id::create("csb",this); // Building Calculation Scoreboard 
      echecker = epwm_checker::type_id::create("echecker",this); // Building EPWM Checker 
      cchecker = cpwm_checker::type_id::create("checker",this); // Building CPWM Checker 
      op_checker = output_compare_checker::type_id::create("op_checker",this); // Building Output Compare Checker
    end
  endfunction: build_phase;

  function void connect_phase(uvm_phase phase);
    driver.seq_item_port.connect(seqr.seq_item_export); // Connecting Driver to Sequencer
    op_mon.op_monitor_port.connect(csb.calculation_scoreboard_port.analysis_export); // Connecting output monitor to Clock Period calculation scoreboard 
    op_mon.op_monitor_port.connect(op_checker.coming_from_dut_fifo.analysis_export); // Connecting output monitor to Output Compare Checker 
    inp_mon.inp_monitor_port.connect(ersb.epwm_port.analysis_export); // connecting input monitor to epwm reference scoreboard
    inp_mon.inp_monitor_port1.connect(ocrsb.opcompare_port.analysis_export);// connecting input monitor to output compare reference scoreboard
    inp_mon.inp_monitor_port2.connect(crsb.cpwm_port.analysis_export);// connecting input monitor to cpwm reference scoreboard
    csb.port.connect(echecker.coming_from_reference_fifo.analysis_export); // Connecting calculation scoreboard to epwm checker
    csb.port.connect(cchecker.coming_from_reference_fifo.analysis_export);// Connecting calculation scoreboard to cpwm checker
    ersb.epwm_reference_port.connect(echecker.coming_from_dut_fifo.analysis_export);// Connecting epwm reference scoreboard to epwm checker
    ersb.sending_dut_mem.connect(echecker.for_dut_mem.analysis_export);// Connecting epwm reference scoreboard to epwm checker
    crsb.cpwm_reference_port.connect(cchecker.coming_from_dut_fifo.analysis_export);// Connecting cpwm reference scoreboard to cpwm checker
    crsb.sending_dut_mem.connect(cchecker.for_dut_mem.analysis_export);// Connecting cpwm reference scoreboard to cpwm checker
    ocrsb.opcompare_reference_port.connect(op_checker.coming_from_dut_fifo.analysis_export);// Connecting output compare reference scoreboard to output compare checker
    ocrsb.sending_dut_mem.connect(op_checker.for_dut_mem.analysis_export);// Connecting output compare reference scoreboard to output compare checker
  endfunction: connect_phase;

  endclass: ftm_agent
