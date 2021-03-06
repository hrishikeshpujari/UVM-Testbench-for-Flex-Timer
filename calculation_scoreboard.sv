
/* Scoreboard for calculation of clock period from the waveforms generated by
* the DUT.*/ 

class calculation_scoreboard extends uvm_scoreboard; // Clock Period Calculation Scoreboard

  `uvm_component_utils(calculation_scoreboard)

  uvm_tlm_analysis_fifo #(seq_item) calculation_scoreboard_port;
  uvm_analysis_port #(seq_item) port;

  seq_item req;


  bit [0:32] time1,time2,time3,time4,time5,time6,time7,time8,time9,time10,time11,time12,time13,time14,time15;
  bit [0:32] old_time1,old_time2,old_time3,old_time4,old_time5,old_time6,old_time7,old_time8,old_time9,old_time10,old_time11,old_time12,old_time13,old_time14,old_time15;
  bit [0:32] clk_period_CH0,clk_period_CH1,clk_period_CH2,clk_period_CH3,clk_period_CH4,clk_period_CH5,clk_period_CH6,clk_period_CH7;
  bit [0:32] on_time,on_time1,on_time2,on_time3,on_time4,on_time5,on_time6,on_time7;

  function new(string name = "calculation_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    begin
      calculation_scoreboard_port = new("calculation_scoreboard_port",this);
      req = seq_item::type_id::create("req",this);
      port = new("port",this);
    end
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    begin
      calculation_scoreboard_port.get(req);
      fork //for n = 0 and 1
        forever begin
          //calculation_scoreboard_port.get(req);
          @(posedge req.CH0) begin
            time1 = $time;
            if(time1 && old_time1)clk_period_CH0 =time1-old_time1;
            old_time1 = time1;
            $display("<=========clk_period_CH0===========>",clk_period_CH0);
          end
          @(negedge req.CH0) begin
            time2 = $time;
            if(time2 && old_time2) on_time = time2 - time1;
            old_time2 = time2;
          end 
          req.clk_period_CH0 = clk_period_CH0;
          port.write(req);
        end
        forever begin
          //calculation_scoreboard_port.get(req);
          @(posedge req.CH1) begin
            time3 = $time;
            if(time3 && old_time3)clk_period_CH1 =time1-old_time3;
            old_time3 = time3;
            $display("<=========clk_period_CH1===========>",clk_period_CH1);
          end
          @(negedge req.CH1) begin
            time4 = $time;
            if(time4 && old_time4) on_time1 = time4 - time3;
            old_time4 = time4;
          end 
          req.clk_period_CH1 = clk_period_CH1;
          port.write(req);
        end
      join_none
      fork //for n = 2 and 3
        forever begin
          //calculation_scoreboard_port.get(req);
          @(posedge req.CH2) begin
            time5 = $time;
            if(time5 && old_time5)clk_period_CH2 =time5-old_time5;
            old_time5 = time5;
            $display("<=========clk_period_CH2===========>",clk_period_CH2,$time);
          end
          @(negedge req.CH2) begin
            time6 = $time;
            if(time6 && old_time6) on_time2 = time6 - time5;
            old_time6 = time6;
          end 
          req.clk_period_CH2 = clk_period_CH2;
          port.write(req);
        end
        forever begin
          //calculation_scoreboard_port.get(req);
          @(posedge req.CH3) begin
            time7 = $time;
            if(time7 && old_time7)clk_period_CH3 =time7-old_time7;
            old_time7 = time7;
            $display("<=========clk_period_CH3===========>",clk_period_CH3);
          end
          @(negedge req.CH3) begin
            time8 = $time;
            if(time8 && old_time8) on_time3 = time8 - time7;
            old_time8 = time8;
          end 
          req.clk_period_CH3 = clk_period_CH3;
          port.write(req);
        end
      join_none
      fork //for n = 4 and 5
        forever begin
          @(posedge req.CH4) begin
            time9 = $time;
            if(time8 && old_time8)clk_period_CH4 =time8-old_time8;
            old_time8 = time8;
            $display("<=========clk_period_CH4===========>",clk_period_CH4);
          end
          @(negedge req.CH4) begin
            time9 = $time;
            if(time9 && old_time9) on_time4 = time9 - time8;
            old_time9 = time9;
          end 
          req.clk_period_CH4 = clk_period_CH4;
          port.write(req);
        end
        forever begin
          //calculation_scoreboard_port.get(req);
          @(posedge req.CH5) begin
            time10 = $time;
            if(time10 && old_time10)clk_period_CH5 =time10-old_time10;
            old_time10 = time10;
            $display("<=========clk_period_CH5===========>",clk_period_CH5);
          end
          @(negedge req.CH5) begin
            time11 = $time;
            if(time11 && old_time11) on_time5 = time11 - time10;
            old_time11 = time11;
          end 
          req.clk_period_CH5 = clk_period_CH5;
          port.write(req);
        end
      join_none
      fork //for n = 6 and 7
        forever begin
          //calculation_scoreboard_port.get(req);
          @(posedge req.CH6) begin
            time12 = $time;
            if(time12 && old_time12)clk_period_CH6 =time12-old_time12;
            old_time12 = time12;
            $display("<=========clk_period_CH6===========>",clk_period_CH6);
          end
          @(negedge req.CH6) begin
            time13 = $time;
            if(time13 && old_time13) on_time6 = time13 - time12;
            old_time6 = time6;
          end 
          req.clk_period_CH6 = clk_period_CH6;
          port.write(req);
        end
        forever begin
          //calculation_scoreboard_port.get(req);
          @(posedge req.CH7) begin
            time14 = $time;
            if(time14 && old_time14)clk_period_CH7 =time14-old_time14;
            old_time14 = time14;
            $display("<=========clk_period_CH7===========>",clk_period_CH7);
          end
          @(negedge req.CH7) begin
            time15 = $time;
            if(time15 && old_time15) on_time7 = time15 - time14;
            old_time15 = time15;
          end 
          req.clk_period_CH7 = clk_period_CH7;
          port.write(req);
        end
      join_none

    end
  endtask : run_phase

endclass : calculation_scoreboard
