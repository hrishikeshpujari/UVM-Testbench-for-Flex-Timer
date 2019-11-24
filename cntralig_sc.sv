class centeraligned extends uvm_scoreboard;
  `uvm_component_utils(centeraligned)

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
    forever begin
      counter_fifo.get(dut_memory);
      counter = dut_memory.count;
      $display("IT IS IN CENTER ALIGNED MODE ");
      //<------------------------------ for n=0,1------------------------------------------------------->
      //if(dut_memory.FTM_COMBINE.DECAPEN0 == 'b0) begin   
      if(dut_memory.FTM_COMBINE.DECAPEN0== 'b0 && dut_memory.FTM_COMBINE.COMBINE0== 0 && dut_memory.FTM_SC.CPWMS==1 && dut_memory.FTM_QDCTRL.QUADEN==0) begin
        if (dut_memory.FTM_C0SC.ELSA == 'b0 && dut_memory.FTM_C0SC.ELSB == 'b0) begin
          if(counter == dut_memory.FTM_C0V) begin
            dut_memory.FTM_STATUS.CH0F = 'b1;
            if(dut_memory.FTM_C0SC.CHIE == 'b1) ftm_intf2.CH0 = 'b1;
          end
        end else if (dut_memory.FTM_C0SC.ELSA == 'b1 && dut_memory.FTM_C0SC.ELSB == 'b0) begin
          if(counter == dut_memory.FTM_C0V) begin
            if(dut_memory.if_up_count) ftm_intf2.CH0 = 'b0;
            else if (dut_memory.if_down_count) ftm_intf2.CH0 = 'b1;
          end
        end else if (dut_memory.FTM_C0SC.ELSA === 'bx && dut_memory.FTM_C0SC.ELSB == 'b1) begin
          if(counter == dut_memory.FTM_C0V) begin
            if(dut_memory.if_up_count) ftm_intf2.CH0 = 'b1;
            else if (dut_memory.if_down_count) ftm_intf2.CH0 = 'b0;
          end
        end

        if (dut_memory.FTM_C1SC.ELSA == 'b0 && dut_memory.FTM_C1SC.ELSB == 'b0) begin
          if(counter == dut_memory.FTM_C1V) begin
            dut_memory.FTM_STATUS.CH1F = 'b1;
            if(dut_memory.FTM_C1SC.CHIE == 'b1) ftm_intf2.CH1 = 'b1;
          end
        end else if (dut_memory.FTM_C1SC.ELSA == 'b1 && dut_memory.FTM_C1SC.ELSB == 'b0) begin
          if(counter == dut_memory.FTM_C1V) begin
            if(dut_memory.if_up_count) ftm_intf2.CH1 = 'b0;
            else if (dut_memory.if_down_count) ftm_intf2.CH1 = 'b1;
          end
        end else if (dut_memory.FTM_C1SC.ELSA === 'bx && dut_memory.FTM_C1SC.ELSB == 'b1) begin
          if(counter == dut_memory.FTM_C1V) begin
            if(dut_memory.if_up_count) ftm_intf2.CH1 = 'b1;
            else if (dut_memory.if_down_count) ftm_intf2.CH1 = 'b0;
          end
        end
      end

      //<------------------------------ for n=2,3------------------------------------------------------->
      if(dut_memory.FTM_COMBINE.DECAPEN1 == 'b0) begin  
        if(dut_memory.FTM_COMBINE.DECAPEN1== 'b0 && dut_memory.FTM_COMBINE.COMBINE1== 0 && dut_memory.FTM_SC.CPWMS==1 && dut_memory.FTM_QDCTRL.QUADEN==0) begin
          if (dut_memory.FTM_C2SC.ELSA == 'b0 && dut_memory.FTM_C2SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C2V) begin
              dut_memory.FTM_STATUS.CH2F = 'b1;
              if(dut_memory.FTM_C2SC.CHIE == 'b1) ftm_intf2.CH2 = 'b1;
            end
          end else if (dut_memory.FTM_C2SC.ELSA == 'b1 && dut_memory.FTM_C2SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C2V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH2 = 'b0;
              else if (dut_memory.if_down_count) ftm_intf2.CH2 = 'b1;
            end
          end else if (dut_memory.FTM_C2SC.ELSA === 'bx && dut_memory.FTM_C2SC.ELSB == 'b1) begin
            if(counter == dut_memory.FTM_C2V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH2 = 'b1;
              else if (dut_memory.if_down_count) ftm_intf2.CH2 = 'b0;
            end
          end

          if (dut_memory.FTM_C3SC.ELSA == 'b0 && dut_memory.FTM_C3SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C3V) begin
              dut_memory.FTM_STATUS.CH3F = 'b1;
              if(dut_memory.FTM_C3SC.CHIE == 'b1) ftm_intf2.CH3 = 'b1;
            end
          end else if (dut_memory.FTM_C3SC.ELSA == 'b1 && dut_memory.FTM_C3SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C3V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH3 = 'b0;
              else if (dut_memory.if_down_count) ftm_intf2.CH3 = 'b1;
            end
          end else if (dut_memory.FTM_C3SC.ELSA == 'bx && dut_memory.FTM_C3SC.ELSB == 'b1) begin
            if(counter == dut_memory.FTM_C3V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH3 = 'b1;
              else if (dut_memory.if_down_count) ftm_intf2.CH3 = 'b0;
            end
          end
        end
      end    

      //<------------------------------ for n=4,5------------------------------------------------------->
      if(dut_memory.FTM_COMBINE.DECAPEN2 == 'b0) begin   
        if(dut_memory.FTM_COMBINE.DECAPEN2== 'b0 && dut_memory.FTM_COMBINE.COMBINE2== 0 && dut_memory.FTM_SC.CPWMS==1 && dut_memory.FTM_QDCTRL.QUADEN==0) begin
          if (dut_memory.FTM_C4SC.ELSA == 'b0 && dut_memory.FTM_C4SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C4V) begin
              dut_memory.FTM_STATUS.CH4F = 'b1;
              if(dut_memory.FTM_C4SC.CHIE == 'b1) ftm_intf2.CH4 = 'b1;
            end
          end else if (dut_memory.FTM_C4SC.ELSA == 'b1 && dut_memory.FTM_C4SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C4V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH4 = 'b0;
              else if (dut_memory.if_down_count) ftm_intf2.CH4 = 'b1;
            end
          end else if (dut_memory.FTM_C4SC.ELSA === 'bx && dut_memory.FTM_C4SC.ELSB == 'b1) begin
            if(counter == dut_memory.FTM_C4V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH4 = 'b1;
              else if (dut_memory.if_down_count) ftm_intf2.CH4 = 'b0;
            end
          end

          if (dut_memory.FTM_C5SC.ELSA == 'b0 && dut_memory.FTM_C5SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C5V) begin
              dut_memory.FTM_STATUS.CH5F = 'b1;
              if(dut_memory.FTM_C5SC.CHIE == 'b1) ftm_intf2.CH5 = 'b1;
            end
          end else if (dut_memory.FTM_C5SC.ELSA == 'b1 && dut_memory.FTM_C5SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C5V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH5 = 'b0;
              else if (dut_memory.if_down_count) ftm_intf2.CH5 = 'b1;
            end
          end else if (dut_memory.FTM_C5SC.ELSA == 'bx && dut_memory.FTM_C5SC.ELSB == 'b1) begin
            if(counter == dut_memory.FTM_C5V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH5 = 'b1;
              else if (dut_memory.if_down_count) ftm_intf2.CH5 = 'b0;
            end
          end
        end
      end      

      ////<------------------------------ for n=6,7------------------------------------------------------->
      if(dut_memory.FTM_COMBINE.DECAPEN3 == 'b0) begin   
        if(dut_memory.FTM_COMBINE.DECAPEN3== 'b0 && dut_memory.FTM_COMBINE.COMBINE3== 0 && dut_memory.FTM_SC.CPWMS==1 && dut_memory.FTM_QDCTRL.QUADEN==0) begin
          if (dut_memory.FTM_C6SC.ELSA == 'b0 && dut_memory.FTM_C6SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C6V) begin
              dut_memory.FTM_STATUS.CH6F = 'b1;
              if(dut_memory.FTM_C6SC.CHIE == 'b1) ftm_intf2.CH6 = 'b1;
            end
          end else if (dut_memory.FTM_C6SC.ELSA == 'b1 && dut_memory.FTM_C6SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C6V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH6 = 'b0;
              else if (dut_memory.if_down_count) ftm_intf2.CH6 = 'b1;
            end
          end else if (dut_memory.FTM_C6SC.ELSA === 'bx && dut_memory.FTM_C6SC.ELSB == 'b1) begin
            if(counter == dut_memory.FTM_C6V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH6 = 'b1;
              else if (dut_memory.if_down_count) ftm_intf2.CH6 = 'b0;
            end
          end

          if (dut_memory.FTM_C7SC.ELSA == 'b0 && dut_memory.FTM_C7SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C7V) begin
              dut_memory.FTM_STATUS.CH7F = 'b1;
              if(dut_memory.FTM_C7SC.CHIE == 'b1) ftm_intf2.CH7 = 'b1;
            end
          end else if (dut_memory.FTM_C7SC.ELSA == 'b1 && dut_memory.FTM_C7SC.ELSB == 'b0) begin
            if(counter == dut_memory.FTM_C7V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH7 = 'b0;
              else if (dut_memory.if_down_count) ftm_intf2.CH7 = 'b1;
            end
          end else if (dut_memory.FTM_C7SC.ELSA == 'bx && dut_memory.FTM_C7SC.ELSB == 'b1) begin
            if(counter == dut_memory.FTM_C7V) begin
              if(dut_memory.if_up_count) ftm_intf2.CH7 = 'b1;
              else if (dut_memory.if_down_count) ftm_intf2.CH7 = 'b0;
            end
          end
        end
      end

    end	
  endtask

endclass : centeraligned 







