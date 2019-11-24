
/* CPWM Reference Model Scoreboard*/


class cpwm_reference_sb extends uvm_scoreboard;

  `uvm_component_utils(cpwm_reference_sb)

  uvm_tlm_analysis_fifo #(dut_mem) cpwm_port;
  uvm_analysis_port #(seq_item) cpwm_reference_port;
  uvm_analysis_port #(dut_mem) sending_dut_mem;
  seq_item seq;
  dut_mem req;

  function new(string name = "cpwm_reference_sb", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    begin
      cpwm_port = new("cpwm_port",this);
      sending_dut_mem = new("sending_dut_mem",this);
      cpwm_reference_port = new("cpwm_reference_port",this);
      seq = seq_item::type_id::create("seq",this);
      req = new();
    end
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    begin
      forever begin
        cpwm_port.get(req);
        if (req.FTM_COMBINE.DECAPEN0 == 'b0 && req.FTM_COMBINE.COMBINE0 == 'b0 ) begin
          seq.clk_period_CH0 = (2*(req.FTM_SYNC_MOD - req.FTM_SYNC_CNTIN))*((1<<req.FTM_SYNC_SC.PS)*(10));
          seq.on_time_CH0    = 2*(req.FTM_C0V-req.FTM_SYNC_CNTIN);
          seq.clk_period_CH1 = seq.clk_period_CH0;
          seq.on_time_CH1    = 2*(req.FTM_C0V-req.FTM_SYNC_CNTIN);
        end
        if (req.FTM_COMBINE.DECAPEN1 == 'b0 && req.FTM_COMBINE.COMBINE1 == 'b0 ) begin
          seq.clk_period_CH2 = (2*(req.FTM_SYNC_MOD - req.FTM_SYNC_CNTIN))*((1<<req.FTM_SYNC_SC.PS)*(10));
          seq.on_time_CH2    = 2*(req.FTM_C2V-req.FTM_SYNC_CNTIN);
          seq.clk_period_CH3 = seq.clk_period_CH2;
          seq.on_time_CH3    = 2*(req.FTM_C3V-req.FTM_SYNC_CNTIN);
        end
        if (req.FTM_COMBINE.DECAPEN2 == 'b0 && req.FTM_COMBINE.COMBINE2 == 'b0 ) begin
          seq.clk_period_CH4 = (2*(req.FTM_SYNC_MOD - req.FTM_SYNC_CNTIN))*((1<<req.FTM_SYNC_SC.PS)*(10));
          seq.on_time_CH4    = 2*(req.FTM_C4V-req.FTM_SYNC_CNTIN);
          seq.clk_period_CH5 = seq.clk_period_CH4;
          seq.on_time_CH5    = 2*(req.FTM_C5V-req.FTM_SYNC_CNTIN);
        end
        if (req.FTM_COMBINE.DECAPEN3 == 'b0 && req.FTM_COMBINE.COMBINE3 == 'b0 ) begin
          seq.clk_period_CH6 = (2*(req.FTM_SYNC_MOD - req.FTM_SYNC_CNTIN))*((1<<req.FTM_SYNC_SC.PS)*(10));
          seq.on_time_CH6    = 2*(req.FTM_C6V-req.FTM_SYNC_CNTIN);
          seq.clk_period_CH7 = seq.clk_period_CH6;
          seq.on_time_CH7    = 2*(req.FTM_C7V-req.FTM_SYNC_CNTIN);
        end
        cpwm_reference_port.write(seq);
        sending_dut_mem.write(req);
      end 
    end
  endtask : run_phase

endclass : cpwm_reference_sb
