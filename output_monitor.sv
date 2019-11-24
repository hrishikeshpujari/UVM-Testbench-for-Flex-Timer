class ftm_op_monitor extends uvm_monitor; // UVM Output Monitor

  `uvm_component_utils(ftm_op_monitor)

  uvm_analysis_port #(seq_item) op_monitor_port; // Monitor Port handle
  seq_item req; // sequence item handle

  virtual ftm_if ftm_intf; // Input Interface
  virtual ftm_if2 ftm_intf2; // Output Interface

  function new(string name = "ftm_op_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    begin
      if (!uvm_config_db #(virtual ftm_if)::get(null, "*","ftm_if", this.ftm_intf)) begin
        `uvm_error("connect", "ftm_if not found")
      end
      if (!uvm_config_db #(virtual ftm_if2)::get(null, "*","ftm_if2", this.ftm_intf2)) begin
        `uvm_error("connect", "ftm_if2 not found")
      end
      op_monitor_port = new("op_monitor_port",this); // building port
      req = seq_item::type_id::create("req",this); // building sequence item 
    end
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    begin
      forever begin
        @(posedge(ftm_intf.clk))#1;
        req.CH0   =  ftm_intf2.CH0; // Capturing Channel Outputs in sequence item object
        req.CH1   =  ftm_intf2.CH1;
        req.CH2   =  ftm_intf2.CH2;
        req.CH3   =  ftm_intf2.CH3;
        req.CH4   =  ftm_intf2.CH4;
        req.CH5   =  ftm_intf2.CH5;
        req.CH6   =  ftm_intf2.CH6;
        req.CH7   =  ftm_intf2.CH7;
        op_monitor_port.write(req);
      end
    end
  endtask : run_phase

endclass : ftm_op_monitor 
