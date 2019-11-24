class ftm_sequence extends uvm_sequence #(seq_item);
 
 `uvm_object_utils(ftm_sequence)
 
 seq_item req;

 int iterate = 2; 
 
 function new(string name = "ftm_sequence");
   super.new(name);
 endfunction
 
 task body();
  begin
   req = seq_item::type_id::create("sequence_item");
   //<==========================Output Compare Mode start - Channel 4 and Channel 5 =====================>
            start_item(req);
	    req.reg_name=reg0_sc;//FTM_SC
	    req.wr_en =1;	
	    req.data = 32'h0000_0001;// ps = 1,
	    finish_item(req);
            
	   //uncomment for  UP-DOWN Counter
	    //start_item(req);
	    //req.reg_name=reg0_sc;//FTM_SC
	    //req.wr_en =1;	
	    //req.data = 32'h0000_0021;// ps = 1,
	    //finish_item(req);

            start_item(req);
	    req.reg_name=reg19_cntin;//FTM_CNTIN
	    req.data = 32'h0000_0000;// initinal value of counter =0,
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg2_mod;//FTM_MOD
	    req.data = 32'h0000_0004;// mod value of counter = 4,
	    finish_item(req);

          //Uncomment for FREE RUNNING counter
	    //start_item(req);
	    //req.reg_name=reg2_mod;//FTM_MOD
	    //req.data = 32'h0000_0000;// mod value of counter = 4,
	    //finish_item(req);


            start_item(req);
	    req.reg_name=reg21_mode;//FTM_MODE
	    req.data = 32'h0000_0001;// 
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg33_synconf;//FTM_SYNCONF
	    //req.data = 32'h0000_0180;// 
	    req.data = 32'h0000_0384;// 
	    finish_item(req);
                    
            start_item(req);
	    req.reg_name=reg21_mode;//FTM_MODE
	    req.data = 32'h0000_0000;// 
	    finish_item(req);
            
	    start_item(req);
	    req.reg_name=reg7_c4sc;//FTM_C0SC FOR OUTPUT COMPARE
	    req.data = 32'h0000_0010;// 
	    finish_item(req); 
	    
	    start_item(req);
	    req.reg_name=reg25_combine;//FTM_COMBINE FOR OUTPUT COMPARE
	    req.data = 32'h0000_0000;// 
	    finish_item(req);
            
	    repeat(2) begin
	    start_item(req);
	    req.reg_name=reg22_sync;//FTM_SYNC
	    req.data = 32'h0000_0083;// 
	    finish_item(req);
	    end
	    
	    repeat (1) begin 
	    start_item(req);
	    req.reg_name=reg22_sync;//FTM_SYNC
	    req.data = 32'h0000_0000;// 
	    finish_item(req);           
            end
            
	    start_item(req);
	    req.reg_name=reg7_c4sc;//FTM_C0SC FOR OUTPUT COMPARE
	    req.data = 32'h0000_0054;// 
	    finish_item(req);
	    
	    start_item(req);
	    req.reg_name=reg8_c5sc;//FTM_C1SC FOR OUTPUT COMPARE
	    req.data = 32'h0000_0054;// 
	    finish_item(req);
	    
	    start_item(req);
	    req.reg_name=reg15_c4v;//FTM_c0V
	    req.data = 32'h0000_0003;// 
	    finish_item(req);
	    
	    start_item(req);
	    req.reg_name=reg16_c5v;//FTM_C0V
	    req.data = 32'h0000_0003;// 
	    finish_item(req);
	    
	    repeat(200) begin
            start_item(req);
	    req.wr_en = 0'b0;
	    finish_item(req);
     	    end
	    //<==========================Output Compare Mode end - Channel 4 and Channel 5=====================>
	    //
	    //
	    //
	    //
	    //
	   // ////<==========================EPWM Mode start - Channel 0 and Channel 1=====================>
            start_item(req);
	    req.reg_name=reg0_sc;//FTM_SC
	    req.wr_en =1;	
	    req.data = 32'h0000_0001;// ps = 1,
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg19_cntin;//FTM_CNTIN
	    req.data = 32'h0000_0000;// initinal value of counter =0,
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg2_mod;//FTM_MOD
	    req.data = 32'h0000_0005;// mod value of counter = 4,
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg21_mode;//FTM_MODE
	    req.data = 32'h0000_0001;// 
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg33_synconf;//FTM_SYNCOF
	    req.data = 32'h0000_0180;// 
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg22_sync;//FTM_SYNC
	    req.data = 32'h0000_0083;// 
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg33_synconf;//FTM_SYNCOF
	    req.data = 32'h0000_0384;// 
	    finish_item(req);

	    start_item(req);
	    req.reg_name=reg31_qdctrl;//FTM_QDCTRL
	    req.data = 32'h0000_0000;
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg21_mode;//FTM_MODE
	    req.data = 32'h0000_0000;// 
	    finish_item(req);

       	    start_item(req);
	    req.reg_name=reg25_combine;//FTM_COMBINE 
	    req.data = 32'h0404_0400;
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg22_sync;//FTM_SYNC
	    req.data = 32'h0000_0080;// 
	    finish_item(req);

	    start_item(req);
	    req.reg_name=reg3_c0sc;//FTM_C0SC
	    req.data = 32'h0000_0028; // MSA=1; MSB=0; ELSB=1
	    finish_item(req);

	    start_item(req);
	    req.reg_name=reg4_c1sc;//FTM_C1SC
	    req.data = 32'h0000_0028; // MSA=1; MSB=0; ELSB=1;
	    finish_item(req);
	    
	    start_item(req);
	    req.reg_name=reg11_c0v;//FTM_C0V
	    req.data = 32'h0000_0001;
	    finish_item(req);
            
	    start_item(req);
	    req.reg_name=reg12_c1v;//FTM_C1V
	    req.data = 32'h0000_0001;
	    finish_item(req);

            repeat(100) begin
	    start_item(req);
	    req.reg_name=reg14_c3v;//FTM_C2V
	    req.wr_en =0;	
	    req.data = 32'h0000_1234 ;
	    finish_item(req);
            end

	   // //<==========================EPWM Mode end  - Channel 0 and Channel 1=====================>
	   //
	   //<============================CPWM Mode Start - Channel 2 and Channel 3====================>
	    start_item(req);
	    req.reg_name=reg0_sc;//FTM_SC
	    req.wr_en =1;	
	    req.data = 32'h0000_0021;// ps = 1,
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg19_cntin;//FTM_CNTIN
	    req.data = 32'h0000_0000;// initinal value of counter =0,
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg2_mod;//FTM_MOD
	    req.data = 32'h0000_0005;// mod value of counter = 4,
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg21_mode;//FTM_MODE
	    req.data = 32'h0000_0001;// 
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg33_synconf;//FTM_SYNCOF
	    req.data = 32'h0000_0180;// 
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg22_sync;//FTM_SYNC
	    req.data = 32'h0000_0083;// 
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg33_synconf;//FTM_SYNCOF
	    req.data = 32'h0000_0384;// 
	    finish_item(req);

	    start_item(req);
	    req.reg_name=reg31_qdctrl;//FTM_QDCTRL
	    req.data = 32'h0000_0000;
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg21_mode;//FTM_MODE
	    req.data = 32'h0000_0000;// 
	    finish_item(req);

       	    start_item(req);
	    req.reg_name=reg25_combine;//FTM_COMBINE 
	    req.data = 32'h0404_0004;
	    finish_item(req);

            start_item(req);
	    req.reg_name=reg22_sync;//FTM_SYNC
	    req.data = 32'h0000_0080;// 
	    finish_item(req);

	    start_item(req);
	    req.reg_name=reg5_c2sc;//FTM_C0SC
	    req.data = 32'h0000_0004; // MSA=1; MSB=0; ELSB=1
	    finish_item(req);

	    start_item(req);
	    req.reg_name=reg6_c3sc;//FTM_C1SC
	    req.data = 32'h0000_0004; // MSA=1; MSB=0; ELSB=1;
	    finish_item(req);
	    
	    start_item(req);
	    req.reg_name=reg13_c2v;//FTM_C0V
	    req.data = 32'h0000_0003;
	    finish_item(req);
            
	    start_item(req);
	    req.reg_name=reg14_c3v;//FTM_C1V
	    req.data = 32'h0000_0003;
	    finish_item(req);

            repeat(100) begin
	    start_item(req);
	    req.reg_name=reg14_c3v;//FTM_C2V
	    req.wr_en =0;	
	    req.data = 32'h0000_1234 ;
	    finish_item(req);
            end
	   //<============================CPWM Mode End - Channel 2 and Channel 3=====================>
           end
 endtask: body
 
endclass: ftm_sequence
