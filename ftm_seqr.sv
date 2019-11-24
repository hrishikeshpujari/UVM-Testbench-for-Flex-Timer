class ftm_seqr extends uvm_sequencer #(seq_item); // FTM Sequencer 
 `uvm_component_utils(ftm_seqr)

 function new(string name="ftm_seqr", uvm_component parent = null );
  super.new(name, parent);
 endfunction : new

endclass : ftm_seqr
