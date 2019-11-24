/* Output Compare Reference Model  */

class opcompare_reference_sb extends uvm_scoreboard;
 
 `uvm_component_utils(opcompare_reference_sb)
 
 uvm_tlm_analysis_fifo #(dut_mem) opcompare_port;
 uvm_analysis_port #(seq_item) opcompare_reference_port;
 uvm_analysis_port #(dut_mem) sending_dut_mem;
 seq_item seq;
 dut_mem req;

  function new(string name = "opcompare_reference_sb", uvm_component parent = null);
   super.new(name, parent);
  endfunction
 
 function void build_phase(uvm_phase phase);
  begin
   opcompare_port = new("opcompare_port",this);
   sending_dut_mem = new("sending_dut_mem",this);
   opcompare_reference_port = new("opcompare_reference_port",this);
   seq = seq_item::type_id::create("seq",this);
   req = new();
  end
 endfunction : build_phase
 
 task run_phase(uvm_phase phase);
  begin
    forever begin
     opcompare_port.get(req);
      if(req.FTM_COMBINE.DECAPEN0 == 'b0) begin
     //    <------------------for n=0 start------------------------------>
    if(req.count==req.FTM_C0V) begin////////for n=0
     case({req.FTM_C0SC.ELSB,req.FTM_C0SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C0SC.CHIE ==1) begin
        req.FTM_STATUS.CH0F = 1;
       if(seq.CH0==0)
        seq.CH0=1;
       else
        seq.CH0=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C0SC.CHIE ==1) begin
        req.FTM_STATUS.CH0F = 1;
        seq.CH0=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C0SC.CHIE ==1) begin

        req.FTM_STATUS.CH0F = 1;
        seq.CH0=1;
       end
      end 
     endcase
    end	
    //    <------------------for n=0 end------------------------------>
    //    <------------------for n=1 start------------------------------>
    if(req.count==req.FTM_C1V) begin
     case({req.FTM_C1SC.ELSB,req.FTM_C1SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C1SC.CHIE ==1) begin
        req.FTM_STATUS.CH1F = 1;
        if(seq.CH1==0)
         seq.CH1=1;
        else
         seq.CH1=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C1SC.CHIE ==1) begin
         req.FTM_STATUS.CH1F = 1;
         seq.CH1=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C1SC.CHIE ==1) begin
        req.FTM_STATUS.CH1F = 1;
        req.FTM_C1SC.CHIE =1;
        seq.CH1=1;
       end
      end 
     endcase
    end
    //    <------------------for n=1 end------------------------------>
   end 
   
   
   
   
   //<------------------------------ for n=2,3------------------------------------------------------->
  if(req.FTM_COMBINE.DECAPEN1 == 'b0) begin
     //    <------------------for n=2 start------------------------------>
    if(req.count==req.FTM_C2V) begin////////for n=0
     case({req.FTM_C2SC.ELSB,req.FTM_C2SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C2SC.CHIE ==1) begin
        req.FTM_STATUS.CH2F = 1;
       if(seq.CH2==0)
        seq.CH2=1;
       else
        seq.CH2=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C2SC.CHIE ==1) begin
        req.FTM_STATUS.CH2F = 1;
        seq.CH2=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C2SC.CHIE ==1) begin

        req.FTM_STATUS.CH2F = 1;
        seq.CH2=1;
       end
      end 
     endcase
    end	
    //    <------------------for n=2 end------------------------------>
    //    <------------------for n=3 start------------------------------>
    if(req.count==req.FTM_C3V) begin
     case({req.FTM_C3SC.ELSB,req.FTM_C3SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C3SC.CHIE ==1) begin
        req.FTM_STATUS.CH3F = 1;
        if(seq.CH3==0)
         seq.CH3=1;
        else
         seq.CH3=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C3SC.CHIE ==1) begin
         req.FTM_STATUS.CH3F = 1;
         seq.CH3=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C3SC.CHIE ==1) begin
        req.FTM_STATUS.CH3F = 1;
        req.FTM_C3SC.CHIE =1;
        seq.CH3=1;
       end
      end 
     endcase
    end
    //    <------------------for n=3 end------------------------------>
   end



   //<------------------------------ for n=4,5------------------------------------------------------->
  if(req.FTM_COMBINE.DECAPEN2 == 'b0) begin
     //    <------------------for n=4 start------------------------------>
    if(req.count==req.FTM_C4V) begin////////for n=0
     case({req.FTM_C4SC.ELSB,req.FTM_C4SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C4SC.CHIE ==1) begin
        req.FTM_STATUS.CH4F = 1;
       if(seq.CH4==0)
        seq.CH4=1;
       else
        seq.CH4=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C4SC.CHIE ==1) begin
        req.FTM_STATUS.CH4F = 1;
        seq.CH4=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C4SC.CHIE ==1) begin

        req.FTM_STATUS.CH4F = 1;
        seq.CH4=1;
       end
      end 
     endcase
    end	
    //    <------------------for n=4 end------------------------------>
    //    <------------------for n=5 start------------------------------>
    if(req.count==req.FTM_C5V) begin
     case({req.FTM_C5SC.ELSB,req.FTM_C5SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C5SC.CHIE ==1) begin
        req.FTM_STATUS.CH5F = 1;
        if(seq.CH5==0)
         seq.CH5=1;
        else
         seq.CH5=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C5SC.CHIE ==1) begin
         req.FTM_STATUS.CH5F = 1;
         seq.CH5=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C5SC.CHIE ==1) begin
        req.FTM_STATUS.CH5F = 1;
        req.FTM_C5SC.CHIE =1;
        seq.CH5=1;
       end
      end 
     endcase
    end
    //    <------------------for n=5 end------------------------------>
   end
   
   
   
   //<------------------------------ for n=6,7------------------------------------------------------->
  if(req.FTM_COMBINE.DECAPEN3 == 'b0) begin
     //    <------------------for n=6 start------------------------------>
    if(req.count==req.FTM_C6V) begin////////for n=0
     case({req.FTM_C6SC.ELSB,req.FTM_C6SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C6SC.CHIE ==1) begin
        req.FTM_STATUS.CH6F = 1;
       if(seq.CH6==0)
        seq.CH6=1;
       else
        seq.CH6=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C6SC.CHIE ==1) begin
        req.FTM_STATUS.CH6F = 1;
        seq.CH6=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C6SC.CHIE ==1) begin

        req.FTM_STATUS.CH6F = 1;
        seq.CH6=1;
       end
      end 
     endcase
    end	
    //    <------------------for n=6 end------------------------------>
    //    <------------------for n=7 start------------------------------>
    if(req.count==req.FTM_C7V) begin
     case({req.FTM_C7SC.ELSB,req.FTM_C7SC.ELSA})
      'b01: 
      begin 
       if (req.FTM_C7SC.CHIE ==1) begin
        req.FTM_STATUS.CH7F = 1;
        if(seq.CH7==0)
         seq.CH7=1;
        else
         seq.CH7=0;
       end
      end
      'b10: 
      begin
       if (req.FTM_C7SC.CHIE ==1) begin
         req.FTM_STATUS.CH7F = 1;
         seq.CH7=0;
       end
      end	
      'b11: 
      begin
       if (req.FTM_C7SC.CHIE ==1) begin
        req.FTM_STATUS.CH7F = 1;
        req.FTM_C7SC.CHIE =1;
        seq.CH7=1;
       end
      end 
     endcase
    end
    //    <------------------for n=7 end------------------------------>
   end

   opcompare_reference_port.write(seq);
   sending_dut_mem.write(req);
    end 
  end
 endtask : run_phase
 
 endclass : opcompare_reference_sb
