
/* Flex Timer UVM Driver who drives the inputs from the sequences onto the
* interface and which is the put on the Sequencer */

class ftm_driver extends uvm_driver #(seq_item); // Flex Timer Driver 
  `uvm_component_utils(ftm_driver)

  seq_item req;

  virtual ftm_if ftm_intf; // input interface handle

  function new(string name = "ftm_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db #(virtual ftm_if)::get(null, "*","ftm_if", this.ftm_intf)) begin
      `uvm_error("connect", "ftm_if not found")
    end 
    req = seq_item::type_id::create("req",this);
  endfunction: build_phase; 

  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      @(posedge(ftm_intf.clk));
      ftm_intf.CH0   <=  req.CH0; // Driving values from sequences to the interface
      ftm_intf.CH1   <=  req.CH1;
      ftm_intf.CH2   <=  req.CH2;
      ftm_intf.CH3   <=  req.CH3;
      ftm_intf.CH4   <=  req.CH4;
      ftm_intf.CH5   <=  req.CH5;
      ftm_intf.CH6   <=  req.CH6;
      ftm_intf.CH7   <=  req.CH7;
      ftm_intf.wr_en <=  req.wr_en;
      ftm_intf.rd_en <=  req.rd_en;
      ftm_intf.data  <=  req.data;
      ftm_intf.reg_name <= req.reg_name;
      seq_item_port.item_done();
    end
  endtask : run_phase
endclass : ftm_driver
