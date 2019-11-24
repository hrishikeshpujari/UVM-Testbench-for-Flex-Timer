typedef struct packed {
                        bit [0:23]RESERVED; 
                        bit TOF; 
                        bit TOIE; 
                        bit CPWMS; 
                        bit [0:1]CLKS; 
                        bit [0:2]PS;}ftm_sc;

typedef struct packed {
                        bit [0:15]RESERVED; 
                        bit COUNT;}ftm_cnt;

typedef struct packed {
                        bit [0:15]RESERVED; 
                        bit MOD;}ftm_mod;

typedef struct packed {
			bit [0:23]RESERVED; 
			bit CHF; 
			bit CHIE; 
			bit MSB; 
			bit MSA; 
			bit ELSB; 
			bit ELSA; 
			bit ICRST ; 
			bit DMA;}ftm_c0sc;

typedef struct packed {
			bit [0:23]RESERVED; 
			bit CHF; 
			bit CHIE; 
			bit MSB; 
			bit MSA; 
			bit ELSB; 
			bit ELSA; 
			bit ICRST ; 
			bit DMA;}ftm_c1sc;

typedef struct packed {
			bit [0:23]RESERVED; 
			bit CHF; 
			bit CHIE; 
			bit MSB; 
			bit MSA; 
			bit ELSB; 
			bit ELSA; 
			bit ICRST ; 
			bit DMA;}ftm_c2sc;

typedef struct packed {
			bit [0:23]RESERVED; 
			bit CHF; 
			bit CHIE; 
			bit MSB; 
			bit MSA; 
			bit ELSB; 
			bit ELSA; 
			bit ICRST ; 
			bit DMA;}ftm_c3sc;

typedef struct packed {
			bit [0:23]RESERVED; 
			bit CHF; 
			bit CHIE; 
			bit MSB; 
			bit MSA; 
			bit ELSB; 
			bit ELSA; 
			bit ICRST ; 
			bit DMA;}ftm_c4sc;

typedef struct packed {
			bit [0:23]RESERVED; 
			bit CHF; 
			bit CHIE; 
			bit MSB; 
			bit MSA; 
			bit ELSB; 
			bit ELSA; 
			bit ICRST ; 
			bit DMA;}ftm_c5sc;

typedef struct packed {
			bit [0:23]RESERVED; 
			bit CHF; 
			bit CHIE; 
			bit MSB; 
			bit MSA; 
			bit ELSB; 
			bit ELSA; 
			bit ICRST ; 
			bit DMA;}ftm_c6sc;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit CHF; 
			 bit CHIE; 
			 bit MSB; 
			 bit MSA; 
			 bit ELSB; 
			 bit ELSA; 
			 bit ICRST ; 
			 bit DMA;}ftm_c7sc;


typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c0v;
typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c1v;
typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c2v;
typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c3v;
typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c4v;
typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c5v;
typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c6v;
typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit VAL;}ftm_c7v;



typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit INIT;}ftm_cntin;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit CH7F; 
			 bit CH6F; 
			 bit CH5F; 
			 bit CH4F; 
			 bit CH3F; 
			 bit CH2F; 
			 bit CH1F ; 
			 bit CH0F;}ftm_status;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit [0:2]RESERVED1; 
			 bit CAPTEST; 
			 bit PWMSYNC; 
			 bit WPDIS; 
			 bit INIT; 
			 bit FTMEN;}ftm_mode;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit SWSYNC; 
			 bit TRIG2; 
			 bit TRIG1; 
			 bit TRIG0; 
			 bit SYNCHOM; 
			 bit REINIT; 
			 bit CNTMAX ; 
			 bit CNTMIN;}ftm_sync;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit CH7OI; 
			 bit CH6OI; 
			 bit CH5OI; 
			 bit CH4OI; 
			 bit CH3OI; 
			 bit CH2OI; 
			 bit CH1OI ; 
			 bit CH0OI;}ftm_outinit;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit CH7OM; 
			 bit CH6OM; 
			 bit CH5OM; 
			 bit CH4OM; 
			 bit CH3OM; 
			 bit CH2OM; 
			 bit CH1OM ; 
			 bit CH0OM;}ftm_outmask;

typedef struct packed {
			 bit RESERVED; 
			 bit RESERVED1; 
			 bit SYNCEN3; 
			 bit DTEN3; 
			 bit DECAP3; 
			 bit DECAPEN3; 
			 bit COMP3; 
			 bit COMBINE3 ; 
			 bit RESERVED2; 
			 bit RESERVED3; 
			 bit SYNCEN2; 
			 bit DTEN2; 
			 bit DECAP2;
			 bit DECAPEN2;
			 bit COMP2;
			 bit COMBINE2; 
			 bit RESERVED4; 
			 bit RESERVED5; 
			 bit SYNCEN1; 
			 bit DTEN1; 
			 bit DECAP1;
			 bit DECAPEN1;
			 bit COMP1;
			 bit COMBINE1; 
			 bit RESERVED6; 
			 bit RESERVED7; 
			 bit SYNCEN0; 
			 bit DTEN0; 
			 bit DECAP0;
			 bit DECAPEN0;
			 bit COMP0;
			 bit COMBINE0;}ftm_combine;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit [0:1]DTPS;
			 bit [0:5]DTVAL;}ftm_deadtime;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit TRIGF; 
			 bit INITTRIGEN; 
			 bit CH1TRIG; 
			 bit CH0TRIG; 
			 bit CH5TRIG; 
			 bit CH4TRIG; 
			 bit CH3TRIG ; 
			 bit CH2TRIG;}ftm_exttrig;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit POL7; 
			 bit POL6; 
			 bit POL5; 
			 bit POL4; 
			 bit POL3; 
			 bit POL2; 
			 bit POL1 ; 
			 bit POL0;}ftm_pol;

typedef struct packed {
			 bit [0:24]RESERVED; 
			 bit WPEN;
			 bit [0:5]RESERVED1;}ftm_fms;

typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit [0:3]CH3FVAL;
			 bit [0:3]CH2FVAL;
			 bit [0:3]CH1FVAL;
			 bit [0:3]CH0FVAL;}ftm_filter;

typedef struct packed {
			 bit [0:23]RESERVED; 
			 bit PHAFLTREN;
			 bit PHBFLTREN;
			 bit PHAPOL;
			 bit PHBPOL; 
			 bit QUADMODE;
			 bit QUADIR; 
			 bit TOFDIR; 
			 bit QUADEN;}ftm_qdctrl;

typedef struct packed {
			 bit [0:20]RESERVED; 
			 bit GTBEOUT; 
			 bit GTBEEN; 
			 bit RESERVED1; 
			 bit [0:1]BDMMODE; 
			 bit RESERVED2;
			 bit [0:4]NUMTOF;}ftm_conf;

typedef struct packed {
			 bit [0:10]RESERVED1;
			 bit HWSOC; 
			 bit HWINVC; 
			 bit HWOM; 
			 bit HWWRBUF;
			 bit HWRSTCNT; 
			 bit [0:2]RESERVED2; 
			 bit SWSOC; 
			 bit SWINVC; 
			 bit SWOM; 
			 bit SWWRBUF; 
			 bit SWRSTCNT; 
			 bit SYNCMODE;  
			 bit RESERVED3; 
			 bit SWOC;
			 bit INVC; 
			 bit RESERVED4; 
			 bit CNTINC; 
			 bit RESERVED; 
			 bit HWTRIGMODE;}ftm_synconf;

typedef struct packed {
			 bit [0:27]RESERVED; 
			 bit INV3EN;
			 bit INV2EN; 
			 bit INV1EN; 
			 bit INV0EN;}ftm_invctrl;

typedef struct packed {
			 bit [0:15]RESERVED; 
			 bit CH7OCV; 
			 bit CH6OCV; 
			 bit CH5OCV; 
			 bit CH4OCV; 
			 bit CH3OCV; 
			 bit CH2OCV; 
			 bit CH1OCV; 
			 bit CH0OCV; 
			 bit CH7OC;
			 bit CH6OC;
			 bit CH5OC;
			 bit CH4OC;
			 bit CH3OC;
			 bit CH2OC;
			 bit CH1OC;
			 bit CH0OC;}ftm_swoctrl;

typedef struct packed {
			 bit [0:21]RESERVED; 
			 bit LDOK; 
			 bit RESERVED1;
			 bit CH7SEL;
			 bit CH6SEL;
			 bit CH5SEL;
			 bit CH4SEL;
			 bit CH3SEL;
			 bit CH2SEL;
			 bit CH1SEL;
			 bit CH0SEL;}ftm_pwmload;

typedef enum {reg0_sc,
  	      reg1_cnt,
  	      reg2_mod,
  	      reg3_c0sc,
  	      reg4_c1sc,
  	      reg5_c2sc,
  	      reg6_c3sc,
  	      reg7_c4sc,
  	      reg8_c5sc,
  	      reg9_c6sc,
  	      reg10_c7sc,
  	      reg11_c0v,
  	      reg12_c1v,
  	      reg13_c2v,
  	      reg14_c3v,
  	      reg15_c4v,
  	      reg16_c5v,
  	      reg17_c6v,
  	      reg18_c7v,
  	      reg19_cntin,
  	      reg20_status,
  	      reg21_mode,
  	      reg22_sync,
  	      reg23_outinit,
  	      reg24_outmask,
  	      reg25_combine,
  	      reg26_deadtime,
  	      reg27_exttrig,
  	      reg28_pol,
  	      reg29_fms,
  	      reg30_filter,
  	      reg31_qdctrl,
  	      reg32_conf,
  	      reg33_synconf,
  	      reg34_invctrl,
  	      reg35_swoctrl,
 	      reg36_pwmload} reg_name_enum;


