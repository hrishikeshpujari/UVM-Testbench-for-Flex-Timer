

/* EPWM Reference Scoreboard  */ 

class epwm_reference_sb extends uvm_scoreboard;
 
 `uvm_component_utils(epwm_reference_sb)
 
 uvm_tlm_analysis_fifo #(dut_mem) epwm_port;
 uvm_analysis_port #(seq_item) epwm_reference_port;
 uvm_analysis_port #(dut_mem) sending_dut_mem;
 seq_item seq;
 dut_mem req;

  function new(string name = "epwm_reference_sb", uvm_component parent = null);
   super.new(name, parent);
  endfunction
 
 function void build_phase(uvm_phase phase);
  begin
   epwm_port = new("epwm_port",this);
   sending_dut_mem = new("sending_dut_mem",this);
   epwm_reference_port = new("epwm_reference_port",this);
   seq = seq_item::type_id::create("seq",this);
   req = new();
  end
 endfunction : build_phase
 
 task run_phase(uvm_phase phase);
  begin
    forever begin
     epwm_port.get(req);
     // For Channel 0 and 1
      if (req.FTM_COMBINE.DECAPEN0 == 'b0 && req.FTM_COMBINE.COMBINE0 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C0SC.MSB == 'b1) || (req.FTM_C1SC.MSB == 'b1))) begin
        seq.clk_period_CH0 = (req.FTM_SYNC_MOD - req.FTM_SYNC_CNTIN+1)*(1<<req.FTM_SYNC_SC.PS)*(10);
        seq.on_time_CH0    = req.FTM_C0V-req.FTM_SYNC_CNTIN;
        seq.clk_period_CH1 = seq.clk_period_CH0;
        seq.on_time_CH1    = req.FTM_C1V-req.FTM_CNTIN;
      end
     // For Channel 2 and 3
      if (req.FTM_COMBINE.DECAPEN1 == 'b0 && req.FTM_COMBINE.COMBINE1 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C2SC.MSB == 'b1) || (req.FTM_C3SC.MSB == 'b1))) begin
        seq.clk_period_CH2 = (req.FTM_SYNC_MOD.MOD - req.FTM_CNTIN+1)*(1<<req.FTM_SC.PS)*(10);
        seq.on_time_CH2    = req.FTM_C2V.VAL-req.FTM_CNTIN.INIT;
        seq.clk_period_CH3 = seq.clk_period_CH2;
        seq.on_time_CH3    = req.FTM_C3V.VAL-req.FTM_CNTIN.INIT;
     end
     // For Channel 4 and 5
     if (req.FTM_COMBINE.DECAPEN2 == 'b0 && req.FTM_COMBINE.COMBINE2 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C4SC.MSB == 'b1) || (req.FTM_C5SC.MSB == 'b1))) begin
        seq.clk_period_CH4 = (req.FTM_SYNC_MOD.MOD - req.FTM_CNTIN+1)*(1<<req.FTM_SC.PS)*(10);
        seq.on_time_CH4    = req.FTM_C4V.VAL-req.FTM_CNTIN.INIT;
        seq.clk_period_CH5 = seq.clk_period_CH4;
        seq.on_time_CH5    = req.FTM_C5V.VAL-req.FTM_CNTIN.INIT;
      end
     // For Channel 6 and 7
      if (req.FTM_COMBINE.DECAPEN3 == 'b0 && req.FTM_COMBINE.COMBINE3 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C6SC.MSB == 'b1) || (req.FTM_C7SC.MSB == 'b1))) begin
        seq.clk_period_CH6 = (req.FTM_SYNC_MOD.MOD - req.FTM_CNTIN+1)*(1<<req.FTM_SC.PS)*(10);
        seq.on_time_CH6    = req.FTM_C6V.VAL-req.FTM_CNTIN.INIT;
        seq.clk_period_CH7 = seq.clk_period_CH6;
        seq.on_time_CH7    = req.FTM_C7V.VAL-req.FTM_CNTIN.INIT;
     end
   epwm_reference_port.write(seq); //Sending sequence item to EPWM checker
   sending_dut_mem.write(req); // Sending dut memory to EPWM checker 
    end 
  end
 endtask : run_phase
 
 endclass : epwm_reference_sb
