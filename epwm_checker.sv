/* compares the DUT values and the Reference values */ 
class epwm_checker extends uvm_scoreboard;

  `uvm_component_utils(epwm_checker)

  uvm_tlm_analysis_fifo #(seq_item) coming_from_dut_fifo;
  uvm_tlm_analysis_fifo #(seq_item) coming_from_reference_fifo;
  uvm_tlm_analysis_fifo #(dut_mem) for_dut_mem;
  seq_item seq1,seq2;
  dut_mem req;

  function new(string name = "epwm_checker", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    begin
      coming_from_dut_fifo = new("coming_from_dut_fifo",this);
      coming_from_reference_fifo = new("coming_from_reference_fifo",this);
      for_dut_mem = new("for_dut_mem",this);
      seq1 = seq_item::type_id::create("seq1",this);
      seq2 = seq_item::type_id::create("seq2",this);
      req = new();
    end
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    begin
      forever begin
        coming_from_dut_fifo.get(seq1);
        coming_from_reference_fifo.get(seq2);
        for_dut_mem.get(req);

        if (req.FTM_COMBINE.DECAPEN0 == 'b0 && req.FTM_COMBINE.COMBINE0 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C0SC.MSB == 'b1) || (req.FTM_C1SC.MSB == 'b1))) begin
          if(seq1.clk_period_CH0 == seq2.clk_period_CH0) begin
          end else $display("Please, check your pulse width at time=%0d",$time);
          if(seq1.clk_period_CH1 == seq2.clk_period_CH1) begin
          end else $display("Please, check your pulse width at time=%0d",$time);
        end else 
          if (req.FTM_COMBINE.DECAPEN1 == 'b0 && req.FTM_COMBINE.COMBINE1 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C2SC.MSB == 'b1) || (req.FTM_C3SC.MSB == 'b1))) begin
            if(seq1.clk_period_CH2 == seq2.clk_period_CH2) begin
            end else $display("Please, check your pulse width at time=%0d",$time);

            if(seq1.clk_period_CH3 == seq2.clk_period_CH3) begin
            end else $display("Please, check your pulse width at time=%0d",$time);

          end else if (req.FTM_COMBINE.DECAPEN2 == 'b0 && req.FTM_COMBINE.COMBINE2 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C4SC.MSB == 'b1) || (req.FTM_C5SC.MSB == 'b1))) begin
            if(seq1.clk_period_CH4 == seq2.clk_period_CH4) begin
            end else $display("Please, check your pulse width at time=%0d",$time);

            if(seq1.clk_period_CH5 == seq2.clk_period_CH5) begin
            end else $display("Please, check your pulse width at time=%0d",$time);
          end else if (req.FTM_COMBINE.DECAPEN3 == 'b0 && req.FTM_COMBINE.COMBINE3 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C6SC.MSB == 'b1) || (req.FTM_C7SC.MSB == 'b1))) begin
            if(seq1.clk_period_CH6 == seq2.clk_period_CH6) begin
            end else $display("Please, check your pulse width at time=%0d",$time);

            if(seq1.clk_period_CH7 == seq2.clk_period_CH7) begin
            end else $display("Please, check your pulse width at time=%0d",$time);
          end 
      end 
    end
  endtask : run_phase

endclass : epwm_checker
