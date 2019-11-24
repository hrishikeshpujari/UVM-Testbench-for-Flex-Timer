/* Output Compare Checker Scoreboard*/

class output_compare_checker extends uvm_scoreboard;

  `uvm_component_utils(output_compare_checker)

  uvm_tlm_analysis_fifo #(seq_item) coming_from_dut_fifo;
  uvm_tlm_analysis_fifo #(seq_item) coming_from_reference_fifo;
  uvm_tlm_analysis_fifo #(dut_mem) for_dut_mem;
  seq_item seq1,seq2;
  dut_mem req;


  function new(string name = "output_compare_checker", uvm_component parent = null);
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

  task run_phase(uvm_phase phase);begin
    forever begin
      coming_from_dut_fifo.get(seq1);
      coming_from_reference_fifo.get(seq2);
      for_dut_mem.get(req);
      if (req.FTM_COMBINE.DECAPEN3 == 'b0 && req.FTM_COMBINE.COMBINE3 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C6SC.MSB == 'b0 && req.FTM_C6SC.MSA == 'b1) || (req.FTM_C7SC.MSB == 'b0 && req.FTM_C7SC.MSA == 'b1))) begin
        if(seq1.CH6 == seq2.CH6) begin
          $display("CH6 output compare is perfect");
        end else begin
          $display("CH6 output compare is failing");
        end
        if(seq1.CH7 == seq2.CH7) begin
          $display("CH7 output compare is perfect");
        end else begin
          $display("CH7 output compare is failing");
        end
      end	 

      if (req.FTM_COMBINE.DECAPEN2 == 'b0 && req.FTM_COMBINE.COMBINE2 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C4SC.MSB == 'b0 && req.FTM_C4SC.MSA == 'b1) || (req.FTM_C5SC.MSB == 'b0 && req.FTM_C5SC.MSA == 'b1))) begin
        if(seq1.CH4 == seq2.CH4) begin
          $display("CH4 output compare is perfect");
        end else begin
          $display("CH4 output compare is failing");
        end
        if(seq1.CH5 == seq2.CH5) begin
          $display("CH5 output compare is perfect");
        end else begin
          $display("CH5 output compare is failing");
        end
      end  

      if (req.FTM_COMBINE.DECAPEN1 == 'b0 && req.FTM_COMBINE.COMBINE1 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C2SC.MSB == 'b0 && req.FTM_C2SC.MSA == 'b1) || (req.FTM_C3SC.MSB == 'b0 && req.FTM_C3SC.MSA == 'b1))) begin
        if(seq1.CH2 == seq2.CH2) begin
          $display("CH2 output compare is perfect");
        end else begin
          $display("CH2 output compare is failing");
        end
        if(seq1.CH3 == seq2.CH3) begin
          $display("CH3 output compare is perfect");
        end else begin
          $display("CH3 output compare is failing");
        end
      end	 

      if (req.FTM_COMBINE.DECAPEN0 == 'b0 && req.FTM_COMBINE.COMBINE0 == 'b0 && req.FTM_SC.CPWMS == 'b0 && ((req.FTM_C0SC.MSB == 'b0 && req.FTM_C0SC.MSA == 'b1) || (req.FTM_C1SC.MSB == 'b0 && req.FTM_C1SC.MSA == 'b1))) begin
        if(seq1.CH0 == seq2.CH0) begin
          $display("CH0 output compare is perfect");
        end else begin
          $display("CH0 output compare is failing");
        end
        if(seq1.CH1 == seq2.CH1) begin
          $display("CH1 output compare is perfect");
        end else begin
          $display("CH1 output compare is failing");
        end
      end 
    end
  end
  endtask : run_phase

endclass : output_compare_checker
