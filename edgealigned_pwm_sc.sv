/* EPWM DUT Monitor which replicates the EPWM Logic and generates PWM */

class edgealigned extends uvm_monitor;
  `uvm_component_utils(edgealigned)

  dut_mem dut_memory;
  sync_mem sync_memory_space; 

  int counter;

  uvm_tlm_analysis_fifo #(dut_mem) counter_fifo;
  virtual ftm_if2 ftm_intf2;


  function new (string name="edgealigned",uvm_component parent =null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual ftm_if2)::get(null, "*","ftm_if2", this.ftm_intf2)) begin
      `uvm_error("connect", "alu_if not found")
    end
    counter_fifo = new("counter_fifo", this);
    dut_memory = new();
    sync_memory_space = new();
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    forever 
      begin
        counter_fifo.get(dut_memory);
        counter = dut_memory.count;
        $display("IT IS IN EDGE ALIGNED MODE");
        //<------------------------------ for n=0,1------------------------------------------------------->
        if(dut_memory.FTM_COMBINE.DECAPEN0 == 'b0) begin
          //    <------------------for n=0 start------------------------------>
          casex({dut_memory.FTM_C0SC.ELSB,dut_memory.FTM_C0SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C0SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH0F = 1;
                  if(counter==dut_memory.FTM_C0V) begin////////for n=0
                    ftm_intf2.CH0=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH0=0;
                end
                if(counter==dut_memory.FTM_C0V) begin////////for n=0
                  ftm_intf2.CH0=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH0=1;
                end
                if(counter==dut_memory.FTM_C0V) begin////////for n=0
                  ftm_intf2.CH0=0;
                end 
              end	
          endcase
          //    <------------------for n=0 end------------------------------>
          //    <------------------for n=1 start------------------------------>
          casex({dut_memory.FTM_C1SC.ELSB,dut_memory.FTM_C1SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C1SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH1F = 1;
                  if(counter==dut_memory.FTM_C1V) begin////////for n=0
                    ftm_intf2.CH1=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH1=0;
                end
                if(counter==dut_memory.FTM_C1V) begin////////for n=0
                  ftm_intf2.CH1=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH1=1;
                end
                if(counter==dut_memory.FTM_C1V) begin////////for n=0
                  ftm_intf2.CH1=0;
                end 
              end	
          endcase
          //    <------------------for n=1 end------------------------------>
        end 




        //<------------------------------ for n=2,3------------------------------------------------------->
        if(dut_memory.FTM_COMBINE.DECAPEN2 == 'b0) begin
          //    <------------------for n=2 start------------------------------>
          casex({dut_memory.FTM_C2SC.ELSB,dut_memory.FTM_C2SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C2SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH2F = 1;
                  if(counter==dut_memory.FTM_C2V) begin////////for n=0
                    ftm_intf2.CH2=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH2=0;
                end
                if(counter==dut_memory.FTM_C2V) begin////////for n=0
                  ftm_intf2.CH2=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH2=1;
                end
                if(counter==dut_memory.FTM_C2V) begin////////for n=0
                  ftm_intf2.CH2=0;
                end 
              end	
          endcase

          //    <------------------for n=2 end------------------------------>
          //    <------------------for n=3 start------------------------------>
          casex({dut_memory.FTM_C3SC.ELSB,dut_memory.FTM_C3SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C3SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH3F = 1;
                  if(counter==dut_memory.FTM_C3V) begin////////for n=0
                    ftm_intf2.CH3=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH3=0;
                end
                if(counter==dut_memory.FTM_C3V) begin////////for n=0
                  ftm_intf2.CH3=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH3=1;
                end
                if(counter==dut_memory.FTM_C3V) begin////////for n=0
                  ftm_intf2.CH3=0;
                end 
              end	
          endcase
          //    <------------------for n=3 end------------------------------>
        end



        //<------------------------------ for n=4,5------------------------------------------------------->
        if(dut_memory.FTM_COMBINE.DECAPEN2 == 'b0) begin
          //    <------------------for n=4 start------------------------------>
          casex({dut_memory.FTM_C4SC.ELSB,dut_memory.FTM_C4SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C4SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH4F = 1;
                  if(counter==dut_memory.FTM_C4V) begin////////for n=0
                    ftm_intf2.CH4=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH4=0;
                end
                if(counter==dut_memory.FTM_C4V) begin////////for n=0
                  ftm_intf2.CH4=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH4=1;
                end
                if(counter==dut_memory.FTM_C4V) begin////////for n=0
                  ftm_intf2.CH4=0;
                end 
              end	
          endcase	
          //    <------------------for n=4 end------------------------------>
          //    <------------------for n=5 start------------------------------>
          casex({dut_memory.FTM_C5SC.ELSB,dut_memory.FTM_C5SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C5SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH5F = 1;
                  if(counter==dut_memory.FTM_C5V) begin////////for n=0
                    ftm_intf2.CH5=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH5=0;
                end
                if(counter==dut_memory.FTM_C5V) begin////////for n=0
                  ftm_intf2.CH5=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH5=1;
                end
                if(counter==dut_memory.FTM_C5V) begin////////for n=0
                  ftm_intf2.CH5=0;
                end 
              end	
          endcase
          //    <------------------for n=5 end------------------------------>
        end



        //<------------------------------ for n=6,7------------------------------------------------------->
        if(dut_memory.FTM_COMBINE.DECAPEN3 == 'b0) begin
          //    <------------------for n=6 start------------------------------>
          casex({dut_memory.FTM_C6SC.ELSB,dut_memory.FTM_C6SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C6SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH6F = 1;
                  if(counter==dut_memory.FTM_C6V) begin////////for n=0
                    ftm_intf2.CH6=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH6=0;
                end
                if(counter==dut_memory.FTM_C6V) begin////////for n=0
                  ftm_intf2.CH6=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH6=1;
                end
                if(counter==dut_memory.FTM_C6V) begin////////for n=0
                  ftm_intf2.CH6=0;
                end 
              end	
          endcase	
          //    <------------------for n=6 end------------------------------>
          //    <------------------for n=7 start------------------------------>
          casex({dut_memory.FTM_C7SC.ELSB,dut_memory.FTM_C7SC.ELSA})
            'b00: 
              begin 
                if (dut_memory.FTM_C7SC.CHIE ==1) begin
                  dut_memory.FTM_STATUS.CH7F = 1;
                  if(counter==dut_memory.FTM_C7V) begin////////for n=0
                    ftm_intf2.CH7=1;
                  end 
                end
              end
            'bx1: 
              begin 
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH7=0;
                end
                if(counter==dut_memory.FTM_C7V) begin////////for n=0
                  ftm_intf2.CH7=1;
                end
              end
            'b10: 
              begin
                if(counter == sync_memory_space.FTM_CNTIN) begin
                  ftm_intf2.CH7=1;
                end
                if(counter==dut_memory.FTM_C7V) begin////////for n=0
                  ftm_intf2.CH7=0;
                end 
              end	
          endcase
          //    <------------------for n=7 end------------------------------>
        end
      end 
  endtask

endclass

