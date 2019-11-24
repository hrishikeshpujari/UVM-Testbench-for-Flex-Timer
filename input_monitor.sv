/* UVM Input Monitor which is the working model of the Flex Timer and sends
* messages to Output Compare Mode, Edge Aligned Mode and Centre Aligned Mode
* Reference monitors */


class ftm_inp_monitor extends uvm_monitor; // input monitor

  `uvm_component_utils(ftm_inp_monitor)

  uvm_tlm_analysis_fifo #(dut_mem) inp_mon_fifo; // input monitor fifo
  uvm_analysis_port #(dut_mem) inp_monitor_port; // input monitor port 1 
  uvm_analysis_port #(dut_mem) inp_monitor_port1;// input monitor port 2
  uvm_analysis_port #(dut_mem) inp_monitor_port2;// input monitor port 3

  seq_item req; // sequence item handle 
  dut_mem dut_memory_space; // dut memory handle 
  sync_mem sync_memory_space; // sync memory handle 
  virtual ftm_if ftm_intf; // input interface handle
  integer clk_out = 0; 
  bit [0:6] clk_count = 0;
  bit [0:15] count; 
  logic up = 'b1;
  logic down = 'b0; 
  int loading_pt;
  int software_trigger;

  function new(string name = "ftm_inp_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    begin
      if (!uvm_config_db #(virtual ftm_if)::get(null, "*","ftm_if", this.ftm_intf)) begin
        `uvm_error("connect", "ftm_if not found")
      end
      inp_monitor_port = new("inp_monitor_port",this); // building ports
      inp_monitor_port1 = new("inp_monitor_port1",this);
      inp_monitor_port2 = new("inp_monitor_port2",this);
      req = seq_item::type_id::create("req",this); // building sequence item
      dut_memory_space = new(); // building dut memory space
      sync_memory_space = new(); // builing sync memory space 
    end
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge ftm_intf.clk);
      if(ftm_intf.wr_en) begin
        case(ftm_intf.reg_name) // Writing to dut memory on write enable
          reg0_sc: begin
            dut_memory_space.FTM_SC = ftm_intf.data;
          end	
          reg1_cnt: begin
            dut_memory_space.FTM_CNT = ftm_intf.data;
            count = sync_memory_space.FTM_CNTIN.INIT;
          end	    
          reg2_mod : begin
            dut_memory_space.FTM_MOD = ftm_intf.data;
          end	    
          reg3_c0sc : begin
            dut_memory_space.FTM_C0SC = ftm_intf.data;
          end	    
          reg4_c1sc : begin
            dut_memory_space.FTM_C1SC = ftm_intf.data;
          end	    
          reg5_c2sc : begin
            dut_memory_space.FTM_C2SC = ftm_intf.data;
          end	    
          reg6_c3sc : begin
            dut_memory_space.FTM_C3SC = ftm_intf.data;
          end
          reg7_c4sc : begin
            dut_memory_space.FTM_C4SC = ftm_intf.data;
          end	    
          reg8_c5sc : begin
            dut_memory_space.FTM_C5SC = ftm_intf.data;
          end	    
          reg9_c6sc : begin
            dut_memory_space.FTM_C6SC = ftm_intf.data;
          end
          reg10_c7sc : begin
            dut_memory_space.FTM_C7SC = ftm_intf.data;
          end
          reg11_c0v : begin
            dut_memory_space.FTM_C0V = ftm_intf.data;
          end	    
          reg12_c1v : begin
            dut_memory_space.FTM_C1V = ftm_intf.data;
          end	    
          reg13_c2v : begin
            dut_memory_space.FTM_C2V = ftm_intf.data;
          end	    
          reg14_c3v : begin
            dut_memory_space.FTM_C3V = ftm_intf.data;
          end
          reg15_c4v : begin
            dut_memory_space.FTM_C4V = ftm_intf.data;
          end	    
          reg16_c5v : begin
            dut_memory_space.FTM_C5V = ftm_intf.data;
          end	    
          reg17_c6v : begin
            dut_memory_space.FTM_C6V = ftm_intf.data;
          end
          reg18_c7v : begin
            dut_memory_space.FTM_C7V = ftm_intf.data;
          end
          reg19_cntin  : begin
            dut_memory_space.FTM_CNTIN = ftm_intf.data;
          end	    
          reg20_status : begin 
            dut_memory_space.FTM_STATUS = ftm_intf.data;
          end	    
          reg21_mode : begin
            dut_memory_space.FTM_MODE = ftm_intf.data;
          end	    
          reg22_sync : begin
            dut_memory_space.FTM_SYNC = ftm_intf.data;
          end	    
          reg23_outinit : begin
            dut_memory_space.FTM_OUTINIT = ftm_intf.data;
          end	    
          reg24_outmask : begin
            dut_memory_space.FTM_OUTMASK = ftm_intf.data;
          end	    
          reg25_combine : begin
            dut_memory_space.FTM_COMBINE = ftm_intf.data;
          end	    
          reg26_deadtime : begin
            dut_memory_space.FTM_DEADTIME = ftm_intf.data;
          end	    
          reg27_exttrig : begin
            dut_memory_space.FTM_EXTTRIG = ftm_intf.data;
          end	    
          reg28_pol : begin
            dut_memory_space.FTM_POL = ftm_intf.data;
          end	    
          reg29_fms : begin
            dut_memory_space.FTM_FMS = ftm_intf.data;
          end	    
          reg30_filter : begin
            dut_memory_space.FTM_FILTER = ftm_intf.data;
          end	    
          reg31_qdctrl : begin
            dut_memory_space.FTM_QDCTRL = ftm_intf.data;
          end	    
          reg32_conf : begin
            dut_memory_space.FTM_CONF = ftm_intf.data;
          end	    
          reg33_synconf : begin
            dut_memory_space.FTM_SYNCONF = ftm_intf.data;
          end	    
          reg34_invctrl : begin
            dut_memory_space.FTM_INVCTRL = ftm_intf.data;
          end	    
          reg35_swoctrl : begin
            dut_memory_space.FTM_SWOCTRL = ftm_intf.data;
          end	    
          reg36_pwmload : begin
            dut_memory_space.FTM_PWMLOAD = ftm_intf.data;
          end	    
        endcase
      end
      case(dut_memory_space.FTM_SC.PS) // Prescaler divide by 0, 2, 4, 8, 16, 32, 64, 128 
        3'b000: begin
          if(clk_count == 0) begin
            clk_out = 1;
            clk_count = 1;
          end else begin
            clk_out = 0;
            clk_count = 0;
          end
        end 
        3'b001: begin //divide by 2
          if(clk_count == 1) begin
            clk_out = 1;
            clk_count = 0;
          end else begin
            clk_out = 0;
            clk_count += 1;
          end
        end
        3'b010: begin //divide by 4
          if(clk_count == 2) begin
            clk_out = 1;
            clk_count = 0;
          end else begin
            clk_out = 0;
            clk_count += 1;
          end
        end
        3'b011: begin //divide by 8
          if(clk_count == 4) begin
            clk_out = 1;
            clk_count = 0;
          end else begin
            clk_out = 0;
            clk_count += 1;
          end
        end
        3'b100: begin //divide by 16
          if(clk_count == 8) begin
            clk_out = 1;
            clk_count = 0;
          end else begin
            clk_out = 0;
            clk_count += 1;
          end
        end
        3'b101: begin //divide by 32
          if(clk_count == 16) begin
            clk_out = 1;
            clk_count = 0;
          end else begin
            clk_out = 0;
            clk_count += 1;
          end
        end
        3'b110: begin //divide by 64
          if(clk_count == 32) begin
            clk_out = 1;
            clk_count += 0;
          end else begin
            clk_out = 0;
            clk_count += 1;
          end
        end
        3'b111: begin //divide by 128
          if(clk_count == 64) begin
            clk_out = 1;
            clk_count = 0;
          end else begin
            clk_out = 0;
            clk_count += 1;
          end
        end
      endcase
      if(software_trigger) software_trigger = 0; 
      if(dut_memory_space.FTM_SYNC.SWSYNC) software_trigger = 1;

      //<---------CNTIN PWM Sync start----------------->
      if(dut_memory_space.FTM_SYNCONF.SYNCMODE && dut_memory_space.FTM_MODE.FTMEN && dut_memory_space.FTM_SYNCONF.CNTINC) begin
        if(dut_memory_space.FTM_SYNCONF.SWWRBUF) begin
          if(dut_memory_space.FTM_SYNC.SWSYNC) begin
            if(!dut_memory_space.FTM_SYNCONF.SWRSTCNT) begin
              if(loading_pt && software_trigger) begin
                sync_memory_space.FTM_CNTIN = dut_memory_space.FTM_CNTIN;
                count = sync_memory_space.FTM_CNTIN;
                dut_memory_space.FTM_SYNC_CNTIN = sync_memory_space.FTM_CNTIN;
              end
            end else begin
              sync_memory_space.FTM_CNTIN = dut_memory_space.FTM_CNTIN;
              count = sync_memory_space.FTM_CNTIN;	
              dut_memory_space.FTM_SYNC_CNTIN = sync_memory_space.FTM_CNTIN;
              dut_memory_space.FTM_SYNC_SC = dut_memory_space.FTM_SC;
            end  
          end	  
        end
      end
      //<---------CNTIN PWM Sync end----------------->

      //<---------MOD PWM Sync start----------------->
      if(dut_memory_space.FTM_SYNCONF.SYNCMODE) begin
        if(dut_memory_space.FTM_SYNCONF.SWWRBUF) begin
          if(dut_memory_space.FTM_SYNC.SWSYNC) begin
            if(!dut_memory_space.FTM_SYNCONF.SWRSTCNT) begin
              if(loading_pt && software_trigger) begin
                sync_memory_space.FTM_MOD = dut_memory_space.FTM_MOD;
                //dut_memory_space.FTM_SYNC.SWSYNC = 'b0; 
                count = sync_memory_space.FTM_CNTIN;
                dut_memory_space.FTM_SYNC_MOD = sync_memory_space.FTM_MOD;
              end
            end else begin
              sync_memory_space.FTM_MOD = dut_memory_space.FTM_MOD;
              dut_memory_space.FTM_SYNC.SWSYNC = 'b0;  
              count = sync_memory_space.FTM_CNTIN;	
              dut_memory_space.FTM_SYNC_MOD = sync_memory_space.FTM_MOD;
            end  
          end	  
        end
      end
      //<---------MOD PWM Sync end----------------->

      //checking for output compare mode
      if (dut_memory_space.FTM_COMBINE.DECAPEN3 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE3 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C6SC.MSB == 'b0 && dut_memory_space.FTM_C6SC.MSA == 'b1) || (dut_memory_space.FTM_C7SC.MSB == 'b0 && dut_memory_space.FTM_C7SC.MSA == 'b1)) 
          ||(dut_memory_space.FTM_COMBINE.DECAPEN2 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE2 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C4SC.MSB == 'b0 && dut_memory_space.FTM_C4SC.MSA == 'b1)||(dut_memory_space.FTM_C5SC.MSB == 'b0 && dut_memory_space.FTM_C5SC.MSA == 'b1)))
          ||(dut_memory_space.FTM_COMBINE.DECAPEN1 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE1 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C2SC.MSB == 'b0 && dut_memory_space.FTM_C2SC.MSA == 'b1)||(dut_memory_space.FTM_C3SC.MSB == 'b0 && dut_memory_space.FTM_C3SC.MSA == 'b1))) 
          ||(dut_memory_space.FTM_COMBINE.DECAPEN0 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE0 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C0SC.MSB == 'b0 && dut_memory_space.FTM_C0SC.MSA == 'b1)||(dut_memory_space.FTM_C1SC.MSB == 'b0 && dut_memory_space.FTM_C1SC.MSA == 'b1)))) 
        begin
          inp_monitor_port1.write(dut_memory_space);
        end

      //checking for Edge Aligned PWM mode
      if (dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN3 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE3 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C6SC.MSB == 'b1) || (dut_memory_space.FTM_C7SC.MSB == 'b1)) 
          ||(dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN2 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE2 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C4SC.MSB == 'b1)||(dut_memory_space.FTM_C5SC.MSB == 'b1)))
          ||(dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN1 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE1 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C2SC.MSB == 'b1)||(dut_memory_space.FTM_C3SC.MSB == 'b1))) 
          ||(dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN0 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE0 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b0 && ((dut_memory_space.FTM_C0SC.MSB == 'b1)||(dut_memory_space.FTM_C1SC.MSB == 'b1)))) 
        begin
          inp_monitor_port.write(dut_memory_space);
        end

      //checking for Center Aligned PWM mode
      if ((dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN3 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE3 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b1) 
          ||(dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN2 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE2 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b1)
          ||(dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN1 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE1 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b1) 
          ||(dut_memory_space.FTM_QDCTRL.QUADEN == 'b0 && dut_memory_space.FTM_COMBINE.DECAPEN0 == 'b0 && dut_memory_space.FTM_COMBINE.COMBINE0 == 'b0 && dut_memory_space.FTM_SC.CPWMS == 'b1)) 
        begin
          inp_monitor_port2.write(dut_memory_space);
        end

      //UP counting
      if((dut_memory_space.FTM_QDCTRL.QUADEN == 'b0) && (dut_memory_space.FTM_SC.CPWMS == 'b0) && (sync_memory_space.FTM_CNTIN < sync_memory_space.FTM_MOD) ) begin
        if (clk_count == 0) 
          up_count();
      end
      //UP-DOWN counting
      else if((dut_memory_space.FTM_QDCTRL.QUADEN == 'b0) && (dut_memory_space.FTM_SC.CPWMS == 'b1) && (sync_memory_space.FTM_CNTIN < sync_memory_space.FTM_MOD)) begin
        if (clk_count == 0) 
          up_down_count();
      end
      //free running counting
      else if(((dut_memory_space.FTM_MODE.FTMEN == 'b0) && ((sync_memory_space.FTM_MOD == 'h0) || (sync_memory_space.FTM_MOD == 'hf))) || ((dut_memory_space.FTM_MODE.FTMEN == 'b1) && (sync_memory_space.FTM_CNTIN == 'h0) && (sync_memory_space.FTM_MOD == 'hf) && (dut_memory_space.FTM_QDCTRL.QUADEN == 'b0) && (dut_memory_space.FTM_SC.CPWMS == 'b0))) begin
        if (clk_count == 0) 
          free_count();
      end


    end
  endtask : run_phase


  task up_count;
    if((count <= sync_memory_space.FTM_MOD) && (count >= sync_memory_space.FTM_CNTIN)) begin
      count += 1;   
      dut_memory_space.if_up_count = 'b1; 
      dut_memory_space.if_down_count = 'b0; 
    end
    if(count == sync_memory_space.FTM_MOD + 1) begin      	    
      count = sync_memory_space.FTM_CNTIN;
      dut_memory_space.FTM_SC.TOF = 1'b1;
    end 
    if (sync_memory_space.FTM_CNTIN == sync_memory_space.FTM_MOD) begin
      dut_memory_space.FTM_SC.TOF = 1'b1;
      count = sync_memory_space.FTM_MOD;
    end 
    if((sync_memory_space.FTM_CNTIN == 'b0) &&  (sync_memory_space.FTM_MOD == 'b0) && (dut_memory_space.FTM_MODE.FTMEN == 'b1)) begin
      count = 'b0;
    end
    //<---------LOADING POINT start------------------>
    if((dut_memory_space.FTM_SYNC.CNTMAX == 'b1 || dut_memory_space.FTM_SYNC.CNTMIN == 'b1) && count == sync_memory_space.FTM_CNTIN.INIT) loading_pt = 1; 
    else loading_pt = 0; 
    //<---------LOADING POINT end------------------>
    dut_memory_space.count = count;
  endtask : up_count

  task up_down_count;
    if(((count <= sync_memory_space.FTM_MOD) && (count >= sync_memory_space.FTM_CNTIN)) && up == 1 && down == 0) begin
      count += 1;   
      dut_memory_space.if_up_count = 'b1; 
      dut_memory_space.if_down_count = 'b0; 
    end
    if(count == sync_memory_space.FTM_MOD + 1) begin
      up = 0;
      dut_memory_space.FTM_SC.TOF = 1'b1;
    end    
    if(count == sync_memory_space.FTM_CNTIN) begin
      up = 1;
    end    
    if (count != sync_memory_space.FTM_CNTIN && up == 0) begin
      count = count - 1;
      dut_memory_space.if_up_count = 'b0; 
      dut_memory_space.if_down_count = 'b1; 
    end
    //<---------LOADING POINT start------------------>
    if ((dut_memory_space.FTM_SYNC.CNTMAX == 'b1) && (count == sync_memory_space.FTM_MOD.MOD - 'h1)) loading_pt = 1; 
    else loading_pt = 0; 
    if ((dut_memory_space.FTM_SYNC.CNTMIN == 'b1) && (count == sync_memory_space.FTM_CNTIN.INIT + 'h1)) loading_pt = 1;
    else loading_pt = 0;
    //<---------LOADING POINT end------------------>

    dut_memory_space.count = count;
  endtask

  task free_count;
    //count = 'h0;
    if(count < 16'hffff + 1) begin
      count = count + 1;
    end
    if(count >= 16'hffff) begin 
      count = 16'h0; 
      dut_memory_space.FTM_SC.TOF = 1'b1;
    end
  endtask
endclass : ftm_inp_monitor
