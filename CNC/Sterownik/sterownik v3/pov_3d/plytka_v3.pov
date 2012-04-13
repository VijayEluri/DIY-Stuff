//POVRay-File created by 3d41.ulp v20110101
//C:/Dev/Work/DIY/CNC/Drivers/CNC_Soki/sterownik v3/plytka_v3.brd
//2012-04-12 21:17:55

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 120;
#local cam_y = 195;
#local cam_z = -50;
#local cam_a = 25;
#local cam_look_x = 0;
#local cam_look_y = 0;
#local cam_look_z = -3;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 235;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 20;
#local lgt1_pos_y = 41;
#local lgt1_pos_z = 39;
#local lgt1_intense = 0.755774;
#local lgt2_pos_x = -20;
#local lgt2_pos_y = 41;
#local lgt2_pos_z = 39;
#local lgt2_intense = 0.755774;
#local lgt3_pos_x = 20;
#local lgt3_pos_y = 41;
#local lgt3_pos_z = -26;
#local lgt3_intense = 0.755774;
#local lgt4_pos_x = -20;
#local lgt4_pos_y = 41;
#local lgt4_pos_z = -26;
#local lgt4_intense = 0.755774;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 53.010000;
#declare pcb_y_size = 73.650000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(629);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-26.505000,0,-36.825000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro PLYTKA_V3(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<-0.635000,0.000000><52.375000,0.000000>
<52.375000,0.000000><52.375000,73.650000>
<52.375000,73.650000><-0.635000,73.650000>
<-0.635000,73.650000><-0.635000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
cylinder{<7.620000,1,84.201000><7.620000,-5,84.201000>1.651000 texture{col_hls}}
cylinder{<20.320000,1,84.201000><20.320000,-5,84.201000>1.651000 texture{col_hls}}
cylinder{<33.020000,1,84.201000><33.020000,-5,84.201000>1.651000 texture{col_hls}}
cylinder{<45.720000,1,84.201000><45.720000,-5,84.201000>1.651000 texture{col_hls}}
//Holes(real)/Board
cylinder{<1.905000,1,2.540000><1.905000,-5,2.540000>1.400000 texture{col_hls}}
cylinder{<50.165000,1,2.540000><50.165000,-5,2.540000>1.400000 texture{col_hls}}
cylinder{<49.530000,1,40.005000><49.530000,-5,40.005000>1.400000 texture{col_hls}}
cylinder{<2.540000,1,40.005000><2.540000,-5,40.005000>1.400000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_5MM_10MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<8.125000,0.000000,6.875000>}#end		//Elko 5mm Pitch, 10mm  Diameter, 16mm High C1  E5-10,5
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<10.795000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D1 1N4148DO35-7 DO35-7
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.335000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D2 1N4148DO35-7 DO35-7
#ifndef(pack_D3) #declare global_pack_D3=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.145000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D3 1N4148DO35-7 DO35-7
#ifndef(pack_D4) #declare global_pack_D4=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.685000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D4 1N4148DO35-7 DO35-7
#ifndef(pack_D5) #declare global_pack_D5=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.225000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D5 1N4148DO35-7 DO35-7
#ifndef(pack_D6) #declare global_pack_D6=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<26.035000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D6 1N4148DO35-7 DO35-7
#ifndef(pack_D7) #declare global_pack_D7=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<28.575000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D7 1N4148DO35-7 DO35-7
#ifndef(pack_D8) #declare global_pack_D8=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.115000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D8 1N4148DO35-7 DO35-7
#ifndef(pack_D9) #declare global_pack_D9=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<34.925000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D9 1N4148DO35-7 DO35-7
#ifndef(pack_D10) #declare global_pack_D10=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<37.465000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D10 1N4148DO35-7 DO35-7
#ifndef(pack_D11) #declare global_pack_D11=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<40.005000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D11 1N4148DO35-7 DO35-7
#ifndef(pack_D12) #declare global_pack_D12=yes; object {DIODE_DIS_DO35_076MM_H("1N4148DO35-7",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<42.545000,0.000000,41.910000>}#end		//Diode DO35 7mm hor. D12 1N4148DO35-7 DO35-7
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_DIS_DIP16("HEF4516BP","PHILIPS",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.765000,0.000000,6.350000>translate<0,3.000000,0> }#end		//DIP16 IC1 4516N DIL16
#ifndef(pack_IC1) object{SOCKET_DIP16()rotate<0,0.000000,0> rotate<0,0,0> translate<24.765000,0.000000,6.350000>}#end					//IC-Sockel 16Pin IC1 4516N
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {IC_DIS_DIP16("CD74HC238E","PHILIPS",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.765000,0.000000,26.670000>translate<0,3.000000,0> }#end		//DIP16 IC3 74AC138N DIL16
#ifndef(pack_IC3) object{SOCKET_DIP16()rotate<0,0.000000,0> rotate<0,0,0> translate<24.765000,0.000000,26.670000>}#end					//IC-Sockel 16Pin IC3 74AC138N
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.445000,0.000000,16.510000>}#end		//Jumper 2,54mm Grid 3Pin 1Row (jumper.lib) JP2  JP2
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X1J(0,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<4.445000,0.000000,22.860000>}#end		//Jumper 2,54mm Grid 2Pin 1Row (jumper.lib) JP3  JP1
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {TR_TO220_3_H("BUZ11",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<7.620000,0.000000,73.025000>}#end		//TO220 horizontal straight leads Q1 BUZ11 TO220
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {TR_TO220_3_H("BUZ11",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,73.025000>}#end		//TO220 horizontal straight leads Q2 BUZ11 TO220
#ifndef(pack_Q3) #declare global_pack_Q3=yes; object {TR_TO220_3_H("BUZ11",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<33.020000,0.000000,73.025000>}#end		//TO220 horizontal straight leads Q3 BUZ11 TO220
#ifndef(pack_Q4) #declare global_pack_Q4=yes; object {TR_TO220_3_H("BUZ11",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,73.025000>}#end		//TO220 horizontal straight leads Q4 BUZ11 TO220
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_15MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.780000,0.000000,55.245000>}#end		//Discrete Resistor 0,3W 15MM Grid R1  0207/15
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_15MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<5.080000,0.000000,55.245000>}#end		//Discrete Resistor 0,3W 15MM Grid R2  0207/15
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_CERAMIC_AXIAL_PW1_228MM_V("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<10.477500,0.000000,54.927500>}#end		//5W ceramic resistor R3  KH208R-8
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_CERAMIC_AXIAL_PW1_228MM_V("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<23.177500,0.000000,54.927500>}#end		//5W ceramic resistor R4  KH208R-8
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_15MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<30.480000,0.000000,55.245000>}#end		//Discrete Resistor 0,3W 15MM Grid R5  0207/15
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_CERAMIC_AXIAL_PW1_228MM_V("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<35.877500,0.000000,54.927500>}#end		//5W ceramic resistor R6  KH208R-8
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_15MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<43.180000,0.000000,56.515000>}#end		//Discrete Resistor 0,3W 15MM Grid R7  0207/15
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_CERAMIC_AXIAL_PW1_228MM_V("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<48.577500,0.000000,54.927500>}#end		//5W ceramic resistor R8  KH208R-8
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<1.905000,0.000000,59.055000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R9  0207/7
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<14.922500,0.000000,59.055000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R10  0207/7
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.622500,0.000000,59.055000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R11  0207/7
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<40.005000,0.000000,59.055000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R12  0207/7
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO92_G("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<8.890000,0.000000,61.595000>}#end		//TO92 bend vertical T1 BC337 TO92
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO92_G("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<21.590000,0.000000,61.595000>}#end		//TO92 bend vertical T2 BC337 TO92
#ifndef(pack_T3) #declare global_pack_T3=yes; object {TR_TO92_G("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<34.290000,0.000000,61.595000>}#end		//TO92 bend vertical T3 BC337 TO92
#ifndef(pack_T4) #declare global_pack_T4=yes; object {TR_TO92_G("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<46.990000,0.000000,61.595000>}#end		//TO92 bend vertical T4 BC337 TO92
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<5.585000,0,6.875000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<10.665000,0,6.875000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<10.795000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<10.795000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<13.335000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<13.335000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<17.145000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<17.145000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<19.685000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<19.685000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<22.225000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<22.225000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<26.035000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<26.035000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<28.575000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<28.575000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<31.115000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<31.115000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<34.925000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<34.925000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<37.465000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<37.465000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<40.005000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<40.005000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<42.545000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<42.545000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<15.875000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<18.415000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.955000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.495000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<26.035000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.575000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<31.115000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.655000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.655000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<31.115000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.575000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<26.035000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.495000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.955000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<18.415000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<15.875000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<15.875000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<18.415000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.955000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.495000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<26.035000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.575000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<31.115000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.655000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.655000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<31.115000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.575000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<26.035000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.495000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.955000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<18.415000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<15.875000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<4.445000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<4.445000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<4.445000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<4.445000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<4.445000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<5.080000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<7.620000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<10.160000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<17.780000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.320000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<22.860000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.480000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.020000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<35.560000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_Q4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,66.675000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,47.625000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<5.080000,0,47.625000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<5.080000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.477500,0,52.387500> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.477500,0,57.467500> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<23.177500,0,52.387500> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<23.177500,0,57.467500> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,47.625000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.877500,0,52.387500> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.877500,0,57.467500> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,48.895000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,64.135000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.577500,0,52.387500> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.577500,0,57.467500> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<1.905000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<1.905000,0,55.245000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<14.922500,0,62.865000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<14.922500,0,55.245000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.622500,0,62.865000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.622500,0,55.245000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<40.005000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<40.005000,0,55.245000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,60.325000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<10.795000,0,61.595000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<21.590000,0,60.325000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<23.495000,0,61.595000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<21.590000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,60.325000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<36.195000,0,61.595000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,62.865000> texture{col_thl}}
#ifndef(global_pack_T4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<46.990000,0,60.325000> texture{col_thl}}
#ifndef(global_pack_T4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.895000,0,61.595000> texture{col_thl}}
#ifndef(global_pack_T4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<46.990000,0,62.865000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<18.415000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<28.575000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<15.875000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<36.195000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<13.335000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<31.115000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<15.875000,0,17.780000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<28.575000,0,17.780000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<31.115000,0,17.780000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<41.275000,0,17.780000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<11.430000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<11.430000,0,30.480000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<1.270000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<1.270000,-1.535000,10.160000>}
box{<0,0,-0.889000><11.430000,0.035000,0.889000> rotate<0,-90.000000,0> translate<1.270000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.762500,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.762500,-1.535000,55.245000>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,-90.000000,0> translate<4.762500,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.080000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.080000,-1.535000,47.625000>}
box{<0,0,-0.508000><0.635000,0.035000,0.508000> rotate<0,90.000000,0> translate<5.080000,-1.535000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,47.942500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<5.080000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.905000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,62.865000>}
box{<0,0,-0.711200><3.175000,0.035000,0.711200> rotate<0,0.000000,0> translate<1.905000,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,66.675000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,90.000000,0> translate<5.080000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<4.445000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<5.715000,-1.535000,12.700000>}
box{<0,0,-0.889000><1.796051,0.035000,0.889000> rotate<0,44.997030,0> translate<4.445000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,44.767500>}
box{<0,0,-0.711200><3.143090,0.035000,0.711200> rotate<0,44.997030,0> translate<5.080000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<7.620000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<7.620000,-1.535000,70.485000>}
box{<0,0,-0.889000><3.810000,0.035000,0.889000> rotate<0,90.000000,0> translate<7.620000,-1.535000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<4.445000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.255000,-1.535000,16.510000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,0.000000,0> translate<4.445000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.762500,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<8.890000,-1.535000,60.325000>}
box{<0,0,-0.711200><4.127500,0.035000,0.711200> rotate<0,0.000000,0> translate<4.762500,-1.535000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<8.890000,-1.535000,62.865000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<5.080000,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.255000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<9.525000,-1.535000,15.240000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<8.255000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<4.445000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<9.525000,-1.535000,19.050000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,0.000000,0> translate<4.445000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.000000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.000000,-1.535000,6.250000>}
box{<0,0,-0.711200><1.250000,0.035000,0.711200> rotate<0,90.000000,0> translate<10.000000,-1.535000,6.250000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<9.842500,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<10.160000,-1.535000,66.675000>}
box{<0,0,-0.838200><0.317500,0.035000,0.838200> rotate<0,0.000000,0> translate<9.842500,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<9.525000,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<10.477500,-1.535000,57.467500>}
box{<0,0,-0.838200><0.952500,0.035000,0.838200> rotate<0,0.000000,0> translate<9.525000,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.000000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.625000,-1.535000,5.000000>}
box{<0,0,-0.711200><0.625000,0.035000,0.711200> rotate<0,0.000000,0> translate<10.000000,-1.535000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.000000,-1.535000,6.250000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.625000,-1.535000,6.875000>}
box{<0,0,-0.711200><0.883883,0.035000,0.711200> rotate<0,-44.997030,0> translate<10.000000,-1.535000,6.250000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.625000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.625000,-1.535000,6.875000>}
box{<0,0,-0.711200><1.875000,0.035000,0.711200> rotate<0,90.000000,0> translate<10.625000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<9.525000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.795000,-1.535000,17.780000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<9.525000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,34.925000>}
box{<0,0,-0.508000><3.175000,0.035000,0.508000> rotate<0,-90.000000,0> translate<10.795000,-1.535000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,38.100000>}
box{<0,0,-0.711200><3.492500,0.035000,0.711200> rotate<0,90.000000,0> translate<10.795000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,39.052500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<10.795000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,42.545000>}
box{<0,0,-0.508000><3.175000,0.035000,0.508000> rotate<0,-90.000000,0> translate<10.795000,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,44.767500>}
box{<0,0,-0.711200><2.222500,0.035000,0.711200> rotate<0,90.000000,0> translate<10.795000,-1.535000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,45.720000>}
box{<0,0,-0.508000><0.317500,0.035000,0.508000> rotate<0,-90.000000,0> translate<10.795000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<6.985000,-1.535000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,46.037500>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<6.985000,-1.535000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,46.037500>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,-90.000000,0> translate<10.795000,-1.535000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,46.672500>}
box{<0,0,-0.508000><0.317500,0.035000,0.508000> rotate<0,-90.000000,0> translate<10.795000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.080000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,46.990000>}
box{<0,0,-0.508000><5.715000,0.035000,0.508000> rotate<0,0.000000,0> translate<5.080000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.112500,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.112500,-1.535000,31.115000>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<11.112500,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.112500,-1.535000,45.085000>}
box{<0,0,-0.711200><0.449013,0.035000,0.711200> rotate<0,-44.997030,0> translate<10.795000,-1.535000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<1.270000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<11.430000,-1.535000,21.590000>}
box{<0,0,-0.889000><10.160000,0.035000,0.889000> rotate<0,0.000000,0> translate<1.270000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<4.445000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<11.430000,-1.535000,21.590000>}
box{<0,0,-0.889000><6.985000,0.035000,0.889000> rotate<0,0.000000,0> translate<4.445000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.430000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.430000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,90.000000,0> translate<11.430000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.747500,-1.535000,33.655000>}
box{<0,0,-0.711200><1.347038,0.035000,0.711200> rotate<0,44.997030,0> translate<10.795000,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.065000,-1.535000,33.655000>}
box{<0,0,-0.508000><1.796051,0.035000,0.508000> rotate<0,44.997030,0> translate<10.795000,-1.535000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<10.477500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<12.382500,-1.535000,57.467500>}
box{<0,0,-0.838200><1.905000,0.035000,0.838200> rotate<0,0.000000,0> translate<10.477500,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<10.795000,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<12.382500,-1.535000,61.595000>}
box{<0,0,-0.838200><1.587500,0.035000,0.838200> rotate<0,0.000000,0> translate<10.795000,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<12.382500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<12.382500,-1.535000,61.595000>}
box{<0,0,-0.838200><4.127500,0.035000,0.838200> rotate<0,90.000000,0> translate<12.382500,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<10.160000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<12.382500,-1.535000,66.675000>}
box{<0,0,-0.838200><2.222500,0.035000,0.838200> rotate<0,0.000000,0> translate<10.160000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<12.382500,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<12.382500,-1.535000,66.675000>}
box{<0,0,-0.838200><5.080000,0.035000,0.838200> rotate<0,90.000000,0> translate<12.382500,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.625000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<12.500000,-1.535000,5.000000>}
box{<0,0,-0.711200><1.875000,0.035000,0.711200> rotate<0,0.000000,0> translate<10.625000,-1.535000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<5.715000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<13.335000,-1.535000,12.700000>}
box{<0,0,-0.889000><7.620000,0.035000,0.889000> rotate<0,0.000000,0> translate<5.715000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,39.052500>}
box{<0,0,-0.711200><1.905000,0.035000,0.711200> rotate<0,90.000000,0> translate<13.335000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,44.767500>}
box{<0,0,-0.711200><6.032500,0.035000,0.711200> rotate<0,0.000000,0> translate<7.302500,-1.535000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,45.085000>}
box{<0,0,-0.711200><1.587500,0.035000,0.711200> rotate<0,-90.000000,0> translate<13.335000,-1.535000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.795000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.335000,-1.535000,45.720000>}
box{<0,0,-0.508000><2.540000,0.035000,0.508000> rotate<0,0.000000,0> translate<10.795000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,46.672500>}
box{<0,0,-0.711200><2.540000,0.035000,0.711200> rotate<0,0.000000,0> translate<10.795000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,46.672500>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,-90.000000,0> translate<13.335000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.080000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,47.942500>}
box{<0,0,-0.711200><8.255000,0.035000,0.711200> rotate<0,0.000000,0> translate<5.080000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<13.335000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<13.970000,-1.535000,12.700000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,0.000000,0> translate<13.335000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<12.500000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<14.375000,-1.535000,5.000000>}
box{<0,0,-0.711200><1.875000,0.035000,0.711200> rotate<0,0.000000,0> translate<12.500000,-1.535000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<9.525000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<14.605000,-1.535000,15.240000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,0.000000,0> translate<9.525000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.250000,-1.535000,5.625000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.000000,-1.535000,5.625000>}
box{<0,0,-0.711200><3.750000,0.035000,0.711200> rotate<0,0.000000,0> translate<11.250000,-1.535000,5.625000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.000000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.000000,-1.535000,5.625000>}
box{<0,0,-0.711200><4.375000,0.035000,0.711200> rotate<0,90.000000,0> translate<15.000000,-1.535000,5.625000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.795000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.240000,-1.535000,17.780000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,0.000000,0> translate<10.795000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.000000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.625000,-1.535000,1.250000>}
box{<0,0,-0.711200><0.625000,0.035000,0.711200> rotate<0,0.000000,0> translate<15.000000,-1.535000,1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,1.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,1.250000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,-90.000000,0> translate<15.625000,-1.535000,1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.625000,-1.535000,3.750000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.625000,-1.535000,1.250000>}
box{<0,0,-0.711200><2.500000,0.035000,0.711200> rotate<0,-90.000000,0> translate<15.625000,-1.535000,1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,3.750000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,1.875000>}
box{<0,0,-0.635000><1.875000,0.035000,0.635000> rotate<0,-90.000000,0> translate<15.625000,-1.535000,1.875000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<14.375000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.625000,-1.535000,3.750000>}
box{<0,0,-0.711200><1.767767,0.035000,0.711200> rotate<0,44.997030,0> translate<14.375000,-1.535000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,3.750000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,6.875000>}
box{<0,0,-0.635000><3.125000,0.035000,0.635000> rotate<0,90.000000,0> translate<15.625000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.875000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.875000,-1.535000,2.540000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,-90.000000,0> translate<15.875000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,6.350000>}
box{<0,0,-0.711200><0.525000,0.035000,0.711200> rotate<0,-90.000000,0> translate<15.875000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.665000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,6.875000>}
box{<0,0,-0.711200><5.210000,0.035000,0.711200> rotate<0,0.000000,0> translate<10.665000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<1.270000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<15.875000,-1.535000,10.160000>}
box{<0,0,-0.889000><14.605000,0.035000,0.889000> rotate<0,0.000000,0> translate<1.270000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<15.240000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<15.875000,-1.535000,17.780000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,0.000000,0> translate<15.240000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<15.240000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<15.875000,-1.535000,20.320000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,0.000000,0> translate<15.240000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.875000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.875000,-1.535000,22.860000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,90.000000,0> translate<15.875000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,29.527500>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,-90.000000,0> translate<15.875000,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.112500,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,30.162500>}
box{<0,0,-0.711200><4.762500,0.035000,0.711200> rotate<0,0.000000,0> translate<11.112500,-1.535000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<11.430000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<15.875000,-1.535000,30.480000>}
box{<0,0,-0.889000><4.445000,0.035000,0.889000> rotate<0,0.000000,0> translate<11.430000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.112500,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,31.115000>}
box{<0,0,-0.711200><4.762500,0.035000,0.711200> rotate<0,0.000000,0> translate<11.112500,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,31.115000>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<15.875000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,1.250000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,0.000000,0> translate<15.625000,-1.535000,1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,1.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,1.875000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,0.000000,0> translate<15.625000,-1.535000,1.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,1.875000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,90.000000,0> translate<16.250000,-1.535000,1.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,1.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,4.375000>}
box{<0,0,-0.635000><2.500000,0.035000,0.635000> rotate<0,90.000000,0> translate<16.250000,-1.535000,4.375000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,4.375000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,5.000000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,90.000000,0> translate<16.250000,-1.535000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<11.747500,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<16.510000,-1.535000,33.655000>}
box{<0,0,-0.711200><4.762500,0.035000,0.711200> rotate<0,0.000000,0> translate<11.747500,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.065000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<16.510000,-1.535000,33.655000>}
box{<0,0,-0.508000><4.445000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.065000,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<14.605000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.145000,-1.535000,12.700000>}
box{<0,0,-0.635000><3.592102,0.035000,0.635000> rotate<0,44.997030,0> translate<14.605000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,37.147500>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<13.335000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,37.147500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<17.145000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,37.465000>}
box{<0,0,-0.711200><0.317500,0.035000,0.711200> rotate<0,90.000000,0> translate<17.145000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.335000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.145000,-1.535000,38.100000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,0.000000,0> translate<13.335000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,38.100000>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,90.000000,0> translate<17.145000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.335000,-1.535000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,39.052500>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<13.335000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,39.052500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<17.145000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,47.942500>}
box{<0,0,-0.711200><3.175000,0.035000,0.711200> rotate<0,90.000000,0> translate<17.145000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.462500,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.462500,-1.535000,55.245000>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,-90.000000,0> translate<17.462500,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,4.375000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.500000,-1.535000,5.625000>}
box{<0,0,-0.635000><1.767767,0.035000,0.635000> rotate<0,-44.997030,0> translate<16.250000,-1.535000,4.375000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.462500,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.780000,-1.535000,46.672500>}
box{<0,0,-0.711200><0.449013,0.035000,0.711200> rotate<0,44.997030,0> translate<17.462500,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.145000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.780000,-1.535000,47.625000>}
box{<0,0,-0.508000><2.008046,0.035000,0.508000> rotate<0,-71.560328,0> translate<17.145000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<14.922500,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.780000,-1.535000,62.865000>}
box{<0,0,-0.711200><2.857500,0.035000,0.711200> rotate<0,0.000000,0> translate<14.922500,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.780000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.780000,-1.535000,66.675000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,90.000000,0> translate<17.780000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.415000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.415000,-1.535000,10.160000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,-90.000000,0> translate<18.415000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.145000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.415000,-1.535000,12.700000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,0.000000,0> translate<17.145000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<18.415000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<18.415000,-1.535000,15.875000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,90.000000,0> translate<18.415000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.415000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.415000,-1.535000,22.860000>}
box{<0,0,-0.635000><6.985000,0.035000,0.635000> rotate<0,90.000000,0> translate<18.415000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<18.415000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<18.415000,-1.535000,29.527500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,-90.000000,0> translate<18.415000,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<18.415000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<18.415000,-1.535000,30.480000>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,-90.000000,0> translate<18.415000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<16.510000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<18.415000,-1.535000,31.750000>}
box{<0,0,-0.711200><2.694077,0.035000,0.711200> rotate<0,44.997030,0> translate<16.510000,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.685000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.685000,-1.535000,38.100000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,90.000000,0> translate<19.685000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<19.685000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<19.685000,-1.535000,39.052500>}
box{<0,0,-0.711200><2.222500,0.035000,0.711200> rotate<0,90.000000,0> translate<19.685000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.145000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.685000,-1.535000,45.720000>}
box{<0,0,-0.508000><2.540000,0.035000,0.508000> rotate<0,0.000000,0> translate<17.145000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<20.320000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<20.320000,-1.535000,70.802500>}
box{<0,0,-0.889000><4.127500,0.035000,0.889000> rotate<0,90.000000,0> translate<20.320000,-1.535000,70.802500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.375000,-1.535000,5.625000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.625000,-1.535000,4.375000>}
box{<0,0,-0.635000><1.767767,0.035000,0.635000> rotate<0,44.997030,0> translate<19.375000,-1.535000,5.625000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.625000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.625000,-1.535000,4.375000>}
box{<0,0,-0.635000><3.125000,0.035000,0.635000> rotate<0,90.000000,0> translate<20.625000,-1.535000,4.375000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.625000,-1.535000,4.375000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.625000,-1.535000,5.625000>}
box{<0,0,-0.635000><1.250000,0.035000,0.635000> rotate<0,90.000000,0> translate<20.625000,-1.535000,5.625000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.850000,-1.535000,5.525000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.850000,-1.535000,5.500000>}
box{<0,0,-0.635000><0.025000,0.035000,0.635000> rotate<0,-90.000000,0> translate<20.850000,-1.535000,5.500000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.250000,-1.535000,5.525000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.850000,-1.535000,5.525000>}
box{<0,0,-0.635000><4.600000,0.035000,0.635000> rotate<0,0.000000,0> translate<16.250000,-1.535000,5.525000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,-1.535000,2.540000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,-90.000000,0> translate<20.955000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.875000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,-1.535000,6.350000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,0.000000,0> translate<15.875000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,-1.535000,22.860000>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,90.000000,0> translate<20.955000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.955000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.955000,-1.535000,30.480000>}
box{<0,0,-0.508000><1.905000,0.035000,0.508000> rotate<0,-90.000000,0> translate<20.955000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<20.955000,-1.535000,32.385000>}
box{<0,0,-0.711200><5.388154,0.035000,0.711200> rotate<0,44.997030,0> translate<17.145000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<20.955000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<20.955000,-1.535000,32.385000>}
box{<0,0,-0.711200><2.857500,0.035000,0.711200> rotate<0,90.000000,0> translate<20.955000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.625000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.250000,-1.535000,1.250000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,0.000000,0> translate<20.625000,-1.535000,1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.250000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.250000,-1.535000,1.875000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,90.000000,0> translate<21.250000,-1.535000,1.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.250000,-1.535000,1.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.250000,-1.535000,6.250000>}
box{<0,0,-0.635000><4.375000,0.035000,0.635000> rotate<0,90.000000,0> translate<21.250000,-1.535000,6.250000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.462500,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<21.590000,-1.535000,60.325000>}
box{<0,0,-0.711200><4.127500,0.035000,0.711200> rotate<0,0.000000,0> translate<17.462500,-1.535000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.780000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<21.590000,-1.535000,62.865000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<17.780000,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,38.100000>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,90.000000,0> translate<22.225000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,38.100000>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,-90.000000,0> translate<22.225000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,44.767500>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,0.000000,0> translate<17.145000,-1.535000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.685000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.225000,-1.535000,45.720000>}
box{<0,0,-0.508000><2.540000,0.035000,0.508000> rotate<0,0.000000,0> translate<19.685000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,45.720000>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<22.225000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.780000,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,46.672500>}
box{<0,0,-0.711200><4.445000,0.035000,0.711200> rotate<0,0.000000,0> translate<17.780000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,46.672500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<22.225000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,46.672500>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,-90.000000,0> translate<22.225000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,47.942500>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,0.000000,0> translate<17.145000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<22.500000,-1.535000,2.500000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<22.500000,-1.535000,6.250000>}
box{<0,0,-0.635000><3.750000,0.035000,0.635000> rotate<0,90.000000,0> translate<22.500000,-1.535000,6.250000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<14.605000,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.542500,-1.535000,26.035000>}
box{<0,0,-0.711200><7.937500,0.035000,0.711200> rotate<0,0.000000,0> translate<14.605000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.542500,-1.535000,37.147500>}
box{<0,0,-0.711200><0.449013,0.035000,0.711200> rotate<0,44.997030,0> translate<22.225000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<22.542500,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<22.860000,-1.535000,66.675000>}
box{<0,0,-0.838200><0.317500,0.035000,0.838200> rotate<0,0.000000,0> translate<22.542500,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<15.875000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.125000,-1.535000,6.875000>}
box{<0,0,-0.711200><7.250000,0.035000,0.711200> rotate<0,0.000000,0> translate<15.875000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<21.907500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<23.177500,-1.535000,57.467500>}
box{<0,0,-0.838200><1.270000,0.035000,0.838200> rotate<0,0.000000,0> translate<21.907500,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,2.540000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<20.955000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,6.985000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,90.000000,0> translate<23.495000,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,10.160000>}
box{<0,0,-0.635000><3.175000,0.035000,0.635000> rotate<0,90.000000,0> translate<23.495000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,22.860000>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,90.000000,0> translate<23.495000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.495000,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.495000,-1.535000,23.495000>}
box{<0,0,-0.711200><1.587500,0.035000,0.711200> rotate<0,-90.000000,0> translate<23.495000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.542500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.495000,-1.535000,25.082500>}
box{<0,0,-0.711200><1.347038,0.035000,0.711200> rotate<0,44.997030,0> translate<22.542500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.495000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.495000,-1.535000,30.480000>}
box{<0,0,-0.508000><2.540000,0.035000,0.508000> rotate<0,-90.000000,0> translate<23.495000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<19.685000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.495000,-1.535000,33.020000>}
box{<0,0,-0.711200><5.388154,0.035000,0.711200> rotate<0,44.997030,0> translate<19.685000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.495000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.495000,-1.535000,33.020000>}
box{<0,0,-0.711200><3.492500,0.035000,0.711200> rotate<0,90.000000,0> translate<23.495000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.125000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<23.750000,-1.535000,7.500000>}
box{<0,0,-0.711200><0.883883,0.035000,0.711200> rotate<0,-44.997030,0> translate<23.125000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.375000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.375000,-1.535000,2.500000>}
box{<0,0,-0.635000><4.375000,0.035000,0.635000> rotate<0,-90.000000,0> translate<24.375000,-1.535000,2.500000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.625000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.375000,-1.535000,6.875000>}
box{<0,0,-0.635000><8.750000,0.035000,0.635000> rotate<0,0.000000,0> translate<15.625000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.375000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.375000,-1.535000,10.625000>}
box{<0,0,-0.635000><3.750000,0.035000,0.635000> rotate<0,90.000000,0> translate<24.375000,-1.535000,10.625000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,22.860000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,0.000000,0> translate<23.495000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,22.860000>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,90.000000,0> translate<24.765000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,25.625000>}
box{<0,0,-0.635000><2.765000,0.035000,0.635000> rotate<0,90.000000,0> translate<24.765000,-1.535000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,26.035000>}
box{<0,0,-0.635000><0.410000,0.035000,0.635000> rotate<0,90.000000,0> translate<24.765000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<24.765000,-1.535000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<24.765000,-1.535000,26.250000>}
box{<0,0,-0.711200><0.625000,0.035000,0.711200> rotate<0,90.000000,0> translate<24.765000,-1.535000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.375000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.000000,-1.535000,6.875000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,0.000000,0> translate<24.375000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.000000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.000000,-1.535000,9.375000>}
box{<0,0,-0.635000><2.500000,0.035000,0.635000> rotate<0,90.000000,0> translate<25.000000,-1.535000,9.375000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<23.177500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<25.082500,-1.535000,57.467500>}
box{<0,0,-0.838200><1.905000,0.035000,0.838200> rotate<0,0.000000,0> translate<23.177500,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<23.495000,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<25.082500,-1.535000,61.595000>}
box{<0,0,-0.838200><1.587500,0.035000,0.838200> rotate<0,0.000000,0> translate<23.495000,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<25.082500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<25.082500,-1.535000,61.595000>}
box{<0,0,-0.838200><4.127500,0.035000,0.838200> rotate<0,90.000000,0> translate<25.082500,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<22.860000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<25.082500,-1.535000,66.675000>}
box{<0,0,-0.838200><2.222500,0.035000,0.838200> rotate<0,0.000000,0> translate<22.860000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<25.082500,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<25.082500,-1.535000,66.675000>}
box{<0,0,-0.838200><5.080000,0.035000,0.838200> rotate<0,90.000000,0> translate<25.082500,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.250000,-1.535000,1.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.625000,-1.535000,1.875000>}
box{<0,0,-0.635000><4.375000,0.035000,0.635000> rotate<0,0.000000,0> translate<21.250000,-1.535000,1.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.625000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.625000,-1.535000,2.500000>}
box{<0,0,-0.635000><4.375000,0.035000,0.635000> rotate<0,-90.000000,0> translate<25.625000,-1.535000,2.500000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.000000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.625000,-1.535000,6.875000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,0.000000,0> translate<25.000000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.000000,-1.535000,9.375000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.625000,-1.535000,10.000000>}
box{<0,0,-0.635000><0.883883,0.035000,0.635000> rotate<0,-44.997030,0> translate<25.000000,-1.535000,9.375000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.035000,-1.535000,2.540000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<23.495000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.035000,-1.535000,10.160000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,0.000000,0> translate<24.765000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.765000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.035000,-1.535000,22.860000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,0.000000,0> translate<24.765000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.035000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.035000,-1.535000,22.860000>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,90.000000,0> translate<26.035000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,25.082500>}
box{<0,0,-0.711200><2.222500,0.035000,0.711200> rotate<0,90.000000,0> translate<26.035000,-1.535000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,30.480000>}
box{<0,0,-0.508000><6.667500,0.035000,0.508000> rotate<0,-90.000000,0> translate<26.035000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.542500,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,37.147500>}
box{<0,0,-0.711200><3.492500,0.035000,0.711200> rotate<0,0.000000,0> translate<22.542500,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,37.147500>}
box{<0,0,-0.711200><7.620000,0.035000,0.711200> rotate<0,90.000000,0> translate<26.035000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.225000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,38.100000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,0.000000,0> translate<22.225000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,38.100000>}
box{<0,0,-0.508000><0.952500,0.035000,0.508000> rotate<0,90.000000,0> translate<26.035000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<22.225000,-1.535000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,39.052500>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<22.225000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,39.052500>}
box{<0,0,-0.711200><1.905000,0.035000,0.711200> rotate<0,90.000000,0> translate<26.035000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,45.720000>}
box{<0,0,-0.711200><2.222500,0.035000,0.711200> rotate<0,-90.000000,0> translate<26.035000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,46.355000>}
box{<0,0,-0.711200><1.587500,0.035000,0.711200> rotate<0,90.000000,0> translate<26.035000,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.250000,-1.535000,1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,1.250000>}
box{<0,0,-0.635000><5.000000,0.035000,0.635000> rotate<0,0.000000,0> translate<21.250000,-1.535000,1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,6.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,1.250000>}
box{<0,0,-0.635000><5.000000,0.035000,0.635000> rotate<0,-90.000000,0> translate<26.250000,-1.535000,1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,6.250000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,-90.000000,0> translate<26.250000,-1.535000,6.250000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.625000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,6.875000>}
box{<0,0,-0.635000><0.625000,0.035000,0.635000> rotate<0,0.000000,0> translate<25.625000,-1.535000,6.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,6.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,10.000000>}
box{<0,0,-0.635000><3.125000,0.035000,0.635000> rotate<0,90.000000,0> translate<26.250000,-1.535000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.352500,-1.535000,46.672500>}
box{<0,0,-0.711200><0.449013,0.035000,0.711200> rotate<0,-44.997030,0> translate<26.035000,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.250000,-1.535000,6.250000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.875000,-1.535000,6.875000>}
box{<0,0,-0.635000><0.883883,0.035000,0.635000> rotate<0,-44.997030,0> translate<26.250000,-1.535000,6.250000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<14.605000,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.987500,-1.535000,26.035000>}
box{<0,0,-0.508000><12.382500,0.035000,0.508000> rotate<0,0.000000,0> translate<14.605000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.987500,-1.535000,26.035000>}
box{<0,0,-0.711200><1.347038,0.035000,0.711200> rotate<0,-44.997030,0> translate<26.035000,-1.535000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<28.575000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<28.575000,-1.535000,5.080000>}
box{<0,0,-0.711200><2.540000,0.035000,0.711200> rotate<0,90.000000,0> translate<28.575000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<28.575000,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<28.575000,-1.535000,10.160000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,-90.000000,0> translate<28.575000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<28.575000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<28.575000,-1.535000,14.605000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,-90.000000,0> translate<28.575000,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.415000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<28.575000,0.000000,15.240000>}
box{<0,0,-0.635000><10.160000,0.035000,0.635000> rotate<0,0.000000,0> translate<18.415000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.875000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<28.575000,0.000000,17.780000>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,0.000000,0> translate<15.875000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<28.575000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<28.575000,-1.535000,18.415000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,90.000000,0> translate<28.575000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<28.575000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<28.575000,-1.535000,22.860000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,90.000000,0> translate<28.575000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<28.575000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<28.575000,-1.535000,38.100000>}
box{<0,0,-0.508000><7.620000,0.035000,0.508000> rotate<0,90.000000,0> translate<28.575000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<28.575000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<28.575000,-1.535000,39.052500>}
box{<0,0,-0.711200><9.525000,0.035000,0.711200> rotate<0,90.000000,0> translate<28.575000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<28.575000,-1.535000,45.720000>}
box{<0,0,-0.508000><2.540000,0.035000,0.508000> rotate<0,0.000000,0> translate<26.035000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<28.575000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,-1.535000,45.720000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,0.000000,0> translate<28.575000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,-1.535000,45.720000>}
box{<0,0,-0.508000><0.952500,0.035000,0.508000> rotate<0,-90.000000,0> translate<29.845000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.352500,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<29.845000,-1.535000,46.672500>}
box{<0,0,-0.711200><3.492500,0.035000,0.711200> rotate<0,0.000000,0> translate<26.352500,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<29.845000,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<29.845000,-1.535000,55.245000>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,-90.000000,0> translate<29.845000,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<29.845000,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<30.000000,-1.535000,60.325000>}
box{<0,0,-0.711200><0.155000,0.035000,0.711200> rotate<0,0.000000,0> translate<29.845000,-1.535000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.480000,-1.535000,47.625000>}
box{<0,0,-0.508000><1.144763,0.035000,0.508000> rotate<0,-56.306216,0> translate<29.845000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<27.622500,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<30.480000,-1.535000,62.865000>}
box{<0,0,-0.711200><2.857500,0.035000,0.711200> rotate<0,0.000000,0> translate<27.622500,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<30.480000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<30.480000,-1.535000,66.675000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,90.000000,0> translate<30.480000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.115000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.115000,-1.535000,10.160000>}
box{<0,0,-0.635000><1.905000,0.035000,0.635000> rotate<0,-90.000000,0> translate<31.115000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,12.065000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,-90.000000,0> translate<31.115000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.335000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.115000,0.000000,12.700000>}
box{<0,0,-0.635000><17.780000,0.035000,0.635000> rotate<0,0.000000,0> translate<13.335000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,13.335000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,90.000000,0> translate<31.115000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,17.780000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,90.000000,0> translate<31.115000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<31.115000,-1.535000,18.415000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,90.000000,0> translate<31.115000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.115000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.115000,-1.535000,22.860000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,90.000000,0> translate<31.115000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<31.115000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<31.115000,-1.535000,30.480000>}
box{<0,0,-0.508000><6.667500,0.035000,0.508000> rotate<0,-90.000000,0> translate<31.115000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,37.147500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,-90.000000,0> translate<31.115000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,38.100000>}
box{<0,0,-0.711200><8.572500,0.035000,0.711200> rotate<0,90.000000,0> translate<31.115000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,39.052500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<31.115000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,44.767500>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,0.000000,0> translate<26.035000,-1.535000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<31.115000,-1.535000,45.720000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,0.000000,0> translate<29.845000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<26.035000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,47.942500>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,0.000000,0> translate<26.035000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,47.942500>}
box{<0,0,-0.711200><3.175000,0.035000,0.711200> rotate<0,90.000000,0> translate<31.115000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.987500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.702500,-1.535000,26.035000>}
box{<0,0,-0.508000><5.715000,0.035000,0.508000> rotate<0,0.000000,0> translate<26.987500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<33.020000,-1.535000,70.485000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<33.020000,-1.535000,66.040000>}
box{<0,0,-0.889000><4.445000,0.035000,0.889000> rotate<0,-90.000000,0> translate<33.020000,-1.535000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.020000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.020000,-1.535000,70.485000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,90.000000,0> translate<33.020000,-1.535000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.495000,-1.535000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.655000,-1.535000,6.985000>}
box{<0,0,-0.635000><10.160000,0.035000,0.635000> rotate<0,0.000000,0> translate<23.495000,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.655000,-1.535000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.655000,-1.535000,10.160000>}
box{<0,0,-0.635000><3.175000,0.035000,0.635000> rotate<0,90.000000,0> translate<33.655000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,22.225000>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,-90.000000,0> translate<33.655000,-1.535000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,22.860000>}
box{<0,0,-0.711200><1.905000,0.035000,0.711200> rotate<0,-90.000000,0> translate<33.655000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,24.765000>}
box{<0,0,-0.711200><0.317500,0.035000,0.711200> rotate<0,-90.000000,0> translate<33.655000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<32.702500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,25.082500>}
box{<0,0,-0.711200><1.347038,0.035000,0.711200> rotate<0,44.997030,0> translate<32.702500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.655000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.655000,-1.535000,26.670000>}
box{<0,0,-0.635000><1.905000,0.035000,0.635000> rotate<0,90.000000,0> translate<33.655000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,31.115000>}
box{<0,0,-0.711200><1.587500,0.035000,0.711200> rotate<0,90.000000,0> translate<33.655000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<30.000000,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.290000,-1.535000,60.325000>}
box{<0,0,-0.711200><4.290000,0.035000,0.711200> rotate<0,0.000000,0> translate<30.000000,-1.535000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<30.480000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.290000,-1.535000,62.865000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<30.480000,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.702500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.607500,-1.535000,26.035000>}
box{<0,0,-0.508000><1.905000,0.035000,0.508000> rotate<0,0.000000,0> translate<32.702500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.655000,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.607500,-1.535000,26.035000>}
box{<0,0,-0.711200><1.347038,0.035000,0.711200> rotate<0,-44.997030,0> translate<33.655000,-1.535000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,37.147500>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<31.115000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<31.115000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.925000,-1.535000,38.100000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,0.000000,0> translate<31.115000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<31.115000,-1.535000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,39.052500>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<31.115000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,39.052500>}
box{<0,0,-0.711200><1.905000,0.035000,0.711200> rotate<0,90.000000,0> translate<34.925000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,47.942500>}
box{<0,0,-0.711200><3.175000,0.035000,0.711200> rotate<0,90.000000,0> translate<34.925000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<35.242500,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<35.560000,-1.535000,66.675000>}
box{<0,0,-0.838200><0.317500,0.035000,0.838200> rotate<0,0.000000,0> translate<35.242500,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<34.925000,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<35.877500,-1.535000,57.467500>}
box{<0,0,-0.838200><0.952500,0.035000,0.838200> rotate<0,0.000000,0> translate<34.925000,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<28.575000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<36.195000,-1.535000,5.080000>}
box{<0,0,-0.711200><7.620000,0.035000,0.711200> rotate<0,0.000000,0> translate<28.575000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.875000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.195000,0.000000,20.320000>}
box{<0,0,-0.635000><20.320000,0.035000,0.635000> rotate<0,0.000000,0> translate<15.875000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<35.560000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<36.195000,-1.535000,20.320000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,0.000000,0> translate<35.560000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<36.195000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<36.195000,-1.535000,20.320000>}
box{<0,0,-0.711200><15.240000,0.035000,0.711200> rotate<0,90.000000,0> translate<36.195000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.655000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.465000,-1.535000,30.480000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,0.000000,0> translate<33.655000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.465000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.465000,-1.535000,38.100000>}
box{<0,0,-0.508000><7.620000,0.035000,0.508000> rotate<0,90.000000,0> translate<37.465000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.925000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.465000,-1.535000,45.720000>}
box{<0,0,-0.508000><2.540000,0.035000,0.508000> rotate<0,0.000000,0> translate<34.925000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<35.877500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<37.465000,-1.535000,57.467500>}
box{<0,0,-0.838200><1.587500,0.035000,0.838200> rotate<0,0.000000,0> translate<35.877500,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<36.195000,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<37.465000,-1.535000,61.595000>}
box{<0,0,-0.838200><1.270000,0.035000,0.838200> rotate<0,0.000000,0> translate<36.195000,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<37.465000,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<37.465000,-1.535000,61.595000>}
box{<0,0,-0.838200><4.127500,0.035000,0.838200> rotate<0,90.000000,0> translate<37.465000,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<35.560000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<37.465000,-1.535000,66.675000>}
box{<0,0,-0.838200><1.905000,0.035000,0.838200> rotate<0,0.000000,0> translate<35.560000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<37.465000,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<37.465000,-1.535000,66.675000>}
box{<0,0,-0.838200><5.080000,0.035000,0.838200> rotate<0,90.000000,0> translate<37.465000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.607500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.735000,-1.535000,26.035000>}
box{<0,0,-0.508000><4.127500,0.035000,0.508000> rotate<0,0.000000,0> translate<34.607500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.735000,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.735000,-1.535000,26.670000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,90.000000,0> translate<38.735000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.735000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.735000,-1.535000,27.305000>}
box{<0,0,-0.508000><0.635000,0.035000,0.508000> rotate<0,90.000000,0> translate<38.735000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,37.147500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,-90.000000,0> translate<40.005000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,39.052500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<40.005000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,44.767500>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,0.000000,0> translate<34.925000,-1.535000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.465000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.005000,-1.535000,45.720000>}
box{<0,0,-0.508000><2.540000,0.035000,0.508000> rotate<0,0.000000,0> translate<37.465000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,45.720000>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<40.005000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<35.877500,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,46.672500>}
box{<0,0,-0.711200><4.127500,0.035000,0.711200> rotate<0,0.000000,0> translate<35.877500,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,46.672500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<40.005000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,46.672500>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,-90.000000,0> translate<40.005000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<34.925000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,47.942500>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,0.000000,0> translate<34.925000,-1.535000,47.942500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,47.942500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,48.895000>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<40.005000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<41.275000,-1.535000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<41.275000,-1.535000,17.145000>}
box{<0,0,-0.889000><0.317500,0.035000,0.889000> rotate<0,-90.000000,0> translate<41.275000,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<41.275000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<41.275000,-1.535000,17.462500>}
box{<0,0,-0.889000><0.317500,0.035000,0.889000> rotate<0,-90.000000,0> translate<41.275000,-1.535000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.115000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.275000,0.000000,17.780000>}
box{<0,0,-0.635000><10.160000,0.035000,0.635000> rotate<0,0.000000,0> translate<31.115000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<41.275000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<41.275000,-1.535000,18.415000>}
box{<0,0,-0.889000><0.635000,0.035000,0.889000> rotate<0,90.000000,0> translate<41.275000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.957500,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<41.275000,-1.535000,37.147500>}
box{<0,0,-0.711200><0.449013,0.035000,0.711200> rotate<0,44.997030,0> translate<40.957500,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<41.275000,-1.535000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<41.275000,-1.535000,37.147500>}
box{<0,0,-0.711200><19.685000,0.035000,0.711200> rotate<0,90.000000,0> translate<41.275000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.005000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<41.275000,-1.535000,38.100000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,0.000000,0> translate<40.005000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<41.275000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<41.275000,-1.535000,38.100000>}
box{<0,0,-0.508000><19.685000,0.035000,0.508000> rotate<0,90.000000,0> translate<41.275000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.227500,-1.535000,37.147500>}
box{<0,0,-0.711200><2.222500,0.035000,0.711200> rotate<0,0.000000,0> translate<40.005000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.227500,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,37.465000>}
box{<0,0,-0.711200><0.449013,0.035000,0.711200> rotate<0,-44.997030,0> translate<42.227500,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,37.465000>}
box{<0,0,-0.711200><1.587500,0.035000,0.711200> rotate<0,-90.000000,0> translate<42.545000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<41.275000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<42.545000,-1.535000,38.100000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,0.000000,0> translate<41.275000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,39.052500>}
box{<0,0,-0.711200><2.540000,0.035000,0.711200> rotate<0,0.000000,0> translate<40.005000,-1.535000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<10.795000,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,42.545000>}
box{<0,0,-0.711200><31.750000,0.035000,0.711200> rotate<0,0.000000,0> translate<10.795000,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,45.720000>}
box{<0,0,-0.711200><3.175000,0.035000,0.711200> rotate<0,90.000000,0> translate<42.545000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<42.545000,-1.535000,46.672500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,90.000000,0> translate<42.545000,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,48.895000>}
box{<0,0,-0.711200><3.175000,0.035000,0.711200> rotate<0,0.000000,0> translate<40.005000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,55.245000>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,-90.000000,0> translate<43.180000,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.125000,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,60.325000>}
box{<0,0,-0.711200><0.055000,0.035000,0.711200> rotate<0,0.000000,0> translate<43.125000,-1.535000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<40.005000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,62.865000>}
box{<0,0,-0.711200><3.175000,0.035000,0.711200> rotate<0,0.000000,0> translate<40.005000,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,64.135000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,62.865000>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,-90.000000,0> translate<43.180000,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,64.135000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,66.675000>}
box{<0,0,-0.711200><2.540000,0.035000,0.711200> rotate<0,90.000000,0> translate<43.180000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<45.720000,-1.535000,70.485000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<45.720000,-1.535000,66.040000>}
box{<0,0,-0.889000><4.445000,0.035000,0.889000> rotate<0,-90.000000,0> translate<45.720000,-1.535000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,70.485000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,90.000000,0> translate<45.720000,-1.535000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.990000,-1.535000,60.325000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<43.180000,-1.535000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.180000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.990000,-1.535000,62.865000>}
box{<0,0,-0.711200><3.810000,0.035000,0.711200> rotate<0,0.000000,0> translate<43.180000,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.942500,-1.535000,65.722500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.942500,-1.535000,65.087500>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,-90.000000,0> translate<47.942500,-1.535000,65.087500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.942500,-1.535000,67.627500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.942500,-1.535000,65.722500>}
box{<0,0,-0.711200><1.905000,0.035000,0.711200> rotate<0,-90.000000,0> translate<47.942500,-1.535000,65.722500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.942500,-1.535000,65.722500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.260000,-1.535000,65.722500>}
box{<0,0,-0.711200><0.317500,0.035000,0.711200> rotate<0,0.000000,0> translate<47.942500,-1.535000,65.722500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.260000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.260000,-1.535000,65.722500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,-90.000000,0> translate<48.260000,-1.535000,65.722500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.307500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.577500,-1.535000,57.467500>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,0.000000,0> translate<47.307500,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.942500,-1.535000,65.087500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.577500,-1.535000,65.087500>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<47.942500,-1.535000,65.087500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.577500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.530000,-1.535000,57.467500>}
box{<0,0,-0.711200><0.952500,0.035000,0.711200> rotate<0,0.000000,0> translate<48.577500,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.895000,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,-1.535000,61.595000>}
box{<0,0,-0.508000><0.635000,0.035000,0.508000> rotate<0,0.000000,0> translate<48.895000,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,-1.535000,61.595000>}
box{<0,0,-0.508000><4.127500,0.035000,0.508000> rotate<0,90.000000,0> translate<49.530000,-1.535000,61.595000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.260000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,-1.535000,66.675000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,0.000000,0> translate<48.260000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,-1.535000,61.595000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,-1.535000,66.675000>}
box{<0,0,-0.508000><5.080000,0.035000,0.508000> rotate<0,90.000000,0> translate<49.530000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.847500,-1.535000,59.372500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.847500,-1.535000,59.055000>}
box{<0,0,-0.711200><0.317500,0.035000,0.711200> rotate<0,-90.000000,0> translate<49.847500,-1.535000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.577500,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.847500,-1.535000,59.372500>}
box{<0,0,-0.711200><2.289525,0.035000,0.711200> rotate<0,-56.306216,0> translate<48.577500,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.577500,-1.535000,65.087500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.165000,-1.535000,63.500000>}
box{<0,0,-0.711200><2.245064,0.035000,0.711200> rotate<0,44.997030,0> translate<48.577500,-1.535000,65.087500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.847500,-1.535000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.482500,-1.535000,58.420000>}
box{<0,0,-0.711200><0.898026,0.035000,0.711200> rotate<0,44.997030,0> translate<49.847500,-1.535000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.165000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.482500,-1.535000,63.817500>}
box{<0,0,-0.711200><0.449013,0.035000,0.711200> rotate<0,-44.997030,0> translate<50.165000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.482500,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.482500,-1.535000,63.817500>}
box{<0,0,-0.711200><5.397500,0.035000,0.711200> rotate<0,90.000000,0> translate<50.482500,-1.535000,63.817500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.482500,-1.535000,63.817500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.482500,-1.535000,66.675000>}
box{<0,0,-0.711200><2.857500,0.035000,0.711200> rotate<0,90.000000,0> translate<50.482500,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.530000,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.800000,-1.535000,57.467500>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,0.000000,0> translate<49.530000,-1.535000,57.467500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.942500,-1.535000,67.627500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.800000,-1.535000,67.627500>}
box{<0,0,-0.711200><2.857500,0.035000,0.711200> rotate<0,0.000000,0> translate<47.942500,-1.535000,67.627500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.800000,-1.535000,57.467500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.800000,-1.535000,67.627500>}
box{<0,0,-0.711200><10.160000,0.035000,0.711200> rotate<0,90.000000,0> translate<50.800000,-1.535000,67.627500> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,5.559722>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,10.160000>}
box{<0,0,-0.711200><4.600278,0.035000,0.711200> rotate<0,90.000000,0> translate<1.092197,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,5.559722>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.493294,-1.535000,5.667197>}
box{<0,0,-0.711200><0.415246,0.035000,0.711200> rotate<0,-14.999199,0> translate<1.092197,-1.535000,5.559722> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,5.689600>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,7.112000>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,8.534400>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,9.956800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,9.956800>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,9.956800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,10.160000>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,37.229909>}
box{<0,0,-0.711200><13.099909,0.035000,0.711200> rotate<0,90.000000,0> translate<1.092197,-1.535000,37.229909> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<12.382500,-1.535000,24.130000>}
box{<0,0,-0.711200><11.290303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<12.416369,-1.535000,24.180800>}
box{<0,0,-0.711200><11.324172,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,24.180800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.364634,-1.535000,25.603200>}
box{<0,0,-0.711200><12.272438,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,27.025600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,27.025600>}
box{<0,0,-0.711200><37.960303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,27.025600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,28.448000>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,29.870400>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,31.292800>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,32.715200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,32.715200>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,32.715200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,34.137600>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,35.560000>}
box{<0,0,-0.711200><6.210303,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.737919,-1.535000,36.982400>}
box{<0,0,-0.711200><0.645722,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,37.229909>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.332944,-1.535000,37.090913>}
box{<0,0,-0.711200><0.277991,0.035000,0.711200> rotate<0,29.998306,0> translate<1.092197,-1.535000,37.229909> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,42.780088>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,55.245000>}
box{<0,0,-0.711200><12.464913,0.035000,0.711200> rotate<0,90.000000,0> translate<1.092197,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,42.780088>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.332944,-1.535000,42.919084>}
box{<0,0,-0.711200><0.277991,0.035000,0.711200> rotate<0,-29.998306,0> translate<1.092197,-1.535000,42.780088> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.483100,-1.535000,44.094400>}
box{<0,0,-0.711200><3.390903,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,45.516800>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,46.939200>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,48.361600>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,49.784000>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,51.206400>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,52.628800>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,54.051200>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.092197,-1.535000,55.245000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,55.245000>}
box{<0,0,-0.711200><2.082803,0.035000,0.711200> rotate<0,0.000000,0> translate<1.092197,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.332944,-1.535000,37.090913>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.128294,-1.535000,36.877800>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,14.998950,0> translate<1.332944,-1.535000,37.090913> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.332944,-1.535000,42.919084>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.128294,-1.535000,43.132197>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,-14.998950,0> translate<1.332944,-1.535000,42.919084> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<1.493294,-1.535000,5.667197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.316703,-1.535000,5.667197>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,0.000000,0> translate<1.493294,-1.535000,5.667197> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<1.905000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<1.905000,-1.535000,71.999000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,90.000000,0> translate<1.905000,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<1.905000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.017500,-1.535000,69.850000>}
box{<0,0,-0.635000><11.112500,0.035000,0.635000> rotate<0,0.000000,0> translate<1.905000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<1.905000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.017500,-1.535000,69.850000>}
box{<0,0,-0.635000><11.112500,0.035000,0.635000> rotate<0,0.000000,0> translate<1.905000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<1.905000,-1.535000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.017500,-1.535000,71.120000>}
box{<0,0,-0.635000><11.112500,0.035000,0.635000> rotate<0,0.000000,0> translate<1.905000,-1.535000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<1.905000,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.017500,-1.535000,71.999000>}
box{<0,0,-0.635000><11.112500,0.035000,0.635000> rotate<0,0.000000,0> translate<1.905000,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.128294,-1.535000,36.877800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.951703,-1.535000,36.877800>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,0.000000,0> translate<2.128294,-1.535000,36.877800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.128294,-1.535000,43.132197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.951703,-1.535000,43.132197>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,0.000000,0> translate<2.128294,-1.535000,43.132197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.316703,-1.535000,5.667197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.112053,-1.535000,5.454084>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,14.998950,0> translate<2.316703,-1.535000,5.667197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.951703,-1.535000,36.877800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.747053,-1.535000,37.090913>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,-14.998950,0> translate<2.951703,-1.535000,36.877800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<2.951703,-1.535000,43.132197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.747053,-1.535000,42.919084>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,14.998950,0> translate<2.951703,-1.535000,43.132197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.112053,-1.535000,5.454084>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.825144,-1.535000,5.042381>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,29.998024,0> translate<3.112053,-1.535000,5.454084> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,45.402500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,41.275000>}
box{<0,0,-0.711200><5.837166,0.035000,0.711200> rotate<0,44.997030,0> translate<3.175000,-1.535000,45.402500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,55.245000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.175000,-1.535000,45.402500>}
box{<0,0,-0.711200><9.842500,0.035000,0.711200> rotate<0,-90.000000,0> translate<3.175000,-1.535000,45.402500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.342075,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,36.982400>}
box{<0,0,-0.711200><3.960425,0.035000,0.711200> rotate<0,0.000000,0> translate<3.342075,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.492500,-1.535000,51.117500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.492500,-1.535000,55.245000>}
box{<0,0,-0.711200><4.127500,0.035000,0.711200> rotate<0,90.000000,0> translate<3.492500,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.492500,-1.535000,51.117500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,51.117500>}
box{<0,0,-0.711200><41.592500,0.035000,0.711200> rotate<0,0.000000,0> translate<3.492500,-1.535000,51.117500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.492500,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,51.206400>}
box{<0,0,-0.711200><47.155300,0.035000,0.711200> rotate<0,0.000000,0> translate<3.492500,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.492500,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,52.628800>}
box{<0,0,-0.711200><47.155300,0.035000,0.711200> rotate<0,0.000000,0> translate<3.492500,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.492500,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,54.051200>}
box{<0,0,-0.711200><47.155300,0.035000,0.711200> rotate<0,0.000000,0> translate<3.492500,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.492500,-1.535000,55.245000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,55.245000>}
box{<0,0,-0.711200><47.155300,0.035000,0.711200> rotate<0,0.000000,0> translate<3.492500,-1.535000,55.245000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.747053,-1.535000,37.090913>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.460144,-1.535000,37.502616>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,-29.998024,0> translate<3.747053,-1.535000,37.090913> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.747053,-1.535000,42.919084>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.460144,-1.535000,42.507381>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,29.998024,0> translate<3.747053,-1.535000,42.919084> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<3.825144,-1.535000,5.042381>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.407381,-1.535000,4.460144>}
box{<0,0,-0.711200><0.823408,0.035000,0.711200> rotate<0,44.997030,0> translate<3.825144,-1.535000,5.042381> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.175019,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.905500,-1.535000,42.672000>}
box{<0,0,-0.711200><1.730481,0.035000,0.711200> rotate<0,0.000000,0> translate<4.175019,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.407381,-1.535000,4.460144>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.819084,-1.535000,3.747053>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,59.996037,0> translate<4.407381,-1.535000,4.460144> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.460144,-1.535000,37.502616>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.042381,-1.535000,38.084853>}
box{<0,0,-0.711200><0.823408,0.035000,0.711200> rotate<0,-44.997030,0> translate<4.460144,-1.535000,37.502616> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.460144,-1.535000,42.507381>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.042381,-1.535000,41.925144>}
box{<0,0,-0.711200><0.823408,0.035000,0.711200> rotate<0,44.997030,0> translate<4.460144,-1.535000,42.507381> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.518778,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,4.267200>}
box{<0,0,-0.711200><2.783722,0.035000,0.711200> rotate<0,0.000000,0> translate<4.518778,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.819084,-1.535000,3.747053>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.032197,-1.535000,2.951703>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,74.995110,0> translate<4.819084,-1.535000,3.747053> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.924722,-1.535000,1.727197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.032197,-1.535000,2.128294>}
box{<0,0,-0.711200><0.415246,0.035000,0.711200> rotate<0,-74.994862,0> translate<4.924722,-1.535000,1.727197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<4.924722,-1.535000,1.727197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,1.727197>}
box{<0,0,-0.711200><2.377778,0.035000,0.711200> rotate<0,0.000000,0> translate<4.924722,-1.535000,1.727197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.032197,-1.535000,2.128294>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.032197,-1.535000,2.951703>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,90.000000,0> translate<5.032197,-1.535000,2.951703> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.032197,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,2.844800>}
box{<0,0,-0.711200><2.270303,0.035000,0.711200> rotate<0,0.000000,0> translate<5.032197,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.042381,-1.535000,38.084853>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.454084,-1.535000,38.797944>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,-59.996037,0> translate<5.042381,-1.535000,38.084853> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.042381,-1.535000,41.925144>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.454084,-1.535000,41.212053>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,59.996037,0> translate<5.042381,-1.535000,41.925144> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.227100,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,38.404800>}
box{<0,0,-0.711200><2.075400,0.035000,0.711200> rotate<0,0.000000,0> translate<5.227100,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.432409,-1.535000,41.249600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,41.249600>}
box{<0,0,-0.711200><1.870091,0.035000,0.711200> rotate<0,0.000000,0> translate<5.432409,-1.535000,41.249600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.454084,-1.535000,38.797944>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.667197,-1.535000,39.593294>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,-74.995110,0> translate<5.454084,-1.535000,38.797944> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.454084,-1.535000,41.212053>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.667197,-1.535000,40.416703>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,74.995110,0> translate<5.454084,-1.535000,41.212053> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.667197,-1.535000,39.593294>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.667197,-1.535000,40.416703>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,90.000000,0> translate<5.667197,-1.535000,40.416703> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<5.667197,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,39.827200>}
box{<0,0,-0.711200><1.635303,0.035000,0.711200> rotate<0,0.000000,0> translate<5.667197,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,1.727197>}
box{<0,0,-0.711200><8.432803,0.035000,0.711200> rotate<0,-90.000000,0> translate<7.302500,-1.535000,1.727197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,27.305000>}
box{<0,0,-0.711200><31.750000,0.035000,0.711200> rotate<0,0.000000,0> translate<7.302500,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<7.302500,-1.535000,27.305000>}
box{<0,0,-0.711200><13.970000,0.035000,0.711200> rotate<0,-90.000000,0> translate<7.302500,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<12.382500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.652500,-1.535000,26.035000>}
box{<0,0,-0.711200><2.289525,0.035000,0.711200> rotate<0,-56.306216,0> translate<12.382500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.017500,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.017500,-1.535000,69.850000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,-90.000000,0> translate<13.017500,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<13.652500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,26.035000>}
box{<0,0,-0.711200><25.400000,0.035000,0.711200> rotate<0,0.000000,0> translate<13.652500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.240000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.240000,-1.535000,71.999000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,90.000000,0> translate<15.240000,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.240000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.717500,-1.535000,69.850000>}
box{<0,0,-0.635000><10.477500,0.035000,0.635000> rotate<0,0.000000,0> translate<15.240000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.240000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.717500,-1.535000,69.850000>}
box{<0,0,-0.635000><10.477500,0.035000,0.635000> rotate<0,0.000000,0> translate<15.240000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.240000,-1.535000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.717500,-1.535000,71.120000>}
box{<0,0,-0.635000><10.477500,0.035000,0.635000> rotate<0,0.000000,0> translate<15.240000,-1.535000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.240000,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.717500,-1.535000,71.999000>}
box{<0,0,-0.635000><10.477500,0.035000,0.635000> rotate<0,0.000000,0> translate<15.240000,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.717500,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.717500,-1.535000,69.850000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,-90.000000,0> translate<25.717500,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,71.999000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,90.000000,0> translate<27.940000,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.417500,-1.535000,69.850000>}
box{<0,0,-0.635000><10.477500,0.035000,0.635000> rotate<0,0.000000,0> translate<27.940000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.417500,-1.535000,69.850000>}
box{<0,0,-0.635000><10.477500,0.035000,0.635000> rotate<0,0.000000,0> translate<27.940000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.417497,-1.535000,71.120000>}
box{<0,0,-0.635000><10.477497,0.035000,0.635000> rotate<0,0.000000,0> translate<27.940000,-1.535000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.417497,-1.535000,71.999000>}
box{<0,0,-0.635000><10.477497,0.035000,0.635000> rotate<0,0.000000,0> translate<27.940000,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.337500,-1.535000,1.727197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.337500,-1.535000,2.857500>}
box{<0,0,-0.711200><1.130303,0.035000,0.711200> rotate<0,90.000000,0> translate<33.337500,-1.535000,2.857500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.337500,-1.535000,1.727197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.145275,-1.535000,1.727197>}
box{<0,0,-0.711200><13.807775,0.035000,0.711200> rotate<0,0.000000,0> translate<33.337500,-1.535000,1.727197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.337500,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.037800,-1.535000,2.844800>}
box{<0,0,-0.711200><13.700300,0.035000,0.711200> rotate<0,0.000000,0> translate<33.337500,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<33.337500,-1.535000,2.857500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,2.857500>}
box{<0,0,-0.711200><5.080000,0.035000,0.711200> rotate<0,0.000000,0> translate<33.337500,-1.535000,2.857500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.417497,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.417500,-1.535000,69.850000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,89.993977,0> translate<38.417497,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,2.857500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,26.035000>}
box{<0,0,-0.711200><23.177500,0.035000,0.711200> rotate<0,90.000000,0> translate<38.417500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.551222,-1.535000,4.267200>}
box{<0,0,-0.711200><9.133722,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,5.689600>}
box{<0,0,-0.711200><12.230300,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,7.112000>}
box{<0,0,-0.711200><12.230300,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,8.534400>}
box{<0,0,-0.711200><12.230300,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,9.956800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,9.956800>}
box{<0,0,-0.711200><12.230300,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,9.956800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,11.379200>}
box{<0,0,-0.711200><12.230300,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,12.801600>}
box{<0,0,-0.711200><12.230300,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,14.224000>}
box{<0,0,-0.711200><12.230300,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,15.646400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,15.646400>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,15.646400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,17.068800>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,18.491200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,18.491200>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,18.491200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,19.913600>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,21.336000>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,22.758400>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,24.180800>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,24.180800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,25.603200>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<38.417500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,26.035000>}
box{<0,0,-0.711200><0.635000,0.035000,0.711200> rotate<0,0.000000,0> translate<38.417500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,14.605000>}
box{<0,0,-0.711200><4.445000,0.035000,0.711200> rotate<0,0.000000,0> translate<39.052500,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,14.605000>}
box{<0,0,-0.711200><11.430000,0.035000,0.711200> rotate<0,-90.000000,0> translate<39.052500,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<39.052500,-1.535000,26.035000>}
box{<0,0,-0.711200><1.270000,0.035000,0.711200> rotate<0,-90.000000,0> translate<39.052500,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.639997,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.640000,-1.535000,69.850000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,89.993977,0> translate<40.639997,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.639997,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.724000,-1.535000,71.999000>}
box{<0,0,-0.635000><10.084003,0.035000,0.635000> rotate<0,0.000000,0> translate<40.639997,-1.535000,71.999000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.640000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.724000,-1.535000,69.850000>}
box{<0,0,-0.635000><10.084000,0.035000,0.635000> rotate<0,0.000000,0> translate<40.640000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.640000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.724000,-1.535000,69.850000>}
box{<0,0,-0.635000><10.084000,0.035000,0.635000> rotate<0,0.000000,0> translate<40.640000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.640000,-1.535000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.724000,-1.535000,71.120000>}
box{<0,0,-0.635000><10.084000,0.035000,0.635000> rotate<0,0.000000,0> translate<40.640000,-1.535000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,34.607500>}
box{<0,0,-0.711200><20.002500,0.035000,0.711200> rotate<0,90.000000,0> translate<43.497500,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,15.646400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,15.646400>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,15.646400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,17.068800>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,18.491200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,18.491200>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,18.491200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,19.913600>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,21.336000>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,22.758400>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,24.180800>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,24.180800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,25.603200>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,27.025600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,27.025600>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,27.025600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,28.448000>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,29.870400>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,31.292800>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,32.715200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,32.715200>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,32.715200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,34.137600>}
box{<0,0,-0.711200><7.150300,0.035000,0.711200> rotate<0,0.000000,0> translate<43.497500,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<43.497500,-1.535000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,36.512500>}
box{<0,0,-0.711200><2.479754,0.035000,0.711200> rotate<0,-50.191116,0> translate<43.497500,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<44.291250,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,35.560000>}
box{<0,0,-0.711200><6.356550,0.035000,0.711200> rotate<0,0.000000,0> translate<44.291250,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,51.117500>}
box{<0,0,-0.711200><14.605000,0.035000,0.711200> rotate<0,90.000000,0> translate<45.085000,-1.535000,51.117500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.727919,-1.535000,36.982400>}
box{<0,0,-0.711200><3.642919,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.842894,-1.535000,38.404800>}
box{<0,0,-0.711200><1.757894,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.402800,-1.535000,39.827200>}
box{<0,0,-0.711200><1.317800,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,41.249600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.637591,-1.535000,41.249600>}
box{<0,0,-0.711200><1.552591,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,41.249600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.894981,-1.535000,42.672000>}
box{<0,0,-0.711200><2.809981,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,44.094400>}
box{<0,0,-0.711200><5.562800,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,45.516800>}
box{<0,0,-0.711200><5.562800,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,46.939200>}
box{<0,0,-0.711200><5.562800,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,48.361600>}
box{<0,0,-0.711200><5.562800,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<45.085000,-1.535000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,49.784000>}
box{<0,0,-0.711200><5.562800,0.035000,0.711200> rotate<0,0.000000,0> translate<45.085000,-1.535000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.402800,-1.535000,39.593294>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.615913,-1.535000,38.797944>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,74.995110,0> translate<46.402800,-1.535000,39.593294> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.402800,-1.535000,40.416703>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.402800,-1.535000,39.593294>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,-90.000000,0> translate<46.402800,-1.535000,39.593294> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.402800,-1.535000,40.416703>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.615913,-1.535000,41.212053>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,-74.995110,0> translate<46.402800,-1.535000,40.416703> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.615913,-1.535000,38.797944>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.027616,-1.535000,38.084853>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,59.996037,0> translate<46.615913,-1.535000,38.797944> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<46.615913,-1.535000,41.212053>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.027616,-1.535000,41.925144>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,-59.996037,0> translate<46.615913,-1.535000,41.212053> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.027616,-1.535000,38.084853>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.609853,-1.535000,37.502616>}
box{<0,0,-0.711200><0.823408,0.035000,0.711200> rotate<0,44.997030,0> translate<47.027616,-1.535000,38.084853> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.027616,-1.535000,41.925144>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.609853,-1.535000,42.507381>}
box{<0,0,-0.711200><0.823408,0.035000,0.711200> rotate<0,-44.997030,0> translate<47.027616,-1.535000,41.925144> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.037800,-1.535000,2.128294>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.145275,-1.535000,1.727197>}
box{<0,0,-0.711200><0.415246,0.035000,0.711200> rotate<0,74.994862,0> translate<47.037800,-1.535000,2.128294> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.037800,-1.535000,2.951703>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.037800,-1.535000,2.128294>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,-90.000000,0> translate<47.037800,-1.535000,2.128294> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.037800,-1.535000,2.951703>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.250913,-1.535000,3.747053>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,-74.995110,0> translate<47.037800,-1.535000,2.951703> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.250913,-1.535000,3.747053>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.662616,-1.535000,4.460144>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,-59.996037,0> translate<47.250913,-1.535000,3.747053> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.609853,-1.535000,37.502616>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.322944,-1.535000,37.090913>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,29.998024,0> translate<47.609853,-1.535000,37.502616> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.609853,-1.535000,42.507381>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.322944,-1.535000,42.919084>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,-29.998024,0> translate<47.609853,-1.535000,42.507381> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<47.662616,-1.535000,4.460144>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.244853,-1.535000,5.042381>}
box{<0,0,-0.711200><0.823408,0.035000,0.711200> rotate<0,-44.997030,0> translate<47.662616,-1.535000,4.460144> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.244853,-1.535000,5.042381>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.957944,-1.535000,5.454084>}
box{<0,0,-0.711200><0.823406,0.035000,0.711200> rotate<0,-29.998024,0> translate<48.244853,-1.535000,5.042381> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.322944,-1.535000,37.090913>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.118294,-1.535000,36.877800>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,14.998950,0> translate<48.322944,-1.535000,37.090913> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.322944,-1.535000,42.919084>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.118294,-1.535000,43.132197>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,-14.998950,0> translate<48.322944,-1.535000,42.919084> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<48.957944,-1.535000,5.454084>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.753294,-1.535000,5.667197>}
box{<0,0,-0.711200><0.823407,0.035000,0.711200> rotate<0,-14.998950,0> translate<48.957944,-1.535000,5.454084> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.118294,-1.535000,36.877800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.941703,-1.535000,36.877800>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,0.000000,0> translate<49.118294,-1.535000,36.877800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.118294,-1.535000,43.132197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.941703,-1.535000,43.132197>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,0.000000,0> translate<49.118294,-1.535000,43.132197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.753294,-1.535000,5.667197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.576703,-1.535000,5.667197>}
box{<0,0,-0.711200><0.823409,0.035000,0.711200> rotate<0,0.000000,0> translate<49.753294,-1.535000,5.667197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.941703,-1.535000,36.877800>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,37.067000>}
box{<0,0,-0.711200><0.731006,0.035000,0.711200> rotate<0,-14.999155,0> translate<49.941703,-1.535000,36.877800> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<49.941703,-1.535000,43.132197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,42.942997>}
box{<0,0,-0.711200><0.731006,0.035000,0.711200> rotate<0,14.999155,0> translate<49.941703,-1.535000,43.132197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.332069,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,36.982400>}
box{<0,0,-0.711200><0.315731,0.035000,0.711200> rotate<0,0.000000,0> translate<50.332069,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.576703,-1.535000,5.667197>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,5.648144>}
box{<0,0,-0.711200><0.073606,0.035000,0.711200> rotate<0,15.001096,0> translate<50.576703,-1.535000,5.667197> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,37.067000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,5.648144>}
box{<0,0,-0.711200><31.418856,0.035000,0.711200> rotate<0,-90.000000,0> translate<50.647800,-1.535000,5.648144> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,55.245000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<50.647800,-1.535000,42.942997>}
box{<0,0,-0.711200><12.302003,0.035000,0.711200> rotate<0,-90.000000,0> translate<50.647800,-1.535000,42.942997> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.724000,-1.535000,71.999000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.724000,-1.535000,69.850000>}
box{<0,0,-0.635000><2.149000,0.035000,0.635000> rotate<0,-90.000000,0> translate<50.724000,-1.535000,69.850000> }
texture{col_pol}
}
#end
union{
cylinder{<5.585000,0.038000,6.875000><5.585000,-1.538000,6.875000>0.508000}
cylinder{<10.665000,0.038000,6.875000><10.665000,-1.538000,6.875000>0.508000}
cylinder{<10.795000,0.038000,38.100000><10.795000,-1.538000,38.100000>0.406400}
cylinder{<10.795000,0.038000,45.720000><10.795000,-1.538000,45.720000>0.406400}
cylinder{<13.335000,0.038000,38.100000><13.335000,-1.538000,38.100000>0.406400}
cylinder{<13.335000,0.038000,45.720000><13.335000,-1.538000,45.720000>0.406400}
cylinder{<17.145000,0.038000,38.100000><17.145000,-1.538000,38.100000>0.406400}
cylinder{<17.145000,0.038000,45.720000><17.145000,-1.538000,45.720000>0.406400}
cylinder{<19.685000,0.038000,38.100000><19.685000,-1.538000,38.100000>0.406400}
cylinder{<19.685000,0.038000,45.720000><19.685000,-1.538000,45.720000>0.406400}
cylinder{<22.225000,0.038000,38.100000><22.225000,-1.538000,38.100000>0.406400}
cylinder{<22.225000,0.038000,45.720000><22.225000,-1.538000,45.720000>0.406400}
cylinder{<26.035000,0.038000,38.100000><26.035000,-1.538000,38.100000>0.406400}
cylinder{<26.035000,0.038000,45.720000><26.035000,-1.538000,45.720000>0.406400}
cylinder{<28.575000,0.038000,38.100000><28.575000,-1.538000,38.100000>0.406400}
cylinder{<28.575000,0.038000,45.720000><28.575000,-1.538000,45.720000>0.406400}
cylinder{<31.115000,0.038000,38.100000><31.115000,-1.538000,38.100000>0.406400}
cylinder{<31.115000,0.038000,45.720000><31.115000,-1.538000,45.720000>0.406400}
cylinder{<34.925000,0.038000,38.100000><34.925000,-1.538000,38.100000>0.406400}
cylinder{<34.925000,0.038000,45.720000><34.925000,-1.538000,45.720000>0.406400}
cylinder{<37.465000,0.038000,38.100000><37.465000,-1.538000,38.100000>0.406400}
cylinder{<37.465000,0.038000,45.720000><37.465000,-1.538000,45.720000>0.406400}
cylinder{<40.005000,0.038000,38.100000><40.005000,-1.538000,38.100000>0.406400}
cylinder{<40.005000,0.038000,45.720000><40.005000,-1.538000,45.720000>0.406400}
cylinder{<42.545000,0.038000,38.100000><42.545000,-1.538000,38.100000>0.406400}
cylinder{<42.545000,0.038000,45.720000><42.545000,-1.538000,45.720000>0.406400}
cylinder{<15.875000,0.038000,2.540000><15.875000,-1.538000,2.540000>0.406400}
cylinder{<18.415000,0.038000,2.540000><18.415000,-1.538000,2.540000>0.406400}
cylinder{<20.955000,0.038000,2.540000><20.955000,-1.538000,2.540000>0.406400}
cylinder{<23.495000,0.038000,2.540000><23.495000,-1.538000,2.540000>0.406400}
cylinder{<26.035000,0.038000,2.540000><26.035000,-1.538000,2.540000>0.406400}
cylinder{<28.575000,0.038000,2.540000><28.575000,-1.538000,2.540000>0.406400}
cylinder{<31.115000,0.038000,2.540000><31.115000,-1.538000,2.540000>0.406400}
cylinder{<33.655000,0.038000,2.540000><33.655000,-1.538000,2.540000>0.406400}
cylinder{<33.655000,0.038000,10.160000><33.655000,-1.538000,10.160000>0.406400}
cylinder{<31.115000,0.038000,10.160000><31.115000,-1.538000,10.160000>0.406400}
cylinder{<28.575000,0.038000,10.160000><28.575000,-1.538000,10.160000>0.406400}
cylinder{<26.035000,0.038000,10.160000><26.035000,-1.538000,10.160000>0.406400}
cylinder{<23.495000,0.038000,10.160000><23.495000,-1.538000,10.160000>0.406400}
cylinder{<20.955000,0.038000,10.160000><20.955000,-1.538000,10.160000>0.406400}
cylinder{<18.415000,0.038000,10.160000><18.415000,-1.538000,10.160000>0.406400}
cylinder{<15.875000,0.038000,10.160000><15.875000,-1.538000,10.160000>0.406400}
cylinder{<15.875000,0.038000,22.860000><15.875000,-1.538000,22.860000>0.406400}
cylinder{<18.415000,0.038000,22.860000><18.415000,-1.538000,22.860000>0.406400}
cylinder{<20.955000,0.038000,22.860000><20.955000,-1.538000,22.860000>0.406400}
cylinder{<23.495000,0.038000,22.860000><23.495000,-1.538000,22.860000>0.406400}
cylinder{<26.035000,0.038000,22.860000><26.035000,-1.538000,22.860000>0.406400}
cylinder{<28.575000,0.038000,22.860000><28.575000,-1.538000,22.860000>0.406400}
cylinder{<31.115000,0.038000,22.860000><31.115000,-1.538000,22.860000>0.406400}
cylinder{<33.655000,0.038000,22.860000><33.655000,-1.538000,22.860000>0.406400}
cylinder{<33.655000,0.038000,30.480000><33.655000,-1.538000,30.480000>0.406400}
cylinder{<31.115000,0.038000,30.480000><31.115000,-1.538000,30.480000>0.406400}
cylinder{<28.575000,0.038000,30.480000><28.575000,-1.538000,30.480000>0.406400}
cylinder{<26.035000,0.038000,30.480000><26.035000,-1.538000,30.480000>0.406400}
cylinder{<23.495000,0.038000,30.480000><23.495000,-1.538000,30.480000>0.406400}
cylinder{<20.955000,0.038000,30.480000><20.955000,-1.538000,30.480000>0.406400}
cylinder{<18.415000,0.038000,30.480000><18.415000,-1.538000,30.480000>0.406400}
cylinder{<15.875000,0.038000,30.480000><15.875000,-1.538000,30.480000>0.406400}
cylinder{<4.445000,0.038000,13.970000><4.445000,-1.538000,13.970000>0.457200}
cylinder{<4.445000,0.038000,16.510000><4.445000,-1.538000,16.510000>0.457200}
cylinder{<4.445000,0.038000,19.050000><4.445000,-1.538000,19.050000>0.457200}
cylinder{<4.445000,0.038000,24.130000><4.445000,-1.538000,24.130000>0.457200}
cylinder{<4.445000,0.038000,21.590000><4.445000,-1.538000,21.590000>0.457200}
cylinder{<5.080000,0.038000,66.675000><5.080000,-1.538000,66.675000>0.558800}
cylinder{<7.620000,0.038000,66.675000><7.620000,-1.538000,66.675000>0.558800}
cylinder{<10.160000,0.038000,66.675000><10.160000,-1.538000,66.675000>0.558800}
cylinder{<17.780000,0.038000,66.675000><17.780000,-1.538000,66.675000>0.558800}
cylinder{<20.320000,0.038000,66.675000><20.320000,-1.538000,66.675000>0.558800}
cylinder{<22.860000,0.038000,66.675000><22.860000,-1.538000,66.675000>0.558800}
cylinder{<30.480000,0.038000,66.675000><30.480000,-1.538000,66.675000>0.558800}
cylinder{<33.020000,0.038000,66.675000><33.020000,-1.538000,66.675000>0.558800}
cylinder{<35.560000,0.038000,66.675000><35.560000,-1.538000,66.675000>0.558800}
cylinder{<43.180000,0.038000,66.675000><43.180000,-1.538000,66.675000>0.558800}
cylinder{<45.720000,0.038000,66.675000><45.720000,-1.538000,66.675000>0.558800}
cylinder{<48.260000,0.038000,66.675000><48.260000,-1.538000,66.675000>0.558800}
cylinder{<17.780000,0.038000,47.625000><17.780000,-1.538000,47.625000>0.406400}
cylinder{<17.780000,0.038000,62.865000><17.780000,-1.538000,62.865000>0.406400}
cylinder{<5.080000,0.038000,47.625000><5.080000,-1.538000,47.625000>0.406400}
cylinder{<5.080000,0.038000,62.865000><5.080000,-1.538000,62.865000>0.406400}
cylinder{<10.477500,0.038000,52.387500><10.477500,-1.538000,52.387500>0.508000}
cylinder{<10.477500,0.038000,57.467500><10.477500,-1.538000,57.467500>0.508000}
cylinder{<23.177500,0.038000,52.387500><23.177500,-1.538000,52.387500>0.508000}
cylinder{<23.177500,0.038000,57.467500><23.177500,-1.538000,57.467500>0.508000}
cylinder{<30.480000,0.038000,47.625000><30.480000,-1.538000,47.625000>0.406400}
cylinder{<30.480000,0.038000,62.865000><30.480000,-1.538000,62.865000>0.406400}
cylinder{<35.877500,0.038000,52.387500><35.877500,-1.538000,52.387500>0.508000}
cylinder{<35.877500,0.038000,57.467500><35.877500,-1.538000,57.467500>0.508000}
cylinder{<43.180000,0.038000,48.895000><43.180000,-1.538000,48.895000>0.406400}
cylinder{<43.180000,0.038000,64.135000><43.180000,-1.538000,64.135000>0.406400}
cylinder{<48.577500,0.038000,52.387500><48.577500,-1.538000,52.387500>0.508000}
cylinder{<48.577500,0.038000,57.467500><48.577500,-1.538000,57.467500>0.508000}
cylinder{<1.905000,0.038000,62.865000><1.905000,-1.538000,62.865000>0.406400}
cylinder{<1.905000,0.038000,55.245000><1.905000,-1.538000,55.245000>0.406400}
cylinder{<14.922500,0.038000,62.865000><14.922500,-1.538000,62.865000>0.406400}
cylinder{<14.922500,0.038000,55.245000><14.922500,-1.538000,55.245000>0.406400}
cylinder{<27.622500,0.038000,62.865000><27.622500,-1.538000,62.865000>0.406400}
cylinder{<27.622500,0.038000,55.245000><27.622500,-1.538000,55.245000>0.406400}
cylinder{<40.005000,0.038000,62.865000><40.005000,-1.538000,62.865000>0.406400}
cylinder{<40.005000,0.038000,55.245000><40.005000,-1.538000,55.245000>0.406400}
cylinder{<8.890000,0.038000,60.325000><8.890000,-1.538000,60.325000>0.406400}
cylinder{<10.795000,0.038000,61.595000><10.795000,-1.538000,61.595000>0.406400}
cylinder{<8.890000,0.038000,62.865000><8.890000,-1.538000,62.865000>0.406400}
cylinder{<21.590000,0.038000,60.325000><21.590000,-1.538000,60.325000>0.406400}
cylinder{<23.495000,0.038000,61.595000><23.495000,-1.538000,61.595000>0.406400}
cylinder{<21.590000,0.038000,62.865000><21.590000,-1.538000,62.865000>0.406400}
cylinder{<34.290000,0.038000,60.325000><34.290000,-1.538000,60.325000>0.406400}
cylinder{<36.195000,0.038000,61.595000><36.195000,-1.538000,61.595000>0.406400}
cylinder{<34.290000,0.038000,62.865000><34.290000,-1.538000,62.865000>0.406400}
cylinder{<46.990000,0.038000,60.325000><46.990000,-1.538000,60.325000>0.406400}
cylinder{<48.895000,0.038000,61.595000><48.895000,-1.538000,61.595000>0.406400}
cylinder{<46.990000,0.038000,62.865000><46.990000,-1.538000,62.865000>0.406400}
//Holes(fast)/Vias
cylinder{<18.415000,0.038000,15.240000><18.415000,-1.538000,15.240000>0.300000 }
cylinder{<28.575000,0.038000,15.240000><28.575000,-1.538000,15.240000>0.300000 }
cylinder{<15.875000,0.038000,20.320000><15.875000,-1.538000,20.320000>0.300000 }
cylinder{<36.195000,0.038000,20.320000><36.195000,-1.538000,20.320000>0.300000 }
cylinder{<13.335000,0.038000,12.700000><13.335000,-1.538000,12.700000>0.300000 }
cylinder{<31.115000,0.038000,12.700000><31.115000,-1.538000,12.700000>0.300000 }
cylinder{<15.875000,0.038000,17.780000><15.875000,-1.538000,17.780000>0.300000 }
cylinder{<28.575000,0.038000,17.780000><28.575000,-1.538000,17.780000>0.300000 }
cylinder{<31.115000,0.038000,17.780000><31.115000,-1.538000,17.780000>0.300000 }
cylinder{<41.275000,0.038000,17.780000><41.275000,-1.538000,17.780000>0.300000 }
cylinder{<11.430000,0.038000,21.590000><11.430000,-1.538000,21.590000>0.300000 }
cylinder{<11.430000,0.038000,30.480000><11.430000,-1.538000,30.480000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.982000,0.000000,6.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.236000,0.000000,6.875000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.982000,0.000000,6.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.236000,0.000000,6.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.236000,0.000000,5.732000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.236000,0.000000,5.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.236000,0.000000,5.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.871000,0.000000,5.732000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.236000,0.000000,5.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.871000,0.000000,5.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.871000,0.000000,8.018000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.871000,0.000000,8.018000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.871000,0.000000,8.018000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.236000,0.000000,8.018000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.236000,0.000000,8.018000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.236000,0.000000,8.018000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.236000,0.000000,6.875000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.236000,0.000000,6.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.760000,0.000000,6.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.268000,0.000000,6.875000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.760000,0.000000,6.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.315000,0.000000,8.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.315000,0.000000,7.764000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.315000,0.000000,7.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.696000,0.000000,8.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.934000,0.000000,8.145000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.934000,0.000000,8.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.268000,0.000000,6.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.776000,0.000000,6.875000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.268000,0.000000,6.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.474000,0.000000,6.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.982000,0.000000,6.875000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.474000,0.000000,6.875000> }
difference{
cylinder{<8.125000,0,6.875000><8.125000,0.036000,6.875000>5.156200 translate<0,0.000000,0>}
cylinder{<8.125000,-0.1,6.875000><8.125000,0.135000,6.875000>5.003800 translate<0,0.000000,0>}}
box{<-0.317500,0,-1.143000><0.317500,0.036000,1.143000> rotate<0,-0.000000,0> translate<8.696500,0.000000,6.875000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<10.795000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<10.795000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<10.795000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<10.795000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<10.795000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<10.795000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<10.160000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<10.795000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<11.557000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.033000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.033000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<11.557000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.033000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.779000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.033000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.811000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<10.795000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<10.795000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<10.795000,0.000000,44.513500>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<13.335000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<13.335000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<13.335000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<13.335000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<13.335000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<13.335000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.335000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.700000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<12.700000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.335000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<13.335000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.335000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.700000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.097000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.573000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.573000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.097000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.573000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.319000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.573000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.351000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<13.335000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.335000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.335000,0.000000,44.513500>}
//D3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.145000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.145000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<17.145000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.145000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.145000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.145000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.510000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<16.510000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<17.145000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.510000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<17.907000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.383000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.383000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<17.907000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.383000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.129000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.383000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.161000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<17.145000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<17.145000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<17.145000,0.000000,44.513500>}
//D4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<19.685000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<19.685000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<19.685000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<19.685000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<19.685000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<19.685000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.685000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<19.050000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.685000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<19.685000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.447000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.923000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.923000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.447000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.923000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.669000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.923000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.701000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<19.685000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<19.685000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<19.685000,0.000000,44.513500>}
//D5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<22.225000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<22.225000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<22.225000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<22.225000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<22.225000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<22.225000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.225000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<21.590000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.225000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<22.225000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.987000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.463000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.463000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.987000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.463000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.209000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.463000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.241000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<22.225000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<22.225000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<22.225000,0.000000,44.513500>}
//D6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<26.035000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<26.035000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<26.035000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<26.035000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<26.035000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<26.035000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.035000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.400000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<25.400000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.035000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<26.035000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.035000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.400000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<26.797000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.273000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<26.797000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.273000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.019000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.051000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<26.035000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<26.035000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<26.035000,0.000000,44.513500>}
//D7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.575000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.575000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<28.575000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.575000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.575000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<28.575000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.575000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.940000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<27.940000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.575000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<28.575000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.940000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<29.337000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.813000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<29.337000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.813000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.591000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<28.575000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<28.575000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<28.575000,0.000000,44.513500>}
//D8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.115000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.115000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<31.115000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.115000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.115000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<31.115000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.115000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.480000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<30.480000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.115000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<31.115000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.115000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.480000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<31.877000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<30.353000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<31.877000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<30.353000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.099000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.131000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<31.115000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.115000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.115000,0.000000,44.513500>}
//D9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.925000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.925000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<34.925000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.925000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.925000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<34.925000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.925000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.290000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<34.290000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.925000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<34.925000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.290000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<35.687000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.163000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<34.163000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<35.687000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<34.163000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.909000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.163000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.941000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<34.925000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,44.513500>}
//D10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.465000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.465000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<37.465000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.465000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.465000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<37.465000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.465000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<36.830000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.465000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<37.465000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<38.227000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.703000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<38.227000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.703000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.449000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.481000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<37.465000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<37.465000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<37.465000,0.000000,44.513500>}
//D11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.005000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.005000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<40.005000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.005000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.005000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<40.005000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.005000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.370000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<39.370000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.005000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<40.005000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.005000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.370000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.767000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.243000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<39.243000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.767000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<39.243000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.989000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.243000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.021000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<40.005000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<40.005000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<40.005000,0.000000,44.513500>}
//D12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<42.545000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<42.545000,0.000000,38.989000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<42.545000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<42.545000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<42.545000,0.000000,44.831000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<42.545000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.545000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,41.910000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<41.910000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,40.386000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.545000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,40.894000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<42.545000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,41.910000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.307000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,39.624000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.783000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.307000,0.000000,43.942000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.783000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.529000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,44.196000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,39.878000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.561000,0.000000,39.878000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<42.545000,0.000000,43.561000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<42.545000,0.000000,39.306500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<42.545000,0.000000,44.513500>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,9.271000>}
box{<0,0,-0.076200><20.320000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,9.271000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,3.429000>}
box{<0,0,-0.076200><20.320000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,3.429000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.925000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,7.366000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.605000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,5.334000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.605000,0.000000,5.334000> }
object{ARC(1.016000,0.152400,270.000000,450.000000,0.036000) translate<14.605000,0.000000,6.350000>}
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,29.591000>}
box{<0,0,-0.076200><20.320000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,23.749000>}
box{<0,0,-0.076200><20.320000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,23.749000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.925000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,27.686000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.605000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,25.654000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.605000,0.000000,25.654000> }
object{ARC(1.016000,0.152400,270.000000,450.000000,0.036000) translate<14.605000,0.000000,26.670000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,12.700000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,18.034000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,18.034000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,18.034000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.715000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,18.034000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.461000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,20.320000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<5.461000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,20.320000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,20.320000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,17.780000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,15.494000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,15.494000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,15.240000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,12.954000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,12.954000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,17.780000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<5.461000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,15.494000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.461000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,15.240000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<5.461000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,12.954000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.461000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,15.494000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.715000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,12.954000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.715000,0.000000,12.954000> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-90.000000,0> translate<4.445000,0.000000,13.970000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-90.000000,0> translate<4.445000,0.000000,16.510000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-90.000000,0> translate<4.445000,0.000000,19.050000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,22.606000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<5.461000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,23.114000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.461000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,22.606000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,23.114000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,25.146000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.175000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,25.146000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,20.320000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,22.606000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.175000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,20.320000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,20.320000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.461000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,22.606000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.715000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,25.146000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.715000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,25.146000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<5.461000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,25.400000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,25.400000> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-180.000000,0> translate<4.445000,0.000000,21.590000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-180.000000,0> translate<4.445000,0.000000,24.130000>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.413000,0.000000,71.755000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.827000,0.000000,71.755000>}
box{<0,0,-0.063500><10.414000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.413000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.048000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.192000,0.000000,72.390000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.048000,0.000000,72.390000> }
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<10.160000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<7.620000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<5.080000,0.000000,68.643500>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<5.080000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<7.620000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<10.160000,0.000000,70.358000>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<5.080000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<7.620000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<10.160000,0.000000,67.373500>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,71.755000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.527000,0.000000,71.755000>}
box{<0,0,-0.063500><10.414000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.113000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.748000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,72.390000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<15.748000,0.000000,72.390000> }
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<22.860000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<20.320000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<17.780000,0.000000,68.643500>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<17.780000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<20.320000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<22.860000,0.000000,70.358000>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<17.780000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<20.320000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<22.860000,0.000000,67.373500>}
//Q3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.813000,0.000000,71.755000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.227000,0.000000,71.755000>}
box{<0,0,-0.063500><10.414000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.813000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.448000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.592000,0.000000,72.390000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<28.448000,0.000000,72.390000> }
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<35.560000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<33.020000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<30.480000,0.000000,68.643500>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<30.480000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<33.020000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<35.560000,0.000000,70.358000>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<30.480000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<33.020000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<35.560000,0.000000,67.373500>}
//Q4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,71.755000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,71.755000>}
box{<0,0,-0.063500><10.414000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.513000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<41.148000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.292000,0.000000,72.390000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<41.148000,0.000000,72.390000> }
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<48.260000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<45.720000,0.000000,68.643500>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-0.000000,0> translate<43.180000,0.000000,68.643500>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<43.180000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<45.720000,0.000000,70.358000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-0.000000,0> translate<48.260000,0.000000,70.358000>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<43.180000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<45.720000,0.000000,67.373500>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-0.000000,0> translate<48.260000,0.000000,67.373500>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,61.849000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.780000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,48.641000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<17.780000,0.000000,48.641000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.891000,0.000000,52.324000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<18.669000,0.000000,52.324000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<18.669000,0.000000,58.166000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.891000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,52.070000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,52.705000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.637000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,52.705000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.637000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,52.705000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.923000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,52.705000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<18.796000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,57.785000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.637000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,52.832000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.764000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,57.785000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.796000,0.000000,57.658000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,52.832000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.796000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,57.785000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.637000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,57.785000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.923000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,58.420000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,59.309000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.780000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,51.181000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,90.000000,0> translate<17.780000,0.000000,51.181000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.780000,0.000000,58.851800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.780000,0.000000,51.638200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.780000,0.000000,61.391800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.780000,0.000000,49.098200>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,61.849000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<5.080000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,48.641000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<5.080000,0.000000,48.641000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<4.191000,0.000000,52.324000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<5.969000,0.000000,52.324000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<5.969000,0.000000,58.166000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<4.191000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,52.070000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.937000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.937000,0.000000,52.705000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.937000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.937000,0.000000,52.705000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.937000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,52.705000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.223000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,52.705000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<6.096000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.937000,0.000000,57.785000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<3.937000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,52.832000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.064000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,57.785000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.096000,0.000000,57.658000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,52.832000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.096000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.937000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.937000,0.000000,57.785000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.937000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,57.785000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.223000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,58.420000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,59.309000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,-90.000000,0> translate<5.080000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<5.080000,0.000000,51.181000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,90.000000,0> translate<5.080000,0.000000,51.181000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<5.080000,0.000000,58.851800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<5.080000,0.000000,51.638200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<5.080000,0.000000,61.391800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<5.080000,0.000000,49.098200>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.652500,0.000000,49.847500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.652500,0.000000,54.927500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.652500,0.000000,54.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.302500,0.000000,54.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.302500,0.000000,49.847500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.302500,0.000000,49.847500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.937500,0.000000,49.212500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.017500,0.000000,49.212500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.937500,0.000000,49.212500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.017500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.477500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.477500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<10.477500,0.000000,57.467500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<10.477500,0.000000,55.816500>}
box{<0,0,-0.406400><1.651000,0.036000,0.406400> rotate<0,-90.000000,0> translate<10.477500,0.000000,55.816500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<10.477500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<10.477500,0.000000,54.292500>}
box{<0,0,-0.406400><1.270000,0.036000,0.406400> rotate<0,-90.000000,0> translate<10.477500,0.000000,54.292500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.477500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.937500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.937500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<10.477500,0.000000,53.911500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<10.477500,0.000000,52.387500>}
box{<0,0,-0.406400><1.524000,0.036000,0.406400> rotate<0,-90.000000,0> translate<10.477500,0.000000,52.387500> }
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<13.017500,0.000000,49.847500>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<13.017500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<7.937500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<7.937500,0.000000,49.847500>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,49.847500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,54.927500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.352500,0.000000,54.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.002500,0.000000,54.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.002500,0.000000,49.847500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.002500,0.000000,49.847500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,49.212500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,49.212500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.637500,0.000000,49.212500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.177500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.177500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<23.177500,0.000000,57.467500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<23.177500,0.000000,55.816500>}
box{<0,0,-0.406400><1.651000,0.036000,0.406400> rotate<0,-90.000000,0> translate<23.177500,0.000000,55.816500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<23.177500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<23.177500,0.000000,54.292500>}
box{<0,0,-0.406400><1.270000,0.036000,0.406400> rotate<0,-90.000000,0> translate<23.177500,0.000000,54.292500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.177500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.637500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<23.177500,0.000000,53.911500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<23.177500,0.000000,52.387500>}
box{<0,0,-0.406400><1.524000,0.036000,0.406400> rotate<0,-90.000000,0> translate<23.177500,0.000000,52.387500> }
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<25.717500,0.000000,49.847500>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<25.717500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<20.637500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<20.637500,0.000000,49.847500>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,61.849000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,48.641000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<30.480000,0.000000,48.641000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<29.591000,0.000000,52.324000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<31.369000,0.000000,52.324000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<31.369000,0.000000,58.166000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<29.591000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,52.070000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.591000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,52.705000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.337000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,52.705000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.337000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,52.705000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.623000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,52.705000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.496000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,57.785000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.337000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,52.832000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.464000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,57.785000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.496000,0.000000,57.658000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,52.832000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.496000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,57.785000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.337000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,57.785000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.623000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,58.420000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.591000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,59.309000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,0.000000,51.181000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,90.000000,0> translate<30.480000,0.000000,51.181000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,0.000000,58.851800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,0.000000,51.638200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,0.000000,61.391800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,0.000000,49.098200>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.052500,0.000000,49.847500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.052500,0.000000,54.927500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.052500,0.000000,54.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.702500,0.000000,54.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.702500,0.000000,49.847500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.702500,0.000000,49.847500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.337500,0.000000,49.212500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.417500,0.000000,49.212500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.337500,0.000000,49.212500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.417500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.877500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<35.877500,0.000000,57.467500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<35.877500,0.000000,55.816500>}
box{<0,0,-0.406400><1.651000,0.036000,0.406400> rotate<0,-90.000000,0> translate<35.877500,0.000000,55.816500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<35.877500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<35.877500,0.000000,54.292500>}
box{<0,0,-0.406400><1.270000,0.036000,0.406400> rotate<0,-90.000000,0> translate<35.877500,0.000000,54.292500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.337500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.337500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<35.877500,0.000000,53.911500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<35.877500,0.000000,52.387500>}
box{<0,0,-0.406400><1.524000,0.036000,0.406400> rotate<0,-90.000000,0> translate<35.877500,0.000000,52.387500> }
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<38.417500,0.000000,49.847500>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<38.417500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<33.337500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<33.337500,0.000000,49.847500>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,63.119000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,49.911000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<43.180000,0.000000,49.911000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.291000,0.000000,53.594000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.069000,0.000000,53.594000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.069000,0.000000,59.436000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.291000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,53.340000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,53.975000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.037000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,53.975000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.037000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,53.975000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.323000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,53.975000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.196000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.037000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,54.102000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.164000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.196000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,54.102000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.196000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.037000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.323000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,59.690000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,60.579000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,0.000000,60.579000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,52.451000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,90.000000,0> translate<43.180000,0.000000,52.451000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,0.000000,60.121800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,0.000000,52.908200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,0.000000,62.661800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,0.000000,50.368200>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,0.000000,49.847500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,0.000000,54.927500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.752500,0.000000,54.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.402500,0.000000,54.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.402500,0.000000,49.847500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.402500,0.000000,49.847500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,0.000000,49.212500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.117500,0.000000,49.212500>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.037500,0.000000,49.212500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.117500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.577500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.577500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<48.577500,0.000000,57.467500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<48.577500,0.000000,55.816500>}
box{<0,0,-0.406400><1.651000,0.036000,0.406400> rotate<0,-90.000000,0> translate<48.577500,0.000000,55.816500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<48.577500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<48.577500,0.000000,54.292500>}
box{<0,0,-0.406400><1.270000,0.036000,0.406400> rotate<0,-90.000000,0> translate<48.577500,0.000000,54.292500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.577500,0.000000,55.562500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,0.000000,55.562500>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.037500,0.000000,55.562500> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<48.577500,0.000000,53.911500>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<48.577500,0.000000,52.387500>}
box{<0,0,-0.406400><1.524000,0.036000,0.406400> rotate<0,-90.000000,0> translate<48.577500,0.000000,52.387500> }
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<51.117500,0.000000,49.847500>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<51.117500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<46.037500,0.000000,54.927500>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<46.037500,0.000000,49.847500>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<1.905000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<1.905000,0.000000,62.484000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<1.905000,0.000000,62.484000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<2.794000,0.000000,61.976000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<1.016000,0.000000,61.976000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<1.016000,0.000000,56.134000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<2.794000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.016000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,62.230000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.016000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.048000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.048000,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.048000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.048000,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.921000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.762000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<0.762000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.048000,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<2.921000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.921000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<0.762000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<0.889000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.048000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.048000,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.048000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<0.762000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.016000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,55.880000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.016000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<1.905000,0.000000,55.626000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<1.905000,0.000000,55.245000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<1.905000,0.000000,55.245000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<1.905000,0.000000,62.357000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<1.905000,0.000000,55.753000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.922500,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.922500,0.000000,62.484000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<14.922500,0.000000,62.484000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<15.811500,0.000000,61.976000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.033500,0.000000,61.976000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.033500,0.000000,56.134000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<15.811500,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.033500,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.811500,0.000000,62.230000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.033500,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.065500,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.065500,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.065500,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.938500,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.065500,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.938500,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779500,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779500,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.779500,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.906500,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779500,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.779500,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.938500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.065500,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.938500,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.938500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.938500,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.938500,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.906500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779500,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.779500,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.906500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.906500,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.906500,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.065500,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.065500,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.065500,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779500,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779500,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.779500,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.033500,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.811500,0.000000,55.880000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.033500,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.922500,0.000000,55.626000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.922500,0.000000,55.245000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<14.922500,0.000000,55.245000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<14.922500,0.000000,62.357000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<14.922500,0.000000,55.753000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.622500,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.622500,0.000000,62.484000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.622500,0.000000,62.484000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<28.511500,0.000000,61.976000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<26.733500,0.000000,61.976000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<26.733500,0.000000,56.134000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<28.511500,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.733500,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.511500,0.000000,62.230000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.733500,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.765500,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.765500,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.765500,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.638500,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.765500,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.638500,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.479500,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.606500,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.479500,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.638500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.765500,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.638500,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.638500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.638500,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.638500,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.606500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.479500,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.606500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.606500,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.606500,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.765500,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.765500,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.765500,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.479500,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.733500,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.511500,0.000000,55.880000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.733500,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.622500,0.000000,55.626000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.622500,0.000000,55.245000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.622500,0.000000,55.245000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<27.622500,0.000000,62.357000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<27.622500,0.000000,55.753000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.005000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.005000,0.000000,62.484000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.005000,0.000000,62.484000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.894000,0.000000,61.976000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<39.116000,0.000000,61.976000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<39.116000,0.000000,56.134000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.894000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,62.230000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.116000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.148000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.021000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,61.595000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.862000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,61.595000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<38.862000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.021000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.021000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,56.515000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.862000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,61.468000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.989000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.148000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,56.515000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.862000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,55.880000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.116000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.005000,0.000000,55.626000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.005000,0.000000,55.245000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.005000,0.000000,55.245000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<40.005000,0.000000,62.357000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<40.005000,0.000000,55.753000>}
//T1 silk screen
object{ARC(2.667019,0.127000,95.463904,128.244944,0.036000) translate<8.889950,0.000000,61.595000>}
object{ARC(2.667025,0.127000,17.146920,95.465397,0.036000) translate<8.890019,0.000000,61.595000>}
object{ARC(2.666963,0.127000,231.753122,342.852662,0.036000) translate<8.889984,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.239000,0.000000,63.689500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.239000,0.000000,59.500500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.239000,0.000000,59.500500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,63.848700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,61.881300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.636000,0.000000,61.881300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,64.249900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,63.848700>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.636000,0.000000,63.848700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,61.881300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,61.308700>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.636000,0.000000,61.308700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,59.341300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,58.940100>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.636000,0.000000,58.940100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,61.308700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,59.341300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.636000,0.000000,59.341300> }
object{ARC(2.667044,0.127000,342.853205,377.146795,0.036000) translate<8.890000,0.000000,61.595000>}
//T2 silk screen
object{ARC(2.667019,0.127000,95.463904,128.244944,0.036000) translate<21.589950,0.000000,61.595000>}
object{ARC(2.667025,0.127000,17.146920,95.465397,0.036000) translate<21.590019,0.000000,61.595000>}
object{ARC(2.666963,0.127000,231.753122,342.852662,0.036000) translate<21.589984,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.939000,0.000000,63.689500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.939000,0.000000,59.500500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.939000,0.000000,59.500500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,63.848700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,61.881300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.336000,0.000000,61.881300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,64.249900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,63.848700>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.336000,0.000000,63.848700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,61.881300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,61.308700>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.336000,0.000000,61.308700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,59.341300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,58.940100>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.336000,0.000000,58.940100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,61.308700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336000,0.000000,59.341300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.336000,0.000000,59.341300> }
object{ARC(2.667044,0.127000,342.853205,377.146795,0.036000) translate<21.590000,0.000000,61.595000>}
//T3 silk screen
object{ARC(2.667019,0.127000,95.463904,128.244944,0.036000) translate<34.289950,0.000000,61.595000>}
object{ARC(2.667025,0.127000,17.146920,95.465397,0.036000) translate<34.290019,0.000000,61.595000>}
object{ARC(2.666963,0.127000,231.753122,342.852662,0.036000) translate<34.289984,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.639000,0.000000,63.689500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.639000,0.000000,59.500500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.639000,0.000000,59.500500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,63.848700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,61.881300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<34.036000,0.000000,61.881300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,64.249900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,63.848700>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<34.036000,0.000000,63.848700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,61.881300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,61.308700>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,-90.000000,0> translate<34.036000,0.000000,61.308700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,59.341300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,58.940100>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<34.036000,0.000000,58.940100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,61.308700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.036000,0.000000,59.341300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<34.036000,0.000000,59.341300> }
object{ARC(2.667044,0.127000,342.853205,377.146795,0.036000) translate<34.290000,0.000000,61.595000>}
//T4 silk screen
object{ARC(2.667019,0.127000,95.463904,128.244944,0.036000) translate<46.989950,0.000000,61.595000>}
object{ARC(2.667025,0.127000,17.146920,95.465397,0.036000) translate<46.990019,0.000000,61.595000>}
object{ARC(2.666963,0.127000,231.753122,342.852662,0.036000) translate<46.989984,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.339000,0.000000,63.689500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.339000,0.000000,59.500500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,-90.000000,0> translate<45.339000,0.000000,59.500500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,63.848700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,61.881300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.736000,0.000000,61.881300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,64.249900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,63.848700>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.736000,0.000000,63.848700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,61.881300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,61.308700>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.736000,0.000000,61.308700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,59.341300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,58.940100>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.736000,0.000000,58.940100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,61.308700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736000,0.000000,59.341300>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.736000,0.000000,59.341300> }
object{ARC(2.667044,0.127000,342.853205,377.146795,0.036000) translate<46.990000,0.000000,61.595000>}
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.197050,0.000000,5.232400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.319028,0.000000,5.232400>}
box{<0,0,-0.076200><0.121978,0.036000,0.076200> rotate<0,0.000000,0> translate<41.197050,0.000000,5.232400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.319259,0.000000,5.232400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.450831,0.000000,5.232400>}
box{<0,0,-0.076200><0.131572,0.036000,0.076200> rotate<0,0.000000,0> translate<47.319259,0.000000,5.232400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.039394,0.000000,5.384800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.527309,0.000000,5.384800>}
box{<0,0,-0.076200><0.487916,0.036000,0.076200> rotate<0,0.000000,0> translate<41.039394,0.000000,5.384800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.087837,0.000000,5.384800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.614116,0.000000,5.384800>}
box{<0,0,-0.076200><0.526278,0.036000,0.076200> rotate<0,0.000000,0> translate<47.087837,0.000000,5.384800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.881741,0.000000,5.537200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.735588,0.000000,5.537200>}
box{<0,0,-0.076200><0.853847,0.036000,0.076200> rotate<0,0.000000,0> translate<40.881741,0.000000,5.537200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.856416,0.000000,5.537200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.777400,0.000000,5.537200>}
box{<0,0,-0.076200><0.920984,0.036000,0.076200> rotate<0,0.000000,0> translate<46.856416,0.000000,5.537200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.724084,0.000000,5.689600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.943869,0.000000,5.689600>}
box{<0,0,-0.076200><1.219784,0.036000,0.076200> rotate<0,0.000000,0> translate<40.724084,0.000000,5.689600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.752819,0.000000,5.689600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.808613,0.000000,5.689600>}
box{<0,0,-0.076200><0.055794,0.036000,0.076200> rotate<0,0.000000,0> translate<42.752819,0.000000,5.689600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.912841,0.000000,5.689600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.977175,0.000000,5.689600>}
box{<0,0,-0.076200><0.064334,0.036000,0.076200> rotate<0,0.000000,0> translate<45.912841,0.000000,5.689600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.624994,0.000000,5.689600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.940688,0.000000,5.689600>}
box{<0,0,-0.076200><1.315694,0.036000,0.076200> rotate<0,0.000000,0> translate<46.624994,0.000000,5.689600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.566428,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.152147,0.000000,5.842000>}
box{<0,0,-0.076200><1.585719,0.036000,0.076200> rotate<0,0.000000,0> translate<40.566428,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.475728,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.866278,0.000000,5.842000>}
box{<0,0,-0.076200><0.390550,0.036000,0.076200> rotate<0,0.000000,0> translate<42.475728,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.850678,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.301025,0.000000,5.842000>}
box{<0,0,-0.076200><0.450347,0.036000,0.076200> rotate<0,0.000000,0> translate<45.850678,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.393572,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.103972,0.000000,5.842000>}
box{<0,0,-0.076200><1.710400,0.036000,0.076200> rotate<0,0.000000,0> translate<46.393572,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.540762,0.000000,5.994400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.923941,0.000000,5.994400>}
box{<0,0,-0.076200><2.383178,0.036000,0.076200> rotate<0,0.000000,0> translate<40.540762,0.000000,5.994400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.788516,0.000000,5.994400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.092241,0.000000,5.994400>}
box{<0,0,-0.076200><2.303725,0.036000,0.076200> rotate<0,0.000000,0> translate<45.788516,0.000000,5.994400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.647088,0.000000,6.146800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.981606,0.000000,6.146800>}
box{<0,0,-0.076200><2.334519,0.036000,0.076200> rotate<0,0.000000,0> translate<40.647088,0.000000,6.146800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.726350,0.000000,6.146800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.993003,0.000000,6.146800>}
box{<0,0,-0.076200><2.266653,0.036000,0.076200> rotate<0,0.000000,0> translate<45.726350,0.000000,6.146800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.753413,0.000000,6.299200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.039272,0.000000,6.299200>}
box{<0,0,-0.076200><2.285859,0.036000,0.076200> rotate<0,0.000000,0> translate<40.753413,0.000000,6.299200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.664188,0.000000,6.299200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.893766,0.000000,6.299200>}
box{<0,0,-0.076200><2.229578,0.036000,0.076200> rotate<0,0.000000,0> translate<45.664188,0.000000,6.299200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.859738,0.000000,6.451600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.096938,0.000000,6.451600>}
box{<0,0,-0.076200><2.237200,0.036000,0.076200> rotate<0,0.000000,0> translate<40.859738,0.000000,6.451600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.602025,0.000000,6.451600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.794528,0.000000,6.451600>}
box{<0,0,-0.076200><2.192503,0.036000,0.076200> rotate<0,0.000000,0> translate<45.602025,0.000000,6.451600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.966062,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.154600,0.000000,6.604000>}
box{<0,0,-0.076200><2.188538,0.036000,0.076200> rotate<0,0.000000,0> translate<40.966062,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.539863,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.695291,0.000000,6.604000>}
box{<0,0,-0.076200><2.155428,0.036000,0.076200> rotate<0,0.000000,0> translate<45.539863,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.072391,0.000000,6.756400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.212266,0.000000,6.756400>}
box{<0,0,-0.076200><2.139875,0.036000,0.076200> rotate<0,0.000000,0> translate<41.072391,0.000000,6.756400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.477700,0.000000,6.756400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.596053,0.000000,6.756400>}
box{<0,0,-0.076200><2.118353,0.036000,0.076200> rotate<0,0.000000,0> translate<45.477700,0.000000,6.756400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.178716,0.000000,6.908800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.269931,0.000000,6.908800>}
box{<0,0,-0.076200><2.091216,0.036000,0.076200> rotate<0,0.000000,0> translate<41.178716,0.000000,6.908800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.415534,0.000000,6.908800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.496816,0.000000,6.908800>}
box{<0,0,-0.076200><2.081281,0.036000,0.076200> rotate<0,0.000000,0> translate<45.415534,0.000000,6.908800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.228434,0.000000,7.061200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.327597,0.000000,7.061200>}
box{<0,0,-0.076200><2.099163,0.036000,0.076200> rotate<0,0.000000,0> translate<41.228434,0.000000,7.061200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353372,0.000000,7.061200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.473638,0.000000,7.061200>}
box{<0,0,-0.076200><2.120266,0.036000,0.076200> rotate<0,0.000000,0> translate<45.353372,0.000000,7.061200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.164934,0.000000,7.213600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.385263,0.000000,7.213600>}
box{<0,0,-0.076200><2.220328,0.036000,0.076200> rotate<0,0.000000,0> translate<41.164934,0.000000,7.213600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.291209,0.000000,7.213600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.526513,0.000000,7.213600>}
box{<0,0,-0.076200><2.235303,0.036000,0.076200> rotate<0,0.000000,0> translate<45.291209,0.000000,7.213600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.101434,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.442925,0.000000,7.366000>}
box{<0,0,-0.076200><2.341491,0.036000,0.076200> rotate<0,0.000000,0> translate<41.101434,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.229047,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.579384,0.000000,7.366000>}
box{<0,0,-0.076200><2.350338,0.036000,0.076200> rotate<0,0.000000,0> translate<45.229047,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.037934,0.000000,7.518400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.500591,0.000000,7.518400>}
box{<0,0,-0.076200><2.462656,0.036000,0.076200> rotate<0,0.000000,0> translate<41.037934,0.000000,7.518400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.166884,0.000000,7.518400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.632259,0.000000,7.518400>}
box{<0,0,-0.076200><2.465375,0.036000,0.076200> rotate<0,0.000000,0> translate<45.166884,0.000000,7.518400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.974434,0.000000,7.670800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.391666,0.000000,7.670800>}
box{<0,0,-0.076200><2.417231,0.036000,0.076200> rotate<0,0.000000,0> translate<40.974434,0.000000,7.670800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.212000,0.000000,7.670800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.685131,0.000000,7.670800>}
box{<0,0,-0.076200><2.473131,0.036000,0.076200> rotate<0,0.000000,0> translate<45.212000,0.000000,7.670800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.910934,0.000000,7.823200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.249425,0.000000,7.823200>}
box{<0,0,-0.076200><2.338491,0.036000,0.076200> rotate<0,0.000000,0> translate<40.910934,0.000000,7.823200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.364400,0.000000,7.823200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.738006,0.000000,7.823200>}
box{<0,0,-0.076200><2.373606,0.036000,0.076200> rotate<0,0.000000,0> translate<45.364400,0.000000,7.823200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.847434,0.000000,7.975600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.107184,0.000000,7.975600>}
box{<0,0,-0.076200><2.259750,0.036000,0.076200> rotate<0,0.000000,0> translate<40.847434,0.000000,7.975600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.516800,0.000000,7.975600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.790878,0.000000,7.975600>}
box{<0,0,-0.076200><2.274078,0.036000,0.076200> rotate<0,0.000000,0> translate<45.516800,0.000000,7.975600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.783934,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.964944,0.000000,8.128000>}
box{<0,0,-0.076200><2.181009,0.036000,0.076200> rotate<0,0.000000,0> translate<40.783934,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.669200,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.843753,0.000000,8.128000>}
box{<0,0,-0.076200><2.174553,0.036000,0.076200> rotate<0,0.000000,0> translate<45.669200,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.472363,0.000000,8.280400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.822706,0.000000,8.280400>}
box{<0,0,-0.076200><2.350344,0.036000,0.076200> rotate<0,0.000000,0> translate<40.472363,0.000000,8.280400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.821600,0.000000,8.280400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.172513,0.000000,8.280400>}
box{<0,0,-0.076200><2.350912,0.036000,0.076200> rotate<0,0.000000,0> translate<45.821600,0.000000,8.280400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.664641,0.000000,8.432800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.801444,0.000000,8.432800>}
box{<0,0,-0.076200><3.136803,0.036000,0.076200> rotate<0,0.000000,0> translate<39.664641,0.000000,8.432800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.896306,0.000000,8.432800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.053047,0.000000,8.432800>}
box{<0,0,-0.076200><3.156741,0.036000,0.076200> rotate<0,0.000000,0> translate<45.896306,0.000000,8.432800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.397819,0.000000,8.585200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.804375,0.000000,8.585200>}
box{<0,0,-0.076200><3.406556,0.036000,0.076200> rotate<0,0.000000,0> translate<39.397819,0.000000,8.585200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.893319,0.000000,8.585200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.202900,0.000000,8.585200>}
box{<0,0,-0.076200><3.309581,0.036000,0.076200> rotate<0,0.000000,0> translate<45.893319,0.000000,8.585200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.401447,0.000000,8.737600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.807306,0.000000,8.737600>}
box{<0,0,-0.076200><3.405859,0.036000,0.076200> rotate<0,0.000000,0> translate<39.401447,0.000000,8.737600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.890331,0.000000,8.737600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.206616,0.000000,8.737600>}
box{<0,0,-0.076200><3.316284,0.036000,0.076200> rotate<0,0.000000,0> translate<45.890331,0.000000,8.737600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.405075,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.810237,0.000000,8.890000>}
box{<0,0,-0.076200><3.405162,0.036000,0.076200> rotate<0,0.000000,0> translate<39.405075,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.887344,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.210334,0.000000,8.890000>}
box{<0,0,-0.076200><3.322991,0.036000,0.076200> rotate<0,0.000000,0> translate<45.887344,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.408703,0.000000,9.042400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.813166,0.000000,9.042400>}
box{<0,0,-0.076200><3.404463,0.036000,0.076200> rotate<0,0.000000,0> translate<39.408703,0.000000,9.042400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.884353,0.000000,9.042400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.214050,0.000000,9.042400>}
box{<0,0,-0.076200><3.329697,0.036000,0.076200> rotate<0,0.000000,0> translate<45.884353,0.000000,9.042400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.412331,0.000000,9.194800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.816097,0.000000,9.194800>}
box{<0,0,-0.076200><3.403766,0.036000,0.076200> rotate<0,0.000000,0> translate<39.412331,0.000000,9.194800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.881366,0.000000,9.194800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.217769,0.000000,9.194800>}
box{<0,0,-0.076200><3.336403,0.036000,0.076200> rotate<0,0.000000,0> translate<45.881366,0.000000,9.194800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.415959,0.000000,9.347200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.819028,0.000000,9.347200>}
box{<0,0,-0.076200><3.403069,0.036000,0.076200> rotate<0,0.000000,0> translate<39.415959,0.000000,9.347200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.878378,0.000000,9.347200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.221484,0.000000,9.347200>}
box{<0,0,-0.076200><3.343106,0.036000,0.076200> rotate<0,0.000000,0> translate<45.878378,0.000000,9.347200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.419587,0.000000,9.499600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.821959,0.000000,9.499600>}
box{<0,0,-0.076200><3.402372,0.036000,0.076200> rotate<0,0.000000,0> translate<39.419587,0.000000,9.499600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.875391,0.000000,9.499600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.225200,0.000000,9.499600>}
box{<0,0,-0.076200><3.349809,0.036000,0.076200> rotate<0,0.000000,0> translate<45.875391,0.000000,9.499600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.969438,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.849075,0.000000,9.652000>}
box{<0,0,-0.076200><2.879637,0.036000,0.076200> rotate<0,0.000000,0> translate<39.969438,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.872400,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.432719,0.000000,9.652000>}
box{<0,0,-0.076200><2.560319,0.036000,0.076200> rotate<0,0.000000,0> translate<45.872400,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.792400,0.000000,9.804400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.997122,0.000000,9.804400>}
box{<0,0,-0.076200><2.204722,0.036000,0.076200> rotate<0,0.000000,0> translate<40.792400,0.000000,9.804400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.702584,0.000000,9.804400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.880619,0.000000,9.804400>}
box{<0,0,-0.076200><2.178034,0.036000,0.076200> rotate<0,0.000000,0> translate<45.702584,0.000000,9.804400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.854006,0.000000,9.956800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.145169,0.000000,9.956800>}
box{<0,0,-0.076200><2.291162,0.036000,0.076200> rotate<0,0.000000,0> translate<40.854006,0.000000,9.956800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.532769,0.000000,9.956800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.809284,0.000000,9.956800>}
box{<0,0,-0.076200><2.276516,0.036000,0.076200> rotate<0,0.000000,0> translate<45.532769,0.000000,9.956800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.915616,0.000000,10.109200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.293213,0.000000,10.109200>}
box{<0,0,-0.076200><2.377597,0.036000,0.076200> rotate<0,0.000000,0> translate<40.915616,0.000000,10.109200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.362950,0.000000,10.109200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.737947,0.000000,10.109200>}
box{<0,0,-0.076200><2.374997,0.036000,0.076200> rotate<0,0.000000,0> translate<45.362950,0.000000,10.109200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.977225,0.000000,10.261600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.441259,0.000000,10.261600>}
box{<0,0,-0.076200><2.464034,0.036000,0.076200> rotate<0,0.000000,0> translate<40.977225,0.000000,10.261600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.193134,0.000000,10.261600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.666612,0.000000,10.261600>}
box{<0,0,-0.076200><2.473478,0.036000,0.076200> rotate<0,0.000000,0> translate<45.193134,0.000000,10.261600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.038831,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.589303,0.000000,10.414000>}
box{<0,0,-0.076200><2.550472,0.036000,0.076200> rotate<0,0.000000,0> translate<41.038831,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.023316,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.595275,0.000000,10.414000>}
box{<0,0,-0.076200><2.571959,0.036000,0.076200> rotate<0,0.000000,0> translate<45.023316,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100441,0.000000,10.566400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523938,0.000000,10.566400>}
box{<0,0,-0.076200><6.423497,0.036000,0.076200> rotate<0,0.000000,0> translate<41.100441,0.000000,10.566400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.162050,0.000000,10.718800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.452603,0.000000,10.718800>}
box{<0,0,-0.076200><6.290553,0.036000,0.076200> rotate<0,0.000000,0> translate<41.162050,0.000000,10.718800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.223659,0.000000,10.871200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.381266,0.000000,10.871200>}
box{<0,0,-0.076200><6.157606,0.036000,0.076200> rotate<0,0.000000,0> translate<41.223659,0.000000,10.871200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.258259,0.000000,11.023600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.399287,0.000000,11.023600>}
box{<0,0,-0.076200><6.141028,0.036000,0.076200> rotate<0,0.000000,0> translate<41.258259,0.000000,11.023600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.157816,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.506659,0.000000,11.176000>}
box{<0,0,-0.076200><6.348844,0.036000,0.076200> rotate<0,0.000000,0> translate<41.157816,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.057369,0.000000,11.328400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.614034,0.000000,11.328400>}
box{<0,0,-0.076200><6.556666,0.036000,0.076200> rotate<0,0.000000,0> translate<41.057369,0.000000,11.328400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.956925,0.000000,11.480800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.721406,0.000000,11.480800>}
box{<0,0,-0.076200><6.764481,0.036000,0.076200> rotate<0,0.000000,0> translate<40.956925,0.000000,11.480800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.856478,0.000000,11.633200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.828778,0.000000,11.633200>}
box{<0,0,-0.076200><6.972300,0.036000,0.076200> rotate<0,0.000000,0> translate<40.856478,0.000000,11.633200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.756034,0.000000,11.785600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.936150,0.000000,11.785600>}
box{<0,0,-0.076200><7.180116,0.036000,0.076200> rotate<0,0.000000,0> translate<40.756034,0.000000,11.785600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.655588,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.043525,0.000000,11.938000>}
box{<0,0,-0.076200><7.387937,0.036000,0.076200> rotate<0,0.000000,0> translate<40.655588,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.555144,0.000000,12.090400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.257978,0.000000,12.090400>}
box{<0,0,-0.076200><1.702834,0.036000,0.076200> rotate<0,0.000000,0> translate<40.555144,0.000000,12.090400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.551681,0.000000,12.090400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.208575,0.000000,12.090400>}
box{<0,0,-0.076200><3.656894,0.036000,0.076200> rotate<0,0.000000,0> translate<42.551681,0.000000,12.090400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.318213,0.000000,12.090400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.108475,0.000000,12.090400>}
box{<0,0,-0.076200><1.790263,0.036000,0.076200> rotate<0,0.000000,0> translate<46.318213,0.000000,12.090400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.680053,0.000000,12.242800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.039538,0.000000,12.242800>}
box{<0,0,-0.076200><1.359484,0.036000,0.076200> rotate<0,0.000000,0> translate<40.680053,0.000000,12.242800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.920650,0.000000,12.242800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.787234,0.000000,12.242800>}
box{<0,0,-0.076200><2.866584,0.036000,0.076200> rotate<0,0.000000,0> translate<42.920650,0.000000,12.242800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.554694,0.000000,12.242800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.961328,0.000000,12.242800>}
box{<0,0,-0.076200><1.406634,0.036000,0.076200> rotate<0,0.000000,0> translate<46.554694,0.000000,12.242800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.850037,0.000000,12.395200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.821100,0.000000,12.395200>}
box{<0,0,-0.076200><0.971063,0.036000,0.076200> rotate<0,0.000000,0> translate<40.850037,0.000000,12.395200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.289619,0.000000,12.395200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.365894,0.000000,12.395200>}
box{<0,0,-0.076200><2.076275,0.036000,0.076200> rotate<0,0.000000,0> translate<43.289619,0.000000,12.395200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.791178,0.000000,12.395200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.814184,0.000000,12.395200>}
box{<0,0,-0.076200><1.023006,0.036000,0.076200> rotate<0,0.000000,0> translate<46.791178,0.000000,12.395200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.020022,0.000000,12.547600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.602659,0.000000,12.547600>}
box{<0,0,-0.076200><0.582637,0.036000,0.076200> rotate<0,0.000000,0> translate<41.020022,0.000000,12.547600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.545947,0.000000,12.547600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.076684,0.000000,12.547600>}
box{<0,0,-0.076200><1.530737,0.036000,0.076200> rotate<0,0.000000,0> translate<43.545947,0.000000,12.547600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.027659,0.000000,12.547600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.667041,0.000000,12.547600>}
box{<0,0,-0.076200><0.639381,0.036000,0.076200> rotate<0,0.000000,0> translate<47.027659,0.000000,12.547600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.190006,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.384219,0.000000,12.700000>}
box{<0,0,-0.076200><0.194212,0.036000,0.076200> rotate<0,0.000000,0> translate<41.190006,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.576991,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.051747,0.000000,12.700000>}
box{<0,0,-0.076200><1.474756,0.036000,0.076200> rotate<0,0.000000,0> translate<43.576991,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.264144,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.519894,0.000000,12.700000>}
box{<0,0,-0.076200><0.255750,0.036000,0.076200> rotate<0,0.000000,0> translate<47.264144,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.608034,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.026809,0.000000,12.852400>}
box{<0,0,-0.076200><1.418775,0.036000,0.076200> rotate<0,0.000000,0> translate<43.608034,0.000000,12.852400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.639081,0.000000,13.004800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.001872,0.000000,13.004800>}
box{<0,0,-0.076200><1.362791,0.036000,0.076200> rotate<0,0.000000,0> translate<43.639081,0.000000,13.004800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.670125,0.000000,13.157200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.976934,0.000000,13.157200>}
box{<0,0,-0.076200><1.306809,0.036000,0.076200> rotate<0,0.000000,0> translate<43.670125,0.000000,13.157200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.701169,0.000000,13.309600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.951994,0.000000,13.309600>}
box{<0,0,-0.076200><1.250825,0.036000,0.076200> rotate<0,0.000000,0> translate<43.701169,0.000000,13.309600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.732213,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.927056,0.000000,13.462000>}
box{<0,0,-0.076200><1.194844,0.036000,0.076200> rotate<0,0.000000,0> translate<43.732213,0.000000,13.462000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.763256,0.000000,13.614400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.902119,0.000000,13.614400>}
box{<0,0,-0.076200><1.138862,0.036000,0.076200> rotate<0,0.000000,0> translate<43.763256,0.000000,13.614400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.794303,0.000000,13.766800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.877181,0.000000,13.766800>}
box{<0,0,-0.076200><1.082878,0.036000,0.076200> rotate<0,0.000000,0> translate<43.794303,0.000000,13.766800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,5.664200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,5.943600>}
box{<0,0,-0.076200><0.579766,0.036000,0.076200> rotate<0,28.808892,0> translate<42.291000,0.000000,5.943600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,5.943600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.249600,0.000000,5.181600>}
box{<0,0,-0.076200><1.290410,0.036000,0.076200> rotate<0,-36.190819,0> translate<41.249600,0.000000,5.181600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.249600,0.000000,5.181600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.487600,0.000000,5.918200>}
box{<0,0,-0.076200><1.059822,0.036000,0.076200> rotate<0,44.026072,0> translate<40.487600,0.000000,5.918200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.487600,0.000000,5.918200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.249600,0.000000,7.010400>}
box{<0,0,-0.076200><1.331745,0.036000,0.076200> rotate<0,-55.093868,0> translate<40.487600,0.000000,5.918200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.249600,0.000000,7.010400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.741600,0.000000,8.229600>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,67.375688,0> translate<40.741600,0.000000,8.229600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.741600,0.000000,8.229600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,8.483600>}
box{<0,0,-0.076200><1.369953,0.036000,0.076200> rotate<0,10.684207,0> translate<39.395400,0.000000,8.483600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,8.483600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.420800,0.000000,9.550400>}
box{<0,0,-0.076200><1.067102,0.036000,0.076200> rotate<0,-88.630223,0> translate<39.395400,0.000000,8.483600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.420800,0.000000,9.550400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.792400,0.000000,9.804400>}
box{<0,0,-0.076200><1.394920,0.036000,0.076200> rotate<0,-10.490785,0> translate<39.420800,0.000000,9.550400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.792400,0.000000,9.804400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,10.998200>}
box{<0,0,-0.076200><1.287657,0.036000,0.076200> rotate<0,-67.984230,0> translate<40.792400,0.000000,9.804400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,10.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.538400,0.000000,12.115800>}
box{<0,0,-0.076200><1.338510,0.036000,0.076200> rotate<0,56.607750,0> translate<40.538400,0.000000,12.115800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.538400,0.000000,12.115800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,12.776200>}
box{<0,0,-0.076200><0.989297,0.036000,0.076200> rotate<0,-41.875106,0> translate<40.538400,0.000000,12.115800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,12.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.367200,0.000000,12.014200>}
box{<0,0,-0.076200><1.331745,0.036000,0.076200> rotate<0,34.900192,0> translate<41.275000,0.000000,12.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.367200,0.000000,12.014200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.535600,0.000000,12.496800>}
box{<0,0,-0.076200><1.264145,0.036000,0.076200> rotate<0,-22.441272,0> translate<42.367200,0.000000,12.014200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.535600,0.000000,12.496800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,13.868400>}
box{<0,0,-0.076200><1.399768,0.036000,0.076200> rotate<0,-78.480989,0> translate<43.535600,0.000000,12.496800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,13.868400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.856400,0.000000,13.893800>}
box{<0,0,-0.076200><1.041710,0.036000,0.076200> rotate<0,-1.397089,0> translate<43.815000,0.000000,13.868400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.856400,0.000000,13.893800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,12.496800>}
box{<0,0,-0.076200><1.415580,0.036000,0.076200> rotate<0,80.701365,0> translate<44.856400,0.000000,13.893800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,12.496800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,12.065000>}
box{<0,0,-0.076200><1.269492,0.036000,0.076200> rotate<0,19.883853,0> translate<45.085000,0.000000,12.496800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.421800,0.000000,12.801600>}
box{<0,0,-0.076200><1.359790,0.036000,0.076200> rotate<0,-32.797367,0> translate<46.278800,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.421800,0.000000,12.801600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,12.065000>}
box{<0,0,-0.076200><1.023907,0.036000,0.076200> rotate<0,46.002050,0> translate<47.421800,0.000000,12.801600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.345600,0.000000,10.947400>}
box{<0,0,-0.076200><1.367124,0.036000,0.076200> rotate<0,-54.829945,0> translate<47.345600,0.000000,10.947400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.345600,0.000000,10.947400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,9.753600>}
box{<0,0,-0.076200><1.318111,0.036000,0.076200> rotate<0,64.912122,0> translate<47.345600,0.000000,10.947400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,9.753600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.225200,0.000000,9.499600>}
box{<0,0,-0.076200><1.345001,0.036000,0.076200> rotate<0,10.884809,0> translate<47.904400,0.000000,9.753600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.225200,0.000000,9.499600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.199800,0.000000,8.458200>}
box{<0,0,-0.076200><1.041710,0.036000,0.076200> rotate<0,-88.596972,0> translate<49.199800,0.000000,8.458200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.199800,0.000000,8.458200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,8.229600>}
box{<0,0,-0.076200><1.340437,0.036000,0.076200> rotate<0,-9.818653,0> translate<47.879000,0.000000,8.229600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,8.229600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.447200,0.000000,6.985000>}
box{<0,0,-0.076200><1.317376,0.036000,0.076200> rotate<0,-70.861680,0> translate<47.447200,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.447200,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.158400,0.000000,5.892800>}
box{<0,0,-0.076200><1.303344,0.036000,0.076200> rotate<0,56.925565,0> translate<47.447200,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.158400,0.000000,5.892800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.396400,0.000000,5.181600>}
box{<0,0,-0.076200><1.042329,0.036000,0.076200> rotate<0,-43.022227,0> translate<47.396400,0.000000,5.181600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.396400,0.000000,5.181600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,5.867400>}
box{<0,0,-0.076200><1.246930,0.036000,0.076200> rotate<0,33.364164,0> translate<46.355000,0.000000,5.867400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,5.867400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.923200,0.000000,5.664200>}
box{<0,0,-0.076200><0.477223,0.036000,0.076200> rotate<0,-25.199460,0> translate<45.923200,0.000000,5.664200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.923200,0.000000,5.664200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.135800,0.000000,7.594600>}
box{<0,0,-0.076200><2.084812,0.036000,0.076200> rotate<0,67.805236,0> translate<45.135800,0.000000,7.594600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.135800,0.000000,7.594600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.897800,0.000000,8.356600>}
box{<0,0,-0.076200><1.077631,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.135800,0.000000,7.594600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.897800,0.000000,8.356600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.872400,0.000000,9.652000>}
box{<0,0,-0.076200><1.295649,0.036000,0.076200> rotate<0,88.870832,0> translate<45.872400,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.872400,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.881800,0.000000,10.541000>}
box{<0,0,-0.076200><1.331018,0.036000,0.076200> rotate<0,41.903176,0> translate<44.881800,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.881800,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.688000,0.000000,10.515600>}
box{<0,0,-0.076200><1.194070,0.036000,0.076200> rotate<0,-1.218795,0> translate<43.688000,0.000000,10.515600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.688000,0.000000,10.515600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.824400,0.000000,9.626600>}
box{<0,0,-0.076200><1.239405,0.036000,0.076200> rotate<0,-45.827291,0> translate<42.824400,0.000000,9.626600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.824400,0.000000,9.626600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,8.305800>}
box{<0,0,-0.076200><1.321044,0.036000,0.076200> rotate<0,-88.892427,0> translate<42.799000,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.510200,0.000000,7.543800>}
box{<0,0,-0.076200><1.042329,0.036000,0.076200> rotate<0,46.971834,0> translate<42.799000,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.510200,0.000000,7.543800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,5.664200>}
box{<0,0,-0.076200><2.009652,0.036000,0.076200> rotate<0,-69.269869,0> translate<42.799000,0.000000,5.664200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.611800,0.000000,7.594600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.773600,0.000000,5.562600>}
box{<0,0,-0.101600><2.198091,0.036000,0.101600> rotate<0,-67.579392,0> translate<42.773600,0.000000,5.562600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.773600,0.000000,5.562600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.316400,0.000000,5.816600>}
box{<0,0,-0.101600><0.523018,0.036000,0.101600> rotate<0,29.052687,0> translate<42.316400,0.000000,5.816600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.316400,0.000000,5.816600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.249600,0.000000,5.080000>}
box{<0,0,-0.101600><1.296396,0.036000,0.101600> rotate<0,-34.621870,0> translate<41.249600,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.249600,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.411400,0.000000,5.918200>}
box{<0,0,-0.101600><1.185394,0.036000,0.101600> rotate<0,44.997030,0> translate<40.411400,0.000000,5.918200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.411400,0.000000,5.918200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.173400,0.000000,7.010400>}
box{<0,0,-0.101600><1.331745,0.036000,0.101600> rotate<0,-55.093868,0> translate<40.411400,0.000000,5.918200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.690800,0.000000,8.178800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.370000,0.000000,8.432800>}
box{<0,0,-0.101600><1.345001,0.036000,0.101600> rotate<0,10.884809,0> translate<39.370000,0.000000,8.432800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.370000,0.000000,8.432800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.370000,0.000000,9.575800>}
box{<0,0,-0.101600><1.143000,0.036000,0.101600> rotate<0,90.000000,0> translate<39.370000,0.000000,9.575800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.370000,0.000000,9.575800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.716200,0.000000,9.829800>}
box{<0,0,-0.101600><1.369953,0.036000,0.101600> rotate<0,-10.684207,0> translate<39.370000,0.000000,9.575800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.198800,0.000000,10.947400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.411400,0.000000,12.090400>}
box{<0,0,-0.101600><1.387965,0.036000,0.101600> rotate<0,55.433817,0> translate<40.411400,0.000000,12.090400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.411400,0.000000,12.090400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.249600,0.000000,12.903200>}
box{<0,0,-0.101600><1.167571,0.036000,0.101600> rotate<0,-44.115684,0> translate<40.411400,0.000000,12.090400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.249600,0.000000,12.903200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.392600,0.000000,12.115800>}
box{<0,0,-0.101600><1.387965,0.036000,0.101600> rotate<0,34.560244,0> translate<41.249600,0.000000,12.903200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.484800,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.738800,0.000000,13.944600>}
box{<0,0,-0.101600><1.394920,0.036000,0.101600> rotate<0,-79.503276,0> translate<43.484800,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.738800,0.000000,13.944600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.907200,0.000000,13.944600>}
box{<0,0,-0.101600><1.168400,0.036000,0.101600> rotate<0,0.000000,0> translate<43.738800,0.000000,13.944600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.907200,0.000000,13.944600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.161200,0.000000,12.573000>}
box{<0,0,-0.101600><1.394920,0.036000,0.101600> rotate<0,79.503276,0> translate<44.907200,0.000000,13.944600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.253400,0.000000,12.115800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.421800,0.000000,12.903200>}
box{<0,0,-0.101600><1.408956,0.036000,0.101600> rotate<0,-33.974302,0> translate<46.253400,0.000000,12.115800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.421800,0.000000,12.903200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.234600,0.000000,12.090400>}
box{<0,0,-0.101600><1.149473,0.036000,0.101600> rotate<0,44.997030,0> translate<47.421800,0.000000,12.903200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.234600,0.000000,12.090400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.447200,0.000000,10.947400>}
box{<0,0,-0.101600><1.387965,0.036000,0.101600> rotate<0,-55.433817,0> translate<47.447200,0.000000,10.947400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.929800,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,9.575800>}
box{<0,0,-0.101600><1.369953,0.036000,0.101600> rotate<0,10.684207,0> translate<47.929800,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,9.575800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,8.432800>}
box{<0,0,-0.101600><1.143000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.276000,0.000000,8.432800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,8.432800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.955200,0.000000,8.178800>}
box{<0,0,-0.101600><1.345001,0.036000,0.101600> rotate<0,-10.884809,0> translate<47.955200,0.000000,8.178800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.498000,0.000000,7.010400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.234600,0.000000,5.918200>}
box{<0,0,-0.101600><1.317376,0.036000,0.101600> rotate<0,55.999845,0> translate<47.498000,0.000000,7.010400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.234600,0.000000,5.918200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.421800,0.000000,5.105400>}
box{<0,0,-0.101600><1.149473,0.036000,0.101600> rotate<0,-44.997030,0> translate<47.421800,0.000000,5.105400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.421800,0.000000,5.105400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.355000,0.000000,5.816600>}
box{<0,0,-0.101600><1.282134,0.036000,0.101600> rotate<0,33.687844,0> translate<46.355000,0.000000,5.816600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.355000,0.000000,5.816600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.897800,0.000000,5.562600>}
box{<0,0,-0.101600><0.523018,0.036000,0.101600> rotate<0,-29.052687,0> translate<45.897800,0.000000,5.562600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.897800,0.000000,5.562600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.059600,0.000000,7.594600>}
box{<0,0,-0.101600><2.198091,0.036000,0.101600> rotate<0,67.579392,0> translate<45.059600,0.000000,7.594600> }
object{ARC(3.694909,0.203200,191.595401,211.145843,0.036000) translate<44.335700,0.000000,8.921475>}
object{ARC(3.702416,0.203200,147.182113,166.106757,0.036000) translate<44.310300,0.000000,8.940800>}
object{ARC(3.720234,0.203200,102.489338,120.653277,0.036000) translate<44.289331,0.000000,8.915400>}
object{ARC(3.703122,0.203200,59.024208,76.903338,0.036000) translate<44.322094,0.000000,8.940800>}
object{ARC(3.716059,0.203200,13.928307,32.782822,0.036000) translate<44.323000,0.000000,8.935316>}
object{ARC(3.694909,0.203200,328.854157,348.404599,0.036000) translate<44.335700,0.000000,8.921475>}
object{ARC(1.528491,0.203200,298.268513,601.731487,0.036000) translate<44.335700,0.000000,8.940800>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  PLYTKA_V3(-25.870000,0,-36.825000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//U$2		OSHW_FILLX350_NOTEXT
