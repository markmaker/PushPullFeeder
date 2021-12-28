/*
 * Copyright (C) 2020 <mark@makr.zone>
 *
 * Inspired by Dining-Philosopher's Litefeeder
 * https://github.com/dining-philosopher/litefeeder
 * and Jed Smith's Litefeeder++ friction wheel
 * https://loonatec.com/pnp-semi-automatic-feeder/
 * 
 * The PushPullFeeder is free software: you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * The PushPullFeeder is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with OpenPnP. If not, see
 * <http://www.gnu.org/licenses/>.
 * 
 * For more information visit https://makr.zone/tag/feeder/
 */

/* [ Make Options ] */

// Single/special selection
option=0; // [0:"* Individual switches (see below...)", -1:"* Phase I Parts", -2:"* Phase II Parts", -3:"* Everything", -4:"* Ratchet parts", 1:"Base plate", 2:"Lever", 3:"Spool, base", 4:"Spool, cover", 5:"Friction wheel", 6:"Tape inset", 7:"Ratchet blocking spring", 8:"Reel counterpart", 9:"Handle and lock", 10:"Liteplacer nozzle adapter", 11:"Liteplacer lever actuator", 12:"Spent Tape Chute", 13:"Test print"]

// Base plate of the feeder 
make_base_plate         = true;
// Lever with the dog
make_lever              = true;
// Spool left side (base), with ratchet wheel
make_spool_left        = true;
// Spool right side (cover)
make_spool_right       = true;
// Friction wheel, connecting the two spool halves with a slip-transmission
make_friction_wheel     = true;
// Exchangable tape inset, allows to use different tape thickness/embossing
make_inset              = true;
// Spring blocking the ratchet from going in reverse
make_blocking_spring    = true;
// Reel holder counterpart holding the reel up on the other side (for narrow reels only)
make_reel_counterpart   = true;
// Handle and lock for the extrusion mount
make_handle_lock        = true;
// Liteplacer specific nozzle adapter
make_nozzle_adapter     = false;
// Liteplacer specific lever actuator
make_lever_actuator     = false;
// Simple spent tape chute
make_tape_chute         = true;
// Test print
make_test_print         = false;

phase1 = (option == -1);
phase2 = (option == -2);
everything = (option == -3);
ratchet_parts = (option == -4);

do_base_plate         = (option == 0 && make_base_plate)         || (option ==  1)  || everything || phase1 || ratchet_parts;
do_lever              = (option == 0 && make_lever)              || (option ==  2)  || everything || phase2 || ratchet_parts;
do_spool_left         = (option == 0 && make_spool_left)         || (option ==  3)  || everything || phase1 || ratchet_parts;
do_spool_right        = (option == 0 && make_spool_right)        || (option ==  4)  || everything || phase2;
do_friction_wheel     = (option == 0 && make_friction_wheel)     || (option ==  5)  || everything || phase2;
do_inset              = (option == 0 && make_inset)              || (option ==  6)  || everything || phase2;
do_blocking_spring    = (option == 0 && make_blocking_spring)    || (option ==  7)  || everything || phase2 || ratchet_parts;
do_reel_counterpart   = (option == 0 && make_reel_counterpart)   || (option ==  8)  || everything || phase2;
do_handle_lock        = (option == 0 && make_handle_lock)        || (option ==  9)  || everything || phase2;
do_nozzle_adapter     = (option == 0 && make_nozzle_adapter)     || (option ==  10) || everything;
do_lever_actuator     = (option == 0 && make_lever_actuator)     || (option ==  11) || everything;
do_tape_chute         = (option == 0 && make_tape_chute)         || (option ==  12) || everything || phase2;
do_test_print         = (option == 0 && make_test_print)         || (option ==  13);

debug_ratchet = ratchet_parts;

/* [ Logo and Text ] */

// Switch on/off logos and text (except tag)
logo_enabled=true;
// Logo text to be printed on the reverse of the base plate
logo_text="makr.zone";
// Tag to be printed on the reverse of the base plate (revision number etc.)
logo_tag="408";
// Open Source Hardware Logo size (set 0 to switch off)
logo_size=18; 
// Etching depth
logo_etch=0.4; 
// Logo outline pen width
logo_etch_pen=0.8; // [0.2:0.01:2]
// Additional font weight
logo_etch_font=0.2; // [-0.5:0.01:1]
// Logo position in x
logo_x=-60;
// Logo position in y
logo_y=24;
// Text position in x
logo_text_x=-60;
// Text position in x
logo_text_y=10;
// Tag position in x
logo_tag_x=-22;
// Tag position in y
logo_tag_y=-4.5;
// Logo_font 
logo_font="Electrolize:style=Regular"; // ["Electrolize:style=Regular", "Liberation Mono:style=Bold"]
use <Electrolize-Regular.ttf>
// Electrolize-Regular.ttf: Copyright (c) 2011, Cyreal (www.cyreal.org) 
// with Reserved Font Name "Electrolize" This Font Software is licensed 
// under the SIL Open Font License, Version 1.1. This license is available 
// with a FAQ at: http://scripts.sil.org/OFL
// https://github.com/google/fonts/tree/master/ofl/electrolize

// Text font size
logo_font_size=5.4;
logo_tag_font=logo_font;
// Tag font size
logo_tag_font_size=4.6;

/* [ Display ] */

// Arrange the parts as assembled
debug=true;
// Relax the springs in assembled mode
relax_springs=false;
// Render some complex bodies in preview (better quality, slower rendering)
preview_rendering=false;
// Litefeeder reference (from: https://github.com/dining-philosopher/litefeeder)
do_litefeeder=false;


/*  [ 3D Printing ] */

// Standard layer height
layer_height=0.3;
// Standard extrusion width
extrusion_width=0.5;
// Minimum gap between parts on the the print bed
gap=2;
// Maximum spacing between supports (0 to switch off)
support_grid=0;

// General play rationale: 
// the play is modelled on the smaller, removable part, so you can tune it with quick re-prints.

// Play between parts that need to snap-in (empirical)
play=-0.05; 
// Play on axles (empirical)
axle_play=-0.02;

// Play on the spool axle 
spool_axle_play=axle_play;
// Specific snap-in play for inset 
inset_play=play;
// Play on the handle lock
handle_lock_play=play;
// Play on fixtures
fixture_play=play; 

// Minimal sturdy vertical wall 
wall_strength_min=1.3;
// Round up to nearest multiple of extrusion width
wall=ceil(wall_strength_min/extrusion_width)*extrusion_width;
// Minimal sturdy horizontal wall 
layered_wall_strength_min=0.5;
// Round up to nearest multiple of layer height
layer_wall=ceil(layered_wall_strength_min/layer_height)*layer_height;
// bevel/rounding in X/Y
bevel_xy=wall;
// bevel in Z
bevel_z=2*layer_height;

// Maximum allowed error in (most) curve approximations
_fp=0.02; // $fn is determined by this maximum error 
// Epsilon for CSG body overlap
e=0.02;
$fs=extrusion_width;


/* [ Tape Specification ] */

// Tape width
tape_width=8; // [8:4:24]
// Tape thickness (not incuding the embossed pockets)
tape_thickness=0.6; // [0:0.01:1.5]
// Embossed pockets portruding from the underside of the tape
tape_emboss=0; // [0:0.01:2.4] 
    // 250V cap = 1.6
// Embossed pockets size, across tape, measured outside (underside of tape)
tape_emboss_size=3.75; 


/* [ Tape Specification, Advanced ] */

// Maximum overall tape height for exchangeable insets (should not change)
tape_max_height=4;
// Maximum delta from tape width to reel width (from EIA 481, do not change)
tape_reel_max_width_delta=6.4; 
// Sprocket hole diameter (should not change)
sprocket_hole_diameter=1.5;
// Sprocket hole distance from tape edge (should not change)
sprocket_hole_distance=1.75;
sprocket_hole_margin=sprocket_hole_distance-sprocket_hole_diameter/2;
// Sprocket hole pitch (should not change)
sprocket_pitch=4; 
// maximum sprocket side gap to cover tape
sprocket_gap=sprocket_hole_distance+sprocket_hole_diameter/2;  
// Minimum margin where cover tape is attached
tape_min_margin=0.6; 
sprocket_margin=sprocket_gap+tape_min_margin;

/* [ Tape Inset ] */

// Tape inset pick window length (make it longer than the inset to keep the end open)
tape_inset_window_length=18;
// Tape inset begin x
tape_inset_begin=-74;
// Tape inset end x
tape_inset_end=6;
// Tension for tape cover (ratio of tape thickness)
tape_inset_cover_tension=0.2;
// Radius of the tape on-ramp
tape_bend_radius_begin=30;
// Bend angle of the tape on-ramp
tape_bend_angle=45;
// Inset snap-in feature size 
tape_inset_slant=2;
// Minimum thorn groove 
thorn_min_groove=0.4;
// Cover tape edge relative to the pick location
cover_tape_edge=-1.25;
// Tape reversal blocking thorn (set 0 to switch off)
reversal_blocking_thorn_length=0.5;

/* [ Label Holder ] */

// Add the label to the tape inset (cannot be combined with spent tape chute)
label_enabled=false;
// Distance from inset edge
label_distance=4; // [0:0.1:50]
// Label holder length
label_length=15; // [5:0.1:50]
// Surface of label, relative to tape surface
label_top=0; // [-10:0.1:10]
// Label frame [number of extrusions]
label_frame_extrusions=2;
label_frame_thickness=label_frame_extrusions*extrusion_width;
// Label slot [number of extrusions]
label_slot_extrusions=2;
label_frame_slot=2*extrusion_width;
label_frame_wall=layer_wall*2;
// Size of the 
label_thumb=8;
                    
/* [ Spent Tape Chute ] */

// First bend angle
tape_chute_angle=210;
// Second (reverse) bend angle
tape_chute_reverse_angle=110;
// First bend diameter (as measured on tape surface)
tape_chute_diameter=60;
// Second bend diameter (as measured on tape surface)
tape_chute_reverse_diameter=52;
// Angle how much the chute can pivot up (for easier insertion)
tape_chute_pivot_angle=43;
// Preview how it pivots up
tape_chute_pivot_debug=false;
// Spent tape sideways play
tape_chute_play=layer_height;
// Tension angle of the first bend (the bend is coiled up that much)
tape_chute_tension_angle = 15;
                
/* [ Base Plate] */

// Minimum base plate thickness, will be rounded up to form integral mm overall feeder size (minus one layer)
base_min_thickness=1.6;
base_thickness=ceil(base_min_thickness+tape_reel_max_width_delta)
    -tape_reel_max_width_delta/2-layer_height;
// Margin all around the base plate
base_margin=3.5;
// Base plate begin in x
base_begin=-84;
// Base plate end in x
base_end=14;
base_length=base_end - base_begin;
// Base plate height below tape surface
base_height=7;
// Base plate edge on sprocket side of tape
base_tape_edge=1.5;
base_bottom=-base_height;
base_anti_friction_ring=extrusion_width*3;
// Add a reel holder to the base plate
base_with_reel_holder = true;
// Add base mounting screws (depends on other options)
base_mount_screws=true;
// Emboss the base plate to make space for mechanics
emboss=2; 
// Cross hole diameter (for punch-outs, optional reinforcment pins, screws etc.)
cross_screw_diameter=3;
// Play in screw holes
screw_play=0.1;
// In case there is no extrusion mount, make screws holes at these x coordinates.
base_screw_hole1=-40;
base_screw_hole2=-10;
base_screw_holes=[base_screw_hole1, base_screw_hole2];

/* [ Cover Tape Spool ] */

//cover_tape_slot=extrusion_width*2;
// Cover tape spool inner (drum) diameter 
spool_inner_diameter=24;
// Cover tape spool outer diameter 
spool_outer_diameter=56;
spool_wall_left=emboss+sprocket_gap;
spool_wall_right=layer_wall;
// Cover tape pool axle diameter
spool_axle_diameter=8;
spool_axle_groove_innner=spool_axle_diameter-wall;
spool_axle_groove_outer=spool_axle_diameter+2*layer_height;
// Cover tape spool position in x
spool_axle_x=-86;
spool_axle_y=spool_outer_diameter/2+2;
// Spool left side number spokes (set 0 to switch off)
spool_spokes_left=0;
// Spool right side number spokes (set 0 to switch off)
spool_spokes_right=8;
spool_spoke_strength=4*extrusion_width;
spool_drum_clamp_strength=3*extrusion_width;
// Drum clamp tension, relative
spool_drum_clamp_tension=0.05; 
// Drum clamp open angle
spool_drum_clamp_open_angle=60;
spool_drum_strength=spool_drum_clamp_strength+wall;
// Spool grip, number of teeth
grip_teeth=60;
// Spool grip, depth of teeth
grip_depth=0.0;
                   
/* [ Cover Tape Spool, Ratchet ] */
// Ratchet teeth depth
ratchet_teeth_depth=1.2;
// Ratchet tooth point position, relative (usually 1)
ratchet_overhang=1;
ratchet_inner_diameter=spool_inner_diameter-ratchet_teeth_depth*2;
teeth_length=(sprocket_pitch+0.5)*ratchet_inner_diameter/spool_inner_diameter;
ratchet_diameter=ratchet_inner_diameter+ratchet_teeth_depth*2;
ratchet_teeth=floor(ratchet_diameter*PI/teeth_length/4)*4;
// Ratchet idle position (relative to teeth)
ratchet_tooth_start=-0.7;
ratchet_teeth_length=PI*ratchet_diameter/ratchet_teeth;
ratchet_thickness=spool_wall_left-layer_wall;
ratchet_bluntness=extrusion_width/2/teeth_length;
// Cut out a window into the base plate to see and trouble-shoot the ratchet/spring interaction
ratchet_window=true;

/* [ Springs ] */

// Tension of springs angle
spring_tension=12;
// Strength of springs [number of extrusions]
spring_strength_extrusions=3;
spring_strength_extrusions_small=2;
spring_strength=spring_strength_extrusions*extrusion_width;
spring_small_strength=spring_strength_extrusions_small*extrusion_width;
// Diameter for spring fixture
fixture_axle=8;
// Position of blocking spring in x
block_axle_x=-60;
// Position of blocking spring in y
block_axle_y=fixture_axle/2+wall+extrusion_width;
// Blocking spring bending angle
blocking_spring_bend=-25;
blocking_spring_tooth=-ratchet_teeth/4;
// Ratchet spring early engagement, relative to teeth (empirical and very important)
blocking_spring_early=-0.15; // [-0.5:0.01:0.5]

/* [ Reel ] */

// Reel maximum diameter (178mm +/- 2mm by EIA 481)
reel_diameter=180;
// Reel axle diameter
reel_axle=13;
reel_wall=tape_reel_max_width_delta/2;
reel_width=tape_width+2*reel_wall;
// Reel holder strength
reel_holder_strength=4+4*wall;
reel_washer=reel_axle+2*5;
reel_holder_thickness=base_thickness-reel_wall;
reel_washer_inner=cross_screw_diameter+2*wall;
// Reel horizontal distance from the mounting extrusion
reel_dist=10; // [0:1:50]
// Reel distance from the spool
reel_dist_spool=4; // [0:0.5:8]
// Add connection to spool axle
reel_spool_connect=true; 
// Diameter of the connecting end
reel_counterpart_connector=max(reel_holder_strength, spool_axle_groove_outer+4*wall);
        
/* [ Lever ] */

// Lever axle diameter
lever_axle_diameter=8;
// Lever spring node size
lever_node=3;
// Lever axle position in x
lever_axle_x=-48; 
// Lever axle position in y
lever_axle_y=29;  
// To make the feeder compatible with various tape widths, the lever only takes up about half the tape width, so the nozzle adapter can actuate it when centered on the tape. This is the delta.
lever_actuation_delta=1;
lever_actuation_thickness=emboss+tape_width/2+lever_actuation_delta;
// Leverage for the feed actuation
lever_feed_leverage=26;
// Angle of the feed lever in idle position.
lever_feed_angle=100;
// Leverage for the dog actuation
lever_dog_leverage=12;
// Angle of the feed lever in idle position.
lever_dog_angle=247;
// Dog spring tensioned bending angle
lever_dog_spring_bend=-35;
// Leverage ratio of the ratchet spring vs. the dog spring [empirical]
lever_spool_leverage_ratio=1.0; // [0.8:0.01:2]
lever_spool_leverage=lever_spool_leverage_ratio*lever_dog_leverage; // empirical overgearing taken up by the friction wheel
// Angle of the spool spring lever in idle position.
lever_spool_angle=125;
// Spool spring relaxed bending angle
lever_spool_spring_bend=5;
// Ratchet tooth that the spool spring connects to (counter-clockwise from 0°)
lever_spool_spring_tooth=-1;

lever_axle_outer_diameter=reel_axle;
lever_strength=lever_axle_diameter+3*wall;
lever_thickness=emboss+tape_width+reel_wall;
lever_spool_x=cos(lever_spool_angle)*lever_spool_leverage;
lever_spool_y=sin(lever_spool_angle)*lever_spool_leverage;
lever_tape_x=cos(lever_dog_angle)*lever_dog_leverage;
lever_tape_y=sin(lever_dog_angle)*lever_dog_leverage;
lever_feed_x=cos(lever_feed_angle)*lever_feed_leverage;
lever_feed_y=sin(lever_feed_angle)*lever_feed_leverage;
    
/* [ Dog ] */


// Dog spring tensioned angle at idle position
dog_spring_bend=-12;
// Dog spring additional tension angle 
dog_tension_angle=-8; 
dog_strength=spring_strength+2*extrusion_width;
dog_blocker_strength=3*wall;
// Offset of the dog blocker above the inset cover.
dog_blocker_cover_offset=0.5;
// Dog slant ratio (0 means vertical, 1 means free to rotate up)
dog_slant_ratio=0.15;
// Tape advancing thorn length
thorn_length=0.9; // [0.4:0.05:1.1]
// Tape advancing thorn diameter ratio, relative to nominal sprocket hole size
thorn_diameter_ratio=1; // [0.8:0.01:1.1]
// Thorn sideways "tension" to draw the tape towards the base [mm]
thorn_sideways_tension=0.1; 
thorn_diameter=sprocket_hole_diameter*thorn_diameter_ratio;
// Dog aproximative offset from pick location (will be aligned with nearest sprocket pitch)
dog_offset=-24; // [-34:4:-2]
// align the dog with the sprockets
dog_thorn_nominal_x=(round(dog_offset/sprocket_pitch) - 0.5)*sprocket_pitch;
dog_nominal_x=dog_thorn_nominal_x-dog_strength/2+thorn_diameter/2;
// Thorn pointedness, relative to diameter
thorn_pointedness=0.67; // [0.33:0.01:0.99]
// Thorn overhang, relative to diameter
thorn_overhang=0.025; // [-0.5:0.01:0.5]
// Dog nominal position in y
dog_nominal_y=0;
dog_relaxed_pos=spring_relaxed_endpoint(
    [lever_axle_x+lever_tape_x, lever_axle_y+lever_tape_y],
    [dog_nominal_x, dog_nominal_y],
    lever_dog_spring_bend, 
    dog_tension_angle);
// Dog (thorn) relaxed position in x
dog_x=dog_relaxed_pos.x;
// Dog (thorn) relaxed position in y
dog_y=dog_relaxed_pos.y;
// Dog height on spring side
dog_height0=11;
// Dog height on thorn side
dog_height1=8;
// Dog length
dog_length=9;
// Dog travel (nominal)
dog_travel_nominal=sprocket_pitch;
thorn_groove=max(thorn_min_groove, thorn_length+play*2-tape_thickness);
// Dog grip size
dog_grip=7;
// Dog advancing by bending (empirical)
dog_travel_bend=1.9; // afraid, that's empirical    

/* [ Friction Wheel ] */

// Friction wheel number of wings
friction_wings=6;
friction_axle_diameter=(spool_axle_diameter+reel_axle-lever_axle_diameter);
friction_hex_diameter=friction_axle_diameter/cos(180/friction_wings)-extrusion_width;
// Friction wheel tension, additional radius [mm]
friction_tension=0.16; // [-0.2:0.01:0.8]

/* [ Extrusion Mount ] */

// Add the extrusion mount to the base plate
extrusion_mount_enabled=true;
// Extrusion unit size
extrusion_mount_unit=20; 
// Extrusion overall width
extrusion_mount_w=20; // [20:20:40]
// Extrusion overall height
extrusion_mount_h=20; // [20:20:60]
// Extrusion mount front edge (from pick location)
extrusion_mount_edge_x=-50;     // in my setup, the nozzle tip can just about reach the table edge
                                // but the camera is +30mm in Y, so plus extrusion = 50mm.
// Extrusion mount top edge (from pick location)
extrusion_mount_edge_y=-20;
// Extrusion center position in x
extrusion_mount_x=extrusion_mount_edge_x+extrusion_mount_w/2; 
// Extrusion center position in y
extrusion_mount_y=extrusion_mount_edge_y-extrusion_mount_h/2;
// Hollow out the extrusion mount (left side)
extrusion_mount_hollow_out_left=false;
// Hollow out the extrusion mount (right side, vibrations may increase) 
extrusion_mount_hollow_out_right=false;
// Mounting tension, also takes up some of the rounded corner
extrusion_mount_tension=0.3; 
// Extrusion mount strength
extrusion_mount_strength=8;
// Extrusion inner slot size (5.68mm for OpenBuilds V-Slot)
extrusion_mount_slot_inner=5.68;    // 5.68mm for OpenBuilds V-Slot
// Extrusion slot angle (45° for OpenBuilds V-Slot)
extrusion_mount_slot_angle=45;      
// Extrusion slot thickness (1.8mm for OpenBuilds V-Slot)
extrusion_mount_slot_thickness=1.8; 
// Extrusion mounting screw diameter (should not be necessary)
extrusion_mount_screw_diameter=4; // [3:M3, 4:M4, 5:M5]

/* [ Lock and Handle ] */

// Lock strength
extrusion_mount_lock_strength=8;
extrusion_mount_slot_outer=extrusion_mount_slot_inner
    +extrusion_mount_slot_thickness*2*tan(90-extrusion_mount_slot_angle); 
    
// Handle grip diameter
handle_diameter=22;
// Handle grip strength
handle_strength=6;
handle_lock_diameter=reel_axle;//extrusion_mount_slot_inner*2;
// Length of handle
handle_pull_length=82;
// Handle lock inner axle (set 0 to switch off)
handle_lock_inner_axle=1;
handle_lock_strength=handle_lock_diameter/2;
handle_pull_thickness=reel_wall-spool_wall_right-2*layer_height;
handle_lock_thickness=reel_width/2+handle_pull_thickness/2;
// Tension of the tip of the lock against the extrusion profile edge (includes taking up play)
handle_lock_tension=0.7;
// Squeeze-in tension of lock against the extrusion profile (includes taking up play)
handle_lock_squeeze=0.4;
// Handle lock angle from vertical 
handle_lock_angle=22.5; // [10:0.01:35]
// Show the lock as released
handle_lock_debug=false;
// Distance of the lock from the extrusion
handle_lock_axle_dist=8;
handle_lock_axle_x=extrusion_mount_x-extrusion_mount_w/2-handle_lock_axle_dist;
handle_lock_axle_y=extrusion_mount_y+extrusion_mount_h/2+handle_lock_diameter/2;
handle_lock_edge_x=extrusion_mount_x-extrusion_mount_w/2+extrusion_mount_slot_thickness;
handle_lock_edge_y=extrusion_mount_y+extrusion_mount_h/2-extrusion_mount_unit/2
    +extrusion_mount_slot_inner/2;
handle_pull_strength=handle_lock_diameter-2*e;
// Special play in cutout of lock
handle_lock_cutout_play=0.1;


/* [ Liteplacer Nozzle Adapter ] */

// Height where the shaft begins, from the feeder tape surface
nozzle_shaft_z=45;
// Shaft diameter
nozzle_shaft_diameter=15;
// Shaft length (to underside of nozzle mount plate)
nozzle_shaft_length=17;
// Nozzle to camera Y offset (for looking at the pick location - add some extra)
nozzle_to_camera_offset=30; // 26mm + 4mm reserve 
// Actuator thingy play against feeder lever
nozzle_play=0.2;
// Nozzle tip minmum Safe Z (from feeder tape surface)
nozzle_safe_z=15; 
// Cable tie width
cable_tie_width=3.8;
// Cable tie thickness
cable_tie_thickness=1.6;
// The depth of the slide-on groove to mount the actuator thingy on the head
nozzle_mount_groove=2;
// Play in the slide-on (can be negative to give strong mount)
nozzle_mount_attach_play=-0.1; // [-0.5:0.01:0.5];

/* [ Liteplacer Nozzle Adapter, Advanced ] */
// All these are Liteplacer specific and should not change
nozzle_mount_across=21;
nozzle_mount_diameter=31.8;
nozzle_mount_thickness=5;
nozzle_pulley_diameter=28;
nozzle_plate_thickness=2;
nozzle_plate_portrusion=1.5;
nozzle_mount_screw_dist=22;
nozzle_mount_screw_nut=6;
nozzle_mount_screw_height=4.5;

nozzle_adapter_strength=wall+extrusion_width;
nozzle_travel_z=lever_axle_diameter+wall; // nozzle tip vertical travel when lever is inserted
nozzle_actuation_z=nozzle_safe_z-nozzle_travel_z; // nozzle tip height at which the lever is actuated
nozzle_actuation_travel=lever_axle_diameter+6.5; // nozzle tip horizontal travel when lever is actuated
nozzle_actuation_dist=-nozzle_actuation_travel-lever_axle_x-lever_feed_x;
             //nozzle_mount_diameter/2+nozzle_plate_portrusion;
             
nozzle_actuation_dist_z=nozzle_actuation_z+nozzle_shaft_z-lever_feed_y-lever_axle_y;
nozzle_shaft_actuation_z=lever_axle_y+lever_feed_y+nozzle_actuation_dist_z;
nozzle_insert_slant=lever_strength-lever_axle_diameter;
nozzle_tape_pos=emboss+tape_width/2+sprocket_gap/2;

/* [ Test Print ] */

// Print the test axle
test_axle=true;
// How many nuts with different play 
test_nuts=6;
// Minimum play
test_play_min=-0.04;
// Increment in play
test_play_inc=0.02;
// Height of the nuts
test_height=12;
// Height of the plate
test_thickness=base_thickness-emboss;


                            
/* [Hidden] */


// calculations --------------------------------------------------

debug_eff = debug && $preview;

// DIN 912 
screw_dk=([5.5, 7, 8.5])[extrusion_mount_screw_diameter-3];
screw_k=([3, 4, 5])[extrusion_mount_screw_diameter-3];
                            
// Phase II play compansation (use of this is curently not recommended).
phase2_play=0.00; 

echo("Overall Size:", reel_width+reel_holder_thickness);
reel_axle_wall=(reel_axle-lever_axle_diameter)/2;
// position of the reel axle within the constraints
reel_x=extrusion_mount_x-extrusion_mount_w/2-reel_dist-reel_diameter/2;
reel_y=spool_axle_y-sqrt(pow(reel_diameter/2+spool_outer_diameter/2+reel_dist_spool, 2)
    -pow(spool_axle_x-reel_x, 2));

hanger_reel_axle_angle= 
    atan2(extrusion_mount_y+extrusion_mount_h/2-reel_y, 
        extrusion_mount_x+extrusion_mount_w/2-reel_x); // approx
hanger_connect_x = extrusion_mount_enabled ? 
    extrusion_mount_x-extrusion_mount_w/2-reel_holder_strength/2-extrusion_mount_strength/2
     : block_axle_x; 
hanger_connect_y = extrusion_mount_enabled ? 
    extrusion_mount_y-extrusion_mount_h/2+reel_holder_strength/2+extrusion_mount_strength*1.25
    : block_axle_y;
// rotation movement when hanging into extrusion
hanger_dx=extrusion_mount_w-extrusion_mount_slot_thickness;
hanger_dy=extrusion_mount_unit/2-extrusion_mount_slot_inner/2;
hanger_radius = distance(hanger_dx, hanger_dy);
hanger_y=extrusion_mount_y+extrusion_mount_h/2-hanger_dy;
hanger_angle = atan2(hanger_dy, hanger_dx)*2;
// some spool data
spool_ratchet_shield=ratchet_inner_diameter-spring_strength;
spool_dx=-spool_ratchet_shield/2+reel_holder_strength/2;
spool_reel_r=distance(spool_axle_x-reel_x, spool_axle_y-reel_y);
spool_reel_a=atan2(spool_axle_y-reel_y, spool_axle_x-reel_x);
spool_reel_d=spool_ratchet_shield/2-reel_holder_strength/2;
spool_reel_da=asin(spool_reel_d/spool_reel_r/2)*2;
spool_reel_connect_x = reel_x+spool_reel_r*cos(spool_reel_a+spool_reel_da);
spool_reel_connect_y = reel_y+spool_reel_r*sin(spool_reel_a+spool_reel_da);
spool_width=spool_wall_left+tape_width-sprocket_gap+spool_wall_right;
spool_axle_groove_z=base_thickness-emboss+spool_width+2*layer_height;
spool_axle_groove_width=reel_holder_thickness+reel_width-spool_axle_groove_z; 

dog_slant=dog_slant_ratio*(lever_axle_y+lever_tape_y-dog_nominal_y)
    /(dog_nominal_x-lever_axle_x-lever_tape_x);
dog_slant_c=sqrt(1-dog_slant*dog_slant);
                
// TODO: do real contour without offset(+/-e) hack
dog_neck=[dog_slant*dog_height0-dog_length, dog_height0];
dog_r=dog_strength/2;
dog_contour = [
    each arc(
        [dog_slant*(dog_height0+dog_r)-dog_length-dog_r, 
            dog_height0+dog_r+extrusion_width],
        [dog_slant*(dog_height0-dog_r)-dog_length-dog_r, 
            dog_height0-dog_r-+extrusion_width],
        60),
    each arc(
        [dog_slant*(dog_height0-dog_r)-dog_length-dog_r, 
            dog_height0-dog_r-extrusion_width],
        [-dog_r*2, 0],
        -30),
        [dog_r, 0],
    each arc(
        [dog_slant*dog_height1+dog_r, 
            dog_height1],
        [dog_slant*dog_height1+dog_grip/2, 
            dog_height1+dog_grip/2-dog_r],
        -90),
    each arc(
        [dog_slant*dog_height1+dog_grip/2, 
            dog_height1+dog_grip/2-dog_r],
        [dog_slant*dog_height1+dog_grip/2, 
            dog_height1+dog_grip/2+dog_r],
        180),
    each arc(
        [dog_slant*dog_height1+dog_grip/2, 
            dog_height1+dog_grip/2+dog_r],
        [dog_slant*dog_height1-dog_r, 
            dog_height1+dog_slant_c*dog_r],
        90),
];
dog_eff_x = debug_eff && ! relax_springs ? dog_nominal_x : dog_x;
dog_eff_y = debug_eff && ! relax_springs ? dog_nominal_y : dog_y;
dog_spring_bend_eff = debug_eff && ! relax_springs ? 
    dog_spring_bend :
    dog_spring_bend+dog_tension_angle;

inset_edge=min(base_tape_edge, reel_wall-layer_height);
inset_height=tape_width+reel_wall-layer_height;
inset_flipped = ! debug_eff;
//side_ramp=reel_wall+min(tape_emboss, tape_min_margin);

tape_chute_fixture_x=extrusion_mount_x+extrusion_mount_w/2+extrusion_mount_strength/2+fixture_axle/2;
tape_chute_fixture_y=-base_height-fixture_axle*0.75;
tape_chute_fixture_strength=fixture_axle*0.6;
tape_chute_end_angle=90-tape_chute_angle;
tape_chute_end_x=base_end+cos(tape_chute_end_angle)*tape_chute_diameter/2;
tape_chute_end_y=(sin(tape_chute_end_angle)-1)*tape_chute_diameter/2;
tape_chute_reverse_x=tape_chute_end_x+cos(tape_chute_end_angle)*tape_chute_reverse_diameter/2;
tape_chute_reverse_y=tape_chute_end_y+sin(tape_chute_end_angle)*tape_chute_reverse_diameter/2;
tape_chute_knee_x=tape_chute_fixture_x;
tape_chute_knee_y=extrusion_mount_y+extrusion_mount_h/2-extrusion_mount_unit/2;

tape_chute_contour = [
    [inset_edge-bevel_z, -base_thickness+emboss],
    [inset_edge, -base_thickness+emboss+bevel_z],
    [inset_edge, emboss+tape_width+reel_wall-bevel_z],
    [inset_edge-bevel_z, emboss+tape_width+reel_wall+e*2],
    [-inset_edge+bevel_z, emboss+tape_width+reel_wall+e*2],
    [-inset_edge, emboss+tape_width+reel_wall-bevel_z],
    [-inset_edge, emboss+tape_width+bevel_z],
    [-inset_edge+bevel_z, emboss+tape_width],
    [0, emboss+tape_width],
    [0, emboss-tape_chute_play],
    [-emboss+tape_chute_play, 0],
    [-emboss+tape_chute_play, -base_thickness+emboss+bevel_z],
    [-emboss+tape_chute_play+bevel_z, -base_thickness+emboss],
];

tape_chute_reverse_ramp=min(sprocket_margin+base_thickness, tape_max_height);

tape_chute_reverse_contour = [
    [-tape_max_height-inset_edge+bevel_z, -base_thickness+emboss],
    [-tape_max_height-inset_edge, -base_thickness+emboss+bevel_z],
    [-tape_max_height-inset_edge, emboss+tape_width+reel_wall-bevel_z],
    [-tape_max_height-inset_edge+bevel_z, emboss+tape_width+reel_wall+2*e],
    [inset_edge-bevel_z, emboss+tape_width+reel_wall+e*2],
    [inset_edge, emboss+tape_width+reel_wall-bevel_z],
    [inset_edge, -base_thickness+emboss+bevel_z],
    [inset_edge-bevel_z, -base_thickness+emboss],
    [0, -base_thickness+emboss],
    [0, emboss+tape_width+reel_wall-layer_wall],
    [-tape_max_height, emboss+tape_width+reel_wall-layer_wall],
    [-tape_max_height, -base_thickness+emboss+layer_wall],
    [0, -base_thickness+emboss+layer_wall],
    [0, -base_thickness+emboss],
];

module pivot_chute(cutout=false) {
    for (a = [0, cutout ? 1 : 0]) {
        translate([tape_chute_fixture_x, tape_chute_fixture_y])
        rotate((a)*tape_chute_pivot_angle) 
        translate([-tape_chute_fixture_x, -tape_chute_fixture_y]) {
            children();
        }
    }
}

// build --------------------------------------------------
 
module spent_tape_chute(cutout=false, play=0) {
     // fixture for spent tape chute
    if (extrusion_mount_enabled) {
        debug_a = cutout ? 0 : ((debug_eff && tape_chute_pivot_debug) ? 1 : 0);
        
        tensioned_mode = (cutout || (debug_eff && ! relax_springs));
        
        tape_chute_angle_eff = tensioned_mode ? tape_chute_angle :
            tape_chute_angle + tape_chute_tension_angle;
        tape_chute_diameter_eff = tensioned_mode ? tape_chute_diameter : 
            tape_chute_diameter*tape_chute_angle/tape_chute_angle_eff;
        
        
        first_bend_cx = 
            tape_chute_end_x-cos(tape_chute_end_angle)*tape_chute_diameter_eff/2;
        first_bend_cy = 
            tape_chute_end_y-sin(tape_chute_end_angle)*tape_chute_diameter_eff/2;
        
        tape_chute_tension_angle_eff = tensioned_mode ? 0 : tape_chute_tension_angle;
        
        snout_x = first_bend_cx+cos(tape_chute_tension_angle_eff+90)*tape_chute_diameter_eff/2;
        snout_y = first_bend_cy+sin(tape_chute_tension_angle_eff+90)*tape_chute_diameter_eff/2;
        difference() {
            union() {
                // axle
                translate([0, 0, emboss]) {
                    beveled_extrude(height=tape_width+reel_wall+e*2, angle=cutout?135:45, 
                        bevel=bevel_z, convexity=6) {
                        translate([tape_chute_fixture_x, tape_chute_fixture_y]) 
                            circle_p(d=fixture_axle+play);
                    }
                }
                
                translate([tape_chute_fixture_x, tape_chute_fixture_y, 0])
                rotate([0, 0, debug_a*tape_chute_pivot_angle]) 
                translate([-tape_chute_fixture_x, -tape_chute_fixture_y, 0]) {
                    // side structures and pivot leg
                    translate([0, 0, emboss+tape_width]) {
                        beveled_extrude(height=reel_wall+e*2, angle=cutout?135:45, bevel=bevel_z, convexity=6) {
                            pivot_chute(cutout) {
                                intersection() {
                                    union() {
                                        // connection to chute
                                        hull() {
                                            translate([tape_chute_fixture_x, tape_chute_fixture_y]) 
                                                circle_p(r=tape_chute_fixture_strength+play/2);
                                            translate([tape_chute_knee_x, tape_chute_knee_y]) 
                                                circle_p(r=tape_chute_fixture_strength+play/2);
                                        }
                                        hull() {
                                            translate([tape_chute_knee_x, tape_chute_knee_y]) 
                                                circle_p(r=tape_chute_fixture_strength+play/2);
                                            translate([tape_chute_end_x, tape_chute_end_y]) 
                                                circle_p(r=tape_chute_fixture_strength*2-inset_edge+play/2);
                                        }
                                        // little thingy to lock to feeder snout
                                        translate([snout_x, snout_y])
                                        rotate(tape_chute_tension_angle_eff*0.66) // don't rotate all the way
                                        translate([-base_end, -0]) {
                                            d=tape_chute_fixture_strength;
                                            polygon([
                                                [base_end, 0],
                                                [base_end, -base_height-d+play],
                                                each arc(
                                                [base_end-tape_chute_fixture_strength/5, 
                                                    -base_height-d+play],
                                                [base_end-tape_chute_fixture_strength/5, 
                                                    -base_height-d-tape_chute_fixture_strength-play],
                                                210),
                                                [base_end, -base_height-d-tape_chute_fixture_strength-play],
                                                each arc(
                                                [base_end, -base_height-d-tape_chute_fixture_strength],
                                                [base_end+base_height+d+tape_chute_fixture_strength, 0],
                                                90),
                                            ]);
                                        }
                                    }
                                    // intersection contour
                                    hull() {
                                        translate([first_bend_cx, first_bend_cy]) 
                                            circle_p(d=tape_chute_diameter_eff+2*inset_edge-bevel_z);
                                        translate([tape_chute_knee_x, tape_chute_knee_y]) 
                                            circle_p(d=tape_chute_fixture_strength*2);
                                        translate([tape_chute_fixture_x, tape_chute_fixture_y]) 
                                                circle_p(r=tape_chute_fixture_strength*2);
                                            
                                    }
                                }
                            }
                        }
                    }
                    
                    // actual chute
                    if (!cutout) {
                        // first bend
                        translate([first_bend_cx, first_bend_cy, 0]) 
                        rotate([0, 0, 90-tape_chute_angle-e]) {
                            rotate_extrude(angle=tape_chute_angle_eff+e, $fn=fn_by_err(tape_chute_diameter_eff/2)) {
                                translate([tape_chute_diameter_eff/2, 0]) 
                                    polygon(tape_chute_contour);
                            }
                        }
                        // second bend
                        translate([tape_chute_reverse_x, tape_chute_reverse_y, 0]) 
                        rotate([0, 0, tape_chute_end_angle]) {
                            rotate_extrude(angle=tape_chute_reverse_angle, 
                                $fn=fn_by_err(tape_chute_reverse_diameter/2)) {
                                translate([-tape_chute_reverse_diameter/2, 0]) {
                                    polygon(tape_chute_reverse_contour);
                                }
                            }
                        }
                    }
                }
            }
            union() {
                // bevel entry into chute
                bevel_angle=(inset_edge-extrusion_width)/tape_chute_diameter_eff*360/PI;
                bevel_dx=sin(bevel_angle)*tape_chute_diameter_eff/2;
                bevel_dy=(1-cos(bevel_angle))*tape_chute_diameter_eff/2+_fp;
                translate([snout_x, snout_y, 0])
                rotate([0, 0, tape_chute_tension_angle_eff]) // don't rotate all the way
                translate([-base_end, 0, 0]) {
                    hull() {
                        translate([base_end+bevel_dx, -tape_max_height-bevel_dy, emboss-tape_chute_play])
                            cube([e, tape_max_height, tape_width+tape_chute_play]);
                        translate([base_end-1, -tape_max_height-extrusion_width, 0])
                            cube([1, tape_max_height+inset_edge, emboss+tape_width+bevel_z+layer_height]);
                        /*
                                [base_end-e, inset_edge-extrusion_width],
                                [base_end+inset_edge*4, -inset_edge],
                                [base_end-e, -inset_edge],
                            ]);*/
                    }
                }
                translate([0, 0, -base_thickness+emboss-e]) {
                    linear_extrude(height=base_thickness+tape_width+reel_wall+4*e) {
                        // flat end of chute
                        r=(tape_chute_reverse_diameter/2+tape_max_height+inset_edge-bevel_z);
                        tape_chute_reverse_end_x=tape_chute_reverse_x
                            +cos(180+tape_chute_end_angle+tape_chute_reverse_angle)*r;
                        tape_chute_reverse_end_y=tape_chute_reverse_y
                            +sin(180+tape_chute_end_angle+tape_chute_reverse_angle)*r;
                        polygon([
                            [tape_chute_reverse_x, 
                                tape_chute_reverse_end_y],
                            [tape_chute_reverse_end_x, 
                                tape_chute_reverse_end_y],
                            [tape_chute_reverse_end_x-inset_edge*2, 
                                tape_chute_reverse_end_y+inset_edge*2],
                            [tape_chute_reverse_end_x-inset_edge*2, 
                                tape_chute_reverse_end_y-tape_max_height],
                            [tape_chute_reverse_x, 
                                tape_chute_reverse_end_y-tape_max_height],
                        ]);
                    }
                }
            }
        }
    }
}

if (do_tape_chute) {
    translate([
        debug_eff ? 0 : -base_height+gap*2,
        debug_eff ? 0 : base_end+(extrusion_mount_y+extrusion_mount_h/2)-tape_chute_fixture_strength-gap*3.5,
        debug_eff ? 0 : tape_width+reel_wall+emboss+e*2 
        ]) {
        rotate([debug_eff ? 0 : 180, 0, debug_eff ? 0 : -75]) {    
            color([1, 0.5, 0.0, 0.5]) 
                render_preview(convexity=20) 
                    spent_tape_chute(play=-fixture_play);
        }
    }
}

 
function test_play(i) = 
    (i == 0 ? 0 : (test_play_min+(i-1)*test_play_inc));

if (do_test_print) {
    test_outer=lever_axle_diameter+2*reel_axle_wall;
    test_step=test_outer+gap;

    translate([base_length+spool_outer_diameter, 0, 0]) {
       
        render_preview(convexity=20) 
        difference() {
            union() {
                translate([0, 0, e]) {
                    if (test_axle) {
                        beveled_extrude(convexity=10, height=test_height+test_thickness-e) {
                            translate([0, 0]) {
                                circle_p(d=lever_axle_diameter);
                            }
                        }
                    }
                    beveled_extrude(convexity=10, height=test_height-e) {
                        for (i = [1:test_nuts]) {
                            translate([i*test_step, 0]) {
                                circle_p(d=test_outer+test_play(i));
                            }
                        }
                    }
                    beveled_extrude(convexity=10, height=test_thickness) {
                        for (i = [(test_axle?0:1):test_nuts]) {
                            translate([i*test_step, 0]) {
                                hull() {
                                    translate([0, 2])
                                        circle_p(d=test_outer+test_play(i));
                                    translate([0, -lever_axle_diameter/2-1])
                                        circle_p(d=test_outer+test_play(i));
                                }
                            }
                        }
                    }
                }
            }
            union() {
                translate([0, 0, -e]) {
                    if (test_axle) {
                        beveled_extrude(convexity=test_height, height=test_height+test_thickness+2*e, angle=135) {
                            translate([0, 0]) {
                                circle_p(d=cross_screw_diameter+screw_play);
                            }
                        }
                    }
                    beveled_extrude(convexity=test_height, height=test_height+2*e, angle=135) {
                        for (i = [1:test_nuts]) {
                            translate([i*test_step, 0]) {
                                circle_p(d=lever_axle_diameter+test_play(i));
                            }
                        }
                    }
                    linear_extrude(height=logo_etch+e) {
                        for (i = [1:test_nuts]) {
                            translate([i*test_step, -lever_axle_diameter/2-1, 0]) {
                                mirror([1, 0]) {
                                    offset(delta=logo_etch_font/2) 
                                        text(text=str(test_play(i)*100), size=5, 
                                            halign="center", valign="top",
                                            font="Liberation Mono", $fa=30);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
} 
 
 
module handle_lock(play=0, cutout=false, lock=true) {
    edge_dx=handle_lock_edge_x-handle_lock_axle_x;
    edge_dy=handle_lock_edge_y-handle_lock_axle_y;
    edge_r=distance(edge_dx, edge_dy);
    r=1; // point of the lock
    travel_dx=extrusion_mount_slot_thickness*2;
    travel0=edge_dx+travel_dx-r;
    travel1=edge_dx-extrusion_mount_slot_thickness*2-(1-cos(hanger_angle/2))*hanger_radius;
    travel_angle=atan2(hanger_y-handle_lock_axle_y, travel1)
        -atan2(edge_dy+extrusion_mount_slot_thickness/sqrt(2)-r, travel0);
    a0 = (debug_eff  && handle_lock_debug && ! cutout) ? 1 : 0;
    n_rot = cutout ? 
        12
        : (debug_eff ? 0 : 0);
    da = (n_rot == 0  ? travel_angle : travel_angle/n_rot);
    handle_lock_cutout_play_eff = cutout ? handle_lock_cutout_play : 0;
    if (extrusion_mount_enabled) {
        difference() {
            union() {
                // lock
                if (lock) {
                    translate([0, 0, -handle_lock_thickness]) {
                        beveled_extrude(handle_lock_thickness, bevel=(cutout ? 0 : bevel_z), convexity=n_rot+4) {
                            union() {
                                for(a = [0:n_rot]) {
                                    rotate((a0+a)*da) {
                                        translate([0, 0]) 
                                            circle_p(d=handle_lock_diameter+play);
                                        
                                        // rest the lever on the outer slot edge, and create the knee
                                        // flush with the edge radius 
                                        edge_outer=[
                                            edge_dx-extrusion_mount_slot_thickness,
                                            edge_dy+(extrusion_mount_slot_outer-extrusion_mount_slot_inner)/2];
                                        angle_knee=atan2(edge_outer.y, edge_outer.x);
                                        knee_inner=(edge_r-handle_lock_squeeze)
                                            *[cos(angle_knee), sin(angle_knee)];
                                        knee_r=(extrusion_mount_slot_inner-(edge_dy-handle_lock_squeeze-knee_inner.y))
                                            /(abs(sin(angle_knee))+abs(cos(angle_knee)))/(1+sqrt(2)/2);
                                        knee=knee_inner+knee_r
                                            *[cos(angle_knee-45), sin(angle_knee-45)]*sqrt(2);
                                        
                                        hull() {
                                            translate([-handle_lock_diameter/4*cos(handle_lock_angle), 
                                                -handle_lock_diameter/4*sin(handle_lock_angle)]) 
                                                circle_p(d=handle_lock_diameter/2+play);
                                            
                                            translate(knee) 
                                                circle_p(r=knee_r+handle_lock_cutout_play_eff);
                                        }
                                        hull() {
                                            translate(knee) 
                                                circle_p(r=knee_r+handle_lock_cutout_play_eff);
                                            translate([edge_dx+travel_dx-r-handle_lock_tension, 
                                                edge_dy+extrusion_mount_slot_thickness/sqrt(2)-r
                                                +handle_lock_tension])
                                                circle_p(r=r);
                                        }
                                    }
                                }
                            }
                        }
                    }
                
                    // handle "keep-it-in"
                    dia=(handle_lock_diameter+play)/2;
                    dia0=dia;
                    dia1=dia0-bevel_z*2;
                    x=dia-dia0/2;
                    y=handle_lock_diameter/2-dia0/4;
                    th=dia0/2+bevel_z*2+handle_pull_thickness;//handle_lock_thickness*0.75;
                    
                    translate([0, 0, -th]) {
                        union() {
                            for(a = [0:n_rot]) {
                                rotate(handle_lock_angle+(a0+a)*da) {
                                    hull() {
                                        translate([x, y, 0]) 
                                            cylinder_p(
                                                d=dia1+play*2,
                                                h=(cutout && a == 0) ? th-bevel_z-e : bevel_z*2);
                                        
                                        cylinder_p(
                                            d=dia,//handle_lock_diameter+play-_fp*4,
                                            h=th-bevel_z);
                                    }
                                }
                            }
                        }
                    }
                }
                
                // handle
                translate([0, 0, -handle_pull_thickness]) {
                    beveled_extrude(height=handle_pull_thickness, 
                        bevel=(cutout ? 0 : bevel_z),
                        convexity=10) {
                        offset(delta=play/2, chamfer=true) {
                            union() {
                                for(a = [0:n_rot]) {
                                    rotate(handle_lock_angle+(a0+a)*da) {
                                        //offset(r=bevel_xy) 
                                        //offset(delta=-bevel_xy, chamfer=true) 
                                        difference() {
                                            union() {
                                                if (! cutout) {
                                                    translate([0, handle_pull_length])
                                                        circle_p(d=handle_diameter);
                                                }
                                                translate([-handle_pull_strength/2, 0])
                                                    square([handle_pull_strength, 
                                                        cutout ? -handle_lock_axle_y+handle_pull_strength 
                                                            : handle_pull_length]);
                                                
                                                // "arounds"
                                                if (! cutout) {
                                                    // lever axle
                                                    intersection() {
                                                        rotate(-handle_lock_angle-travel_angle) 
                                                            translate([lever_axle_x-handle_lock_axle_x,
                                                                lever_axle_y-handle_lock_axle_y])
                                                                circle_p(d=lever_axle_diameter
                                                                    +2*handle_pull_strength);
                                                        translate([-1.5*handle_pull_strength, 0])
                                                            square([handle_pull_strength*2, 
                                                                handle_pull_length]);
                                                    }
                                                    // spool connector
                                                    intersection() {
                                                        rotate(-handle_lock_angle) 
                                                            translate([spool_axle_x-handle_lock_axle_x,
                                                                spool_axle_y-handle_lock_axle_y])
                                                                circle_p(d=reel_holder_strength
                                                                    +2*handle_pull_strength);
                                                        translate([-handle_pull_strength/2, 0])
                                                            square([handle_pull_strength*2, 
                                                                handle_pull_length]);
                                                    }
                                                    // lever knob
                                                    intersection() {
                                                        rotate(-handle_lock_angle-travel_angle) 
                                                            translate([lever_axle_x+lever_feed_x-handle_lock_axle_x,
                                                                lever_axle_y+lever_feed_y-handle_lock_axle_y])
                                                                circle_p(d=lever_axle_diameter
                                                                    +2*handle_pull_strength);
                                                        translate([-1.5*handle_pull_strength, 0])
                                                            square([handle_pull_strength*2, 
                                                                handle_pull_length]);
                                                    }
                                                }
                                            }
                                            union() {
                                                if (! cutout) {
                                                    // hole in handle
                                                    translate([0, handle_pull_length])
                                                        circle_p(d=handle_diameter-handle_strength);
                                                    // cutouts of "arounds"
                                                    // spool connector
                                                    rotate(-handle_lock_angle) 
                                                        translate([spool_axle_x-handle_lock_axle_x,
                                                            spool_axle_y-handle_lock_axle_y])
                                                            circle_p(d=reel_counterpart_connector+play*2);
                                                    // lever axle
                                                    rotate(-handle_lock_angle-travel_angle) 
                                                        translate([lever_axle_x-handle_lock_axle_x,
                                                            lever_axle_y-handle_lock_axle_y])
                                                            circle_p(d=lever_axle_outer_diameter+play*2);
                                                    // lever knob
                                                    rotate(-handle_lock_angle-travel_angle) 
                                                        translate([lever_axle_x+lever_feed_x-handle_lock_axle_x,
                                                            lever_axle_y+lever_feed_y-handle_lock_axle_y])
                                                            circle_p(d=lever_axle_diameter
                                                                -nozzle_play+play);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            union() {
                translate([0, 0, -lever_thickness-e]) {
                    if (!cutout) {
                        cylinder_p(d=handle_lock_inner_axle, h=lever_thickness+2*e);
                    }
                }
            
            }
        }
    }
}


if (do_handle_lock) {
    
    if (debug_eff && extrusion_mount_enabled) {
        
        // draw extrusion for fun
        color([0.6, 0.6, 0.6, 1]) {
            translate([extrusion_mount_x-extrusion_mount_w/2, 
                extrusion_mount_y-extrusion_mount_h/2, -10]) {
        
                r=0.6; w=extrusion_mount_w; h=extrusion_mount_h;
                    
                linear_extrude(height=25) {
                    polygon([
                        // lower left corner
                        each arc(
                        [0, r],
                        [r, 0],
                        90),
                        
                        each extrusion_side(0, 0, w, h, 0),
                        
                        // lower right corner
                        each arc(
                        [w-r, 0],
                        [w, r],
                        90),
                        
                        each extrusion_side(w, 0, h, w, 90),
                        
                        // upper right corner
                        each arc(
                        [w, h-r],
                        [w-r, h],
                        90),
                        
                        each extrusion_side(w, h, w, h, 180),
 
                        // upper leftcorner
                        each arc(
                        [r, h],
                        [0, h-r],
                        90),
                        
                        each extrusion_side(0, h, h, w, 270),
                        
                    ]);
                }
            }
        }
    }
                            
    color([1, 1, 0, .7]) {
        translate([
            debug_eff ? handle_lock_axle_x : reel_x-sin(hanger_reel_axle_angle)*(reel_washer+gap*2)*2, 
            debug_eff ? handle_lock_axle_y : reel_y+cos(hanger_reel_axle_angle)*(reel_washer+gap*2)*2, 
            debug_eff ? lever_thickness+e : 0]) {
            rotate([0, 0, 
                    debug_eff ? 0 : 90+atan2(spool_axle_y-reel_y, spool_axle_x-reel_x)]) {
                
                translate([0, debug_eff ? 0 : -20, 0]) rotate([0, 0, 
                    debug_eff ? 0 : 
                    handle_lock_angle]) {
                    rotate([debug_eff ? 0 : 180, 0, 0]) {
                        render_preview(convexity=20) 
                            handle_lock(play=-handle_lock_play);
                    }
                }
            }
        }
    }
}                     
       
// NOTE this is the right side view in the Y-Z plane
head_top_z = nozzle_shaft_length
        +nozzle_plate_thickness+nozzle_mount_thickness
        +nozzle_adapter_strength;
cable_tie_y = -nozzle_shaft_diameter/2-nozzle_adapter_strength;
cable_tie_z = [wall, 
nozzle_shaft_length-nozzle_mount_screw_height-cable_tie_width-wall];

h_flange = nozzle_shaft_length-nozzle_adapter_strength;
flange=wall;
head_half=nozzle_mount_across/2+nozzle_adapter_strength;
head_half_y=nozzle_mount_diameter/2+nozzle_plate_portrusion
        +nozzle_adapter_strength;
head_face_dist=head_half_y+nozzle_adapter_strength*2+nozzle_mount_groove;
slide_on_z = nozzle_shaft_length-nozzle_adapter_strength*3;

function slide_on_contour(play=0) = [
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove-play+nozzle_adapter_strength, 
            head_top_z+play],
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove-play, 
            head_top_z-nozzle_mount_groove+play],
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove/2+play, 
            head_top_z-nozzle_mount_groove+play],
        [-head_face_dist+nozzle_adapter_strength+play, 
            head_top_z+play],
        [-head_face_dist, 
            head_top_z+play],
            
        [-head_face_dist, 
            slide_on_z-play],
        [-head_face_dist+nozzle_adapter_strength+play, 
            slide_on_z-play],
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove/2+play, 
            slide_on_z+nozzle_mount_groove-play],
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove-play, 
            slide_on_z+nozzle_mount_groove-play],
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove-play+nozzle_adapter_strength, 
            slide_on_z-play],    
    ];
    
if (do_nozzle_adapter || do_lever_actuator || ((do_lever || do_base_plate) && debug_eff)) {
    // nozzle adapter
    reel_x=tape_inset_begin-reel_diameter/2-8;
    reel_y=-sin(atan2(reel_diameter/2+spool_outer_diameter/2, reel_x-spool_axle_x))*reel_diameter/2;
    
    // actuator thickness (from nominal 8mm tape)
    thickness=reel_wall+(8/2)-lever_actuation_delta-2*nozzle_play;
    actuator_d=lever_actuation_delta+nozzle_play-sprocket_gap/2;
    animate_x = [0, -nozzle_actuation_travel, -nozzle_to_camera_offset];
    animate_z = [e, nozzle_actuation_z, nozzle_safe_z]; // machine Z == Y in this model
    animate_color = [[0.5, 0.5, 0.5, 0.3], [1, 0.5, 0.5, 0.3], [0.5, 1, 0.5, 0.1]];
        
    slide_on_contour_cutout = [
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove+nozzle_adapter_strength, 
            slide_on_z-nozzle_mount_groove],
        [-head_face_dist-nozzle_mount_groove, slide_on_z-nozzle_mount_groove],
        [-head_face_dist-nozzle_mount_groove, head_top_z+nozzle_mount_groove],
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove+nozzle_adapter_strength, 
            head_top_z+nozzle_mount_groove],
            
        each slide_on_contour(),
    ];
        
    flange_support_contour = 
    [
        [-head_face_dist+layer_height,
            slide_on_z+e],
        [-nozzle_shaft_diameter/2-nozzle_adapter_strength*2-flange, 
            0],
        
        [0, 0],
        each [ for (cable_tie_z0 = cable_tie_z) each [
            [0, cable_tie_z0],
            [cable_tie_y-cable_tie_thickness, cable_tie_z0],
            [cable_tie_y-cable_tie_thickness, cable_tie_z0+cable_tie_width],
            [0, cable_tie_z0+cable_tie_width],
            ]
        ],
        
        [0, slide_on_z+e],
    ];
        
    actuator_countour=[
        each [ let(s=len(slide_on_contour())) // reversed
            for (i=[1:s]) slide_on_contour(nozzle_mount_attach_play)[s-i] ],

        
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove+nozzle_adapter_strength, 
            head_top_z+lever_axle_diameter/2],
        
        
        each arc(
        [-head_face_dist-lever_axle_diameter/2, 
            head_top_z+lever_axle_diameter/2],
        [-lever_axle_diameter/2-nozzle_actuation_dist-nozzle_insert_slant,
            -nozzle_actuation_dist_z+lever_axle_diameter/2],
        60),
        [-lever_axle_diameter/2-nozzle_actuation_dist-nozzle_insert_slant, 
            -nozzle_actuation_dist_z
            -nozzle_travel_z+lever_axle_diameter/2],
        [-lever_axle_diameter/2-nozzle_actuation_dist, 
            -nozzle_actuation_dist_z+nozzle_insert_slant
            -nozzle_travel_z+lever_axle_diameter/2],
        each arc(
        [-lever_axle_diameter/2-nozzle_actuation_dist, 
            -nozzle_actuation_dist_z+lever_axle_diameter/2],
        [lever_axle_diameter/2-nozzle_actuation_dist, 
            -nozzle_actuation_dist_z+lever_axle_diameter/2],
        -180),
        [lever_axle_diameter/2-nozzle_actuation_dist, 
            -nozzle_actuation_dist_z+nozzle_insert_slant
            -nozzle_travel_z+lever_axle_diameter/2],
        each arc(
        [lever_axle_diameter/2-nozzle_actuation_dist+nozzle_insert_slant, 
            -nozzle_actuation_dist_z-nozzle_travel_z
            +lever_axle_diameter/2],
        [-head_face_dist+nozzle_adapter_strength+nozzle_mount_groove+nozzle_adapter_strength, 
            slide_on_z-lever_axle_diameter/2],
        -90),
    ];
                                                        

    
    for (animate = [0:debug_eff ? 2 : 0]) {

        translate([
            debug_eff ? animate_x[animate] : reel_x, 
            debug_eff ? nozzle_shaft_actuation_z + animate_z[animate] - nozzle_actuation_z : 
                lever_axle_y + spool_outer_diameter + reel_washer/2, 
            debug_eff ? nozzle_tape_pos+animate*e : 
                head_face_dist]) {
            rotate([debug_eff ? -90 : 90, debug_eff ? -90 : 0, 0]) { 
                
                if (debug_eff) {
                    // draw the nozzle tip for debugging
                    color(animate_color[animate]) {
                        //render(convexity=10)
                        union() {
                            translate([0, 0, -nozzle_shaft_z]) {
                                rotate_extrude() {
                                    polygon([
                                        [0.0, 3.5],
                                        [0.5, 0],
                                        [1.25, 0],
                                        [1.25, 3.5],
                                        [2.5, 3.5],
                                        [2.5, 4.25],
                                        [1.6, 4.25],
                                        [1.6, 5.8],
                                        [3.1, 6],
                                        [3.1, 11],
                                        [5.25, 11],
                                        [5.25, 12],
                                        [3.1, 12],
                                        [3.1, 14.5],
                                        [2.625, 14.5],
                                        [3.1, 15],
                                        [4, 15],
                                        [4, 15.5],
                                        [2.625, 15.5],
                                        [2.625, 19],
                                        [4.25, 19],
                                        [4.25, 28.5],
                                        [5.25, 29],
                                        [5.25, 34],
                                        [4, 34],
                                        [4, nozzle_shaft_z-5.2],
                                        [nozzle_shaft_diameter/2, nozzle_shaft_z-5],
                                        [nozzle_shaft_diameter/2, nozzle_shaft_z-0.2],
                                        [nozzle_shaft_diameter/2-1, nozzle_shaft_z],
                                        [nozzle_shaft_diameter/2, nozzle_shaft_z],
                                        [nozzle_shaft_diameter/2, 
                                            nozzle_shaft_z+nozzle_shaft_length+nozzle_plate_thickness-e],
                                        [0, nozzle_shaft_z+nozzle_shaft_length+nozzle_plate_thickness-e]
                                    ]);
                                }
                            }
                            translate([10+nozzle_shaft_diameter/2, -10-nozzle_shaft_diameter/2, -6]) {
                                wire_cube([35, 35, 6+nozzle_shaft_length]);
                            }
                        }
                    }
                }
                color(animate_color[animate]) {
                    render_preview(convexity=30)
                    if (do_lever_actuator)  {
                        // actuator 
                        translate([debug_eff ? actuator_d : 0, debug_eff ? 0 : -head_face_dist, 0]) {
                            rotate([90, 0, debug_eff ? 0 : 90]) rotate([0, 90, 0]) {
                                beveled_extrude(height=thickness+2*fixture_play+e, convexity=20) {
                                    difference() {
                                        polygon(actuator_countour);
                                        offset(r=bevel_xy)
                                        offset(r=-lever_axle_diameter/2-bevel_xy) 
                                            polygon(actuator_countour);
                                    }
                                }
                            }
                        }
                    }

                    if (do_nozzle_adapter) 
                    render_preview(convexity=30)
                    difference() {
                        union() {
                            // adapter hull
                            
                            // shaft flange
                            difference() {
                                rotate_extrude(convexity=10) {
                                    polygon([
                                        [0, 0],
                                        [nozzle_shaft_diameter/2+nozzle_adapter_strength+flange, 0],
                                        each [ for (cable_tie_z0 = cable_tie_z) each [
                                            [nozzle_shaft_diameter/2+nozzle_adapter_strength+flange, cable_tie_z0],
                                            [nozzle_shaft_diameter/2+nozzle_adapter_strength, cable_tie_z0],
                                            [nozzle_shaft_diameter/2+nozzle_adapter_strength, cable_tie_z0
                                                +cable_tie_width],
                                            [nozzle_shaft_diameter/2+nozzle_adapter_strength+flange, cable_tie_z0
                                                +cable_tie_width],
                                        ]],
                                        [nozzle_mount_across/2+nozzle_adapter_strength-layer_height, 
                                            h_flange+e],
                                        [0, h_flange+e],
                                    ]);
                                }
                                translate([actuator_d-layer_height, -nozzle_mount_diameter/2, -3*e]) 
                                    cube([nozzle_mount_diameter+lever_actuation_delta+nozzle_play, 
                                        nozzle_mount_diameter,
                                        h_flange+6*e
                                    ]);
                            }
                            
                            
                            // head
                            difference() {
                                // the face of the head both left and front (must be the same)
                                translate([0, 0, slide_on_z]) {
                                    beveled_extrude(
                                        height=head_top_z-slide_on_z, bevel=bevel_z, convexity=10) {
                                        polygon([
                                            each arc(
                                            [actuator_d+thickness, -head_face_dist],
                                            [head_half, -nozzle_mount_diameter/2],
                                            -60),
                                            [head_half, -actuator_d+nozzle_adapter_strength],
                                            [-head_face_dist, -actuator_d+nozzle_adapter_strength],
                                            each arc(
                                            [-head_face_dist, -actuator_d-nozzle_adapter_strength*3],
                                            [-nozzle_mount_across/2, -head_face_dist],
                                            -20),
                                            ]);
                                    }
                                }
                                
                                // front slide on
                                translate([actuator_d-play-e, -e, 0]) {
                                    rotate([90, 0, 0]) rotate([0, 90, 0]) {
                                        linear_extrude(height=head_half-actuator_d+2*play+2*e, convexity=20) {
                                            polygon(slide_on_contour_cutout);
                                        }
                                    }
                                }
                                
                                // left slide on
                                translate([-e, -actuator_d+nozzle_adapter_strength+e, 0]) {
                                    rotate([90, 0, 0]) rotate([0, 0, 0]) {
                                        linear_extrude(height=nozzle_adapter_strength+thickness+play, convexity=20) {
                                            polygon(slide_on_contour_cutout);
                                        }
                                    }
                                }
                            }
                            
                            // the flange support
                            translate([actuator_d-thickness-play, 0, e]) {
                                rotate([90, 0, 0]) rotate([0, 90, 0]) {
                                    beveled_extrude(height=thickness+2*play+e, convexity=20) {
                                        polygon(flange_support_contour);
                                        //polygon(actuator_countour);
                                    }
                                }
                            }
                            
                        }
                        union() {
                            // the negative is the nozzle (Liteplacer specific)
                            corner_y=sqrt(pow(nozzle_mount_diameter/2, 2)-pow(nozzle_mount_across/2, 2));
                            corner_x=nozzle_mount_diameter/2-corner_y-nozzle_mount_across/2+nozzle_plate_portrusion;

                            // cut away back half 
                            translate([-nozzle_mount_across/2-nozzle_adapter_strength*2, 
                                -actuator_d+nozzle_adapter_strength, 
                                -e]) 
                                cube([nozzle_mount_across+nozzle_adapter_strength*4, 
                                    nozzle_mount_diameter+nozzle_adapter_strength, 
                                    nozzle_shaft_length+nozzle_plate_thickness+nozzle_mount_thickness
                                        +nozzle_shaft_length+e]);
                            
                            if (logo_enabled) {
                                // logo
                                translate([actuator_d-thickness, -head_face_dist+logo_etch*2, 
                                    (head_top_z+slide_on_z)/2]) {
                                    rotate([90, 0, 0])
                                        linear_extrude(height=logo_etch*2+e)
                                            oshw_logo(scale=8);
                                }
                            }
                            
                            
                            // stack of (negative) Liteplacer nozzle assembly ---
                            
                            // shaft
                            translate([0, 0, -e]) 
                                cylinder_p(d=nozzle_shaft_diameter, h=nozzle_shaft_length+2*e);
                            
                            // plate
                            translate([0, 0, nozzle_shaft_length]) {
                                linear_extrude(height=nozzle_plate_thickness+e, convexity=4) {
                                    polygon([
                                        [-nozzle_mount_across/2, -corner_y],
                                        [corner_x, -nozzle_mount_diameter/2-nozzle_plate_portrusion],
                                        [nozzle_mount_across/2+nozzle_adapter_strength*2, 
                                            -nozzle_mount_diameter/2-nozzle_plate_portrusion],
                                        [nozzle_mount_across/2+nozzle_adapter_strength*2, 
                                            nozzle_mount_diameter/2-nozzle_plate_portrusion],
                                        [-nozzle_mount_across/2, nozzle_mount_diameter/2],
                                    ]);
                                }
                            }
                            // nozzle mount flange
                            translate([0, 0, nozzle_shaft_length+nozzle_plate_thickness]) {
                                linear_extrude(height=nozzle_mount_thickness+e, convexity=4) {
                                    intersection() {
                                        circle_p(d=nozzle_mount_diameter);
                                        square([nozzle_mount_across, nozzle_mount_diameter+e],
                                            center=true);
                                    }
                                    translate([0, -nozzle_mount_across/2+1, 0])
                                        square([nozzle_mount_across, nozzle_mount_across]);
                                }
                            }
                            // pulley
                            translate([0, 0, nozzle_shaft_length+nozzle_plate_thickness+nozzle_mount_thickness]) {
                                linear_extrude(height=nozzle_shaft_length+e, convexity=4) {
                                    circle_p(d=nozzle_pulley_diameter+2*play);
                                    translate([0, -nozzle_mount_across/2+1, 0])
                                        square([nozzle_mount_across, nozzle_mount_across]);
                                }
                            }
                            // screw
                            translate([0, -nozzle_mount_screw_dist/2, 
                                nozzle_shaft_length-nozzle_mount_screw_height]) {
                                linear_extrude(height=nozzle_mount_screw_height+e, convexity=4) {
                                    minkowski() {
                                        circle_p(d=nozzle_mount_screw_nut);
                                        square([e, nozzle_mount_screw_dist]);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

if (do_reel_counterpart && base_with_reel_holder) {
    color([0, 1, 0, 0.71]) {
        // need to move aside if both options chosen
        connect_offset_x = 0;
        
        translate([
            debug_eff ? 0 : -sin(hanger_reel_axle_angle)*(reel_washer+3*gap), 
            debug_eff ? 0 : cos(hanger_reel_axle_angle)*(reel_washer+3*gap), 
            debug_eff ? reel_holder_thickness+reel_width-reel_wall : 0]) {
            
            angle=atan2(spool_axle_y-reel_y, spool_axle_x - reel_x);
            translate([reel_x, reel_y, 0]) 
                rotate([0, debug_eff ? 180 : 0, 0]) 
                rotate([0, 0, (debug_eff ? 180-angle*2 : 0)]) 
                    translate([-reel_x, -reel_y, 0]) {

                difference() {
                    union() {
                        // washer
                        translate([reel_x, reel_y, 0]) 
                            cylinder_p(d1=reel_washer-2*reel_holder_thickness, 
                                d2=reel_washer, 
                                h=reel_holder_thickness-layer_height+e);
                        translate([reel_x, reel_y, reel_holder_thickness-layer_height]) 
                            cylinder_p(d=reel_washer, 
                                h=layer_height);
                            
                        beveled_extrude(height=reel_holder_thickness, convexity=10) {
                            // alternative slide-on counter-washer 
                            if (reel_spool_connect) {
                                // connect
                                hull() {
                                    translate([reel_x, reel_y]) 
                                        circle_p(d=reel_holder_strength);
                                    translate([spool_axle_x, spool_axle_y]) 
                                        circle_p(d=reel_holder_strength);
                                }
                                translate([spool_axle_x, spool_axle_y]) 
                                    circle_p(d=reel_counterpart_connector);
                            }
                        }
                        
                        // counter axle
                        translate([reel_x, reel_y, e]) 
                            cylinder_p(d=reel_axle-2*reel_axle_wall-play-phase2_play,
                                h=spool_axle_groove_z-e);

                    }
                    union() {
                        // hollow axle
                        translate([reel_x, reel_y, -e])
                            cylinder_p(d=cross_screw_diameter+screw_play,
                                h=spool_axle_groove_z+2*e);

                        if (reel_spool_connect) {
                            hull() {
                                // spool axle groove
                                translate([spool_axle_x, 
                                    spool_axle_y, 
                                    reel_holder_thickness-spool_axle_groove_width-e]) {
                                    translate([0, 0, 0]) 
                                        cylinder_p(h=spool_axle_groove_width+2*e, 
                                            d1=spool_axle_groove_outer, d2=spool_axle_groove_innner);
                                    translate([0, 0, -reel_holder_thickness]) 
                                        cylinder_p(h=reel_holder_thickness+e, 
                                            d=spool_axle_groove_outer);
                                    translate([-reel_holder_strength, 0, -e]) 
                                        cylinder_p(h=spool_axle_groove_width+2*e, 
                                            d1=spool_axle_groove_outer, d2=spool_axle_groove_innner);
                                    translate([-reel_holder_strength, 0, -reel_holder_thickness]) 
                                        cylinder_p(h=reel_holder_thickness+e, 
                                            d=spool_axle_groove_outer);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

module extrusion_mount_2D() {
        
    nut_y=extrusion_mount_y+extrusion_mount_h/2-extrusion_mount_unit/2;
    base_begin_r = distance(base_begin-reel_x, -base_height-reel_y);
    left_edge_y=extrusion_mount_y-extrusion_mount_h/2+wall;
    left_edge_x=reel_x
        +sqrt(pow(base_begin_r, 2) - pow(left_edge_y-reel_y, 2));

    extrusion_mount_contour = [
        [tape_inset_begin+e, -base_height+e],
        each arc(
        [base_begin, -base_height+e],
        [left_edge_x, left_edge_y],
        atan2(left_edge_y-reel_y, left_edge_x-reel_x)-
        atan2(-base_height-reel_y, base_begin-reel_x)),
        
        each arc(
        [left_edge_x, left_edge_y],
        [extrusion_mount_x-extrusion_mount_w/2, 
            extrusion_mount_y-extrusion_mount_h/2],
        30-atan2(left_edge_y-reel_y, left_edge_x-reel_x)),
        
        each arc(
        [extrusion_mount_x-extrusion_mount_w/2,
            hanger_y-hanger_dy],
        [extrusion_mount_x-extrusion_mount_w/2+extrusion_mount_tension/2, 
            hanger_y+hanger_dy],
        -hanger_angle),
        [extrusion_mount_x-extrusion_mount_w/2,
            extrusion_mount_y+extrusion_mount_h/2],
        each [ for (xx = [0.5:extrusion_mount_w/extrusion_mount_unit]) 
            each arc(
            [extrusion_mount_x-extrusion_mount_w/2 + xx*extrusion_mount_unit
                    -extrusion_mount_slot_outer/2,
                extrusion_mount_y+extrusion_mount_h/2],
            [extrusion_mount_x-extrusion_mount_w/2 + xx*extrusion_mount_unit
                    +extrusion_mount_slot_outer/2,
                extrusion_mount_y+extrusion_mount_h/2],
            2*extrusion_mount_slot_angle),    
        ],
        [extrusion_mount_x+extrusion_mount_w/2-extrusion_mount_tension/2,
            extrusion_mount_y+extrusion_mount_h/2],
        [extrusion_mount_x+extrusion_mount_w/2,
            nut_y+extrusion_mount_slot_outer/2],
        each arc(
        [extrusion_mount_x+extrusion_mount_w/2-extrusion_mount_slot_thickness,
            nut_y+extrusion_mount_slot_inner/2],
        [extrusion_mount_x+extrusion_mount_w/2-extrusion_mount_slot_thickness,
            nut_y-extrusion_mount_slot_inner/2],
        30),
        each arc(
        [extrusion_mount_x+extrusion_mount_w/2-extrusion_mount_slot_thickness,
            nut_y-extrusion_mount_slot_inner/2],
        [extrusion_mount_x+extrusion_mount_w/2+extrusion_mount_strength,
            nut_y+extrusion_mount_strength/2],
        90),
        each arc(
        [extrusion_mount_x+extrusion_mount_w/2+extrusion_mount_strength,
            nut_y+extrusion_mount_strength/2],
        [max(extrusion_mount_x+extrusion_mount_w/2+extrusion_mount_strength, -extrusion_mount_strength),
            extrusion_mount_y+extrusion_mount_h/2],
        -15),
        each arc(
        [base_end-inset_edge, 
            extrusion_mount_y+extrusion_mount_h/2],
        [base_end, 
            extrusion_mount_y+extrusion_mount_h/2+inset_edge],
        90),
        [base_end, -base_height+e],
        [tape_inset_end-e, -base_height+e],

    ];   
    
    difference() {
        polygon(extrusion_mount_contour);
        
        if (extrusion_mount_hollow_out_right) {
            // hollow out the extrusion mount
            strength_r = extrusion_mount_strength*0.1;
            // right part
            strength_scale = 0.6;
            offset(r=strength_r) 
            offset(delta=-extrusion_mount_strength*strength_scale-strength_r, 
                chamfer=true) {
                intersection() {
                    polygon([
                        [tape_inset_begin, 
                            -base_height+extrusion_mount_strength*strength_scale],
                        each extrusion_mount_contour,
                        [tape_inset_end, 
                            -base_height+extrusion_mount_strength*strength_scale],
                        ]);
                    translate([handle_lock_axle_x+handle_lock_diameter/2,
                        extrusion_mount_y+extrusion_mount_h/2])
                        square([-sprocket_pitch*2-handle_lock_axle_x,
                            -extrusion_mount_y-extrusion_mount_h/2]);
                }
            }
        }
        if (extrusion_mount_hollow_out_left) {
            // hollow out the extrusion mount
            strength_r = extrusion_mount_strength*0.1;
            // left part
            strength_scale_left = 0.6;
            offset(r=strength_r) 
            offset(r=-extrusion_mount_strength*strength_scale_left
                    -strength_r) {
                intersection() {
                    polygon(extrusion_mount_contour);
                    translate([base_begin,
                        extrusion_mount_y-extrusion_mount_h/2])
                        square([handle_lock_axle_x-handle_lock_diameter/2-base_begin,
                            -extrusion_mount_y+extrusion_mount_h/2]);
                }
            }
        }
        /*else {
            // make it filled / reinforced
            d=3; r=extrusion_width/2;
            for (
                y = [-base_height-extrusion_mount_strength+2
                    :d*sin(60)*2:-tape_max_height],
                x = [-16:d:tape_inset_end-2]
                ) {
                translate([x, y]) rotate(-30)
                    circle_p(r=r, $fn=3);
                translate([x+d/2, y+d*sin(60)]) rotate(30)
                    circle_p(r=r, $fn=3);
            }
        }*/
    }
}


if (do_base_plate) {
    // base plate and (optionally) reel holder
    
    if (base_with_reel_holder) {
        // draw reel for debugging
        if (debug_eff) {
            color([1,1,1,0.2]) 
                translate([reel_x, reel_y, emboss-base_thickness+reel_holder_thickness]) 
                    render_preview(convexity=12)
                    difference() { 
                        cylinder_p(d=reel_diameter, h=reel_width);
                        translate([0, 0, -1])
                            cylinder_p(d=reel_diameter-1, h=reel_width+2);
                        translate([0, 0, reel_wall])
                            cylinder_p(d=reel_diameter+1, h=reel_width-2*reel_wall);
                    }
        }
    }


    color([0, 1, 0, 0.71]) {
        translate([
            debug_eff ? 0 : 0, 
            debug_eff ? 0 : 0, 
            debug_eff ? emboss-base_thickness : 0]) {
                
            render_preview(convexity=12)
            difference() {
                union() {
                    if (base_with_reel_holder) {
                        // washer
                        translate([reel_x, reel_y, 0]) 
                            cylinder_p(d1=reel_washer-2*reel_holder_thickness, 
                                d2=reel_washer, 
                                h=reel_holder_thickness-layer_height+e);
                        translate([reel_x, reel_y, reel_holder_thickness-layer_height]) 
                            cylinder_p(d=reel_washer, 
                                h=layer_height);
                        
                        // reel holder
                        beveled_extrude(height=reel_holder_thickness, convexity=10) {
                            difference() {
                                union() {
                                    hull() {
                                        translate([spool_reel_connect_x, spool_reel_connect_y]) 
                                            circle_p(d=reel_holder_strength);
                                        translate([spool_reel_connect_x-spool_axle_x+reel_x, 
                                            spool_reel_connect_y-spool_axle_y+reel_y]) 
                                            circle_p(d=reel_holder_strength);
                                        translate([reel_x, reel_y]) 
                                            circle_p(d=reel_holder_strength);
                                        translate([tape_inset_begin, min(spool_axle_y, lever_axle_y)]) 
                                            circle_p(d=reel_holder_strength);
                                        translate([hanger_connect_x, hanger_connect_y]) 
                                            circle_p(d=reel_holder_strength);
                                    }
                                }
                                union() {
                                    // reel holder 2D cutaways
                                    offset(r=reel_holder_strength*0.2) offset(delta=-reel_holder_strength*0.7) {
                                        intersection() {
                                            hull() {
                                                translate([spool_axle_x, spool_axle_y]) 
                                                    circle_p(d=e);
                                                translate([reel_x, reel_y]) 
                                                    circle_p(d=e);
                                                translate([hanger_connect_x, hanger_connect_y]) 
                                                    circle_p(d=e);
                                            }
                                            translate([reel_x, reel_y]) 
                                                circle_p(d=reel_diameter-e);
                                        }
                                    }
                                    if (extrusion_mount_enabled) {
                                        // make sure to cut away the extrusion mount to allow
                                        // hollowing-out
                                        difference() {
                                            polygon([
                                                [base_begin, 0],
                                                [base_begin, 
                                                    extrusion_mount_y-extrusion_mount_h/2],
                                                [base_end, 
                                                    extrusion_mount_y-extrusion_mount_h/2],
                                                [base_end, 0],
                                            ]);
                                            translate([reel_x, reel_y])
                                                circle_p(r=distance(reel_x-base_begin, reel_y-base_bottom)
                                                    +bevel_z*2);
                                        }
                                    }
                                }
                            }
                        }
                        
                        // reel axle 
                        // NOTE: due to the large specification max width we don't go all the way across
                        translate([reel_x, reel_y, reel_holder_thickness-e]) {
                            cylinder_p(d=reel_axle-play, 
                                h=spool_axle_groove_z-reel_holder_thickness+e);

                            // reel axle anti-friction washer
                            // NOPE: cylinder_p(d=reel_axle-play+base_anti_friction_ring);
                        
                        }                            
                    }
                    beveled_extrude(height=lever_thickness+base_thickness-emboss,
                        bevel=bevel_z, convexity=10) {
                        union() {
                            // lever axle
                            translate([lever_axle_x, lever_axle_y]) 
                                circle_p(d=lever_axle_diameter);
                            
                            // spool axle
                            translate([spool_axle_x, spool_axle_y]) 
                                circle_p(d=spool_axle_diameter);
                            
                            // tape inset fixture
                            polygon([
                                [tape_inset_begin-tape_inset_slant, -tape_max_height],
                                [tape_inset_begin, -base_height],
                                [tape_inset_end, -base_height],
                                [tape_inset_end+tape_inset_slant, -tape_max_height]
                            ]);
                            
                            // mounting on extrusion 
                            if (extrusion_mount_enabled) {
                                extrusion_mount_2D();
                            }
                        }
                    }
                    
                    // dog reverse block
                    beveled_extrude(height=base_thickness-emboss+ratchet_thickness-layer_height) {
                        block_angle=lever_dog_angle-1.2*sprocket_pitch*180/PI/lever_dog_leverage;
                        difference() {
                            translate([lever_axle_x+lever_dog_leverage*cos(block_angle)+lever_node*sin(block_angle), 
                                    lever_axle_y+lever_dog_leverage*sin(block_angle)-lever_node*cos(block_angle)]) 
                                        circle_p(d=lever_node*2);
                            hull() {
                                translate([lever_axle_x+lever_dog_leverage*cos(block_angle), 
                                    lever_axle_y+lever_dog_leverage*sin(block_angle)]) 
                                        circle_p(d=lever_node);
                                translate([lever_axle_x, lever_axle_y]) 
                                    circle_p(d=lever_axle_diameter);
                            }
                        }
                    }
                    // blocking fixtures
                    beveled_extrude(height=base_thickness+tape_width, convexity=10) {
                        difference () {
                            hull() {
                                translate([block_axle_x, block_axle_y]) 
                                    circle_p(d=fixture_axle+2*wall);
                            }
                            union() {
                                // cutout ratchet blocking spring fixture
                                translate([block_axle_x, block_axle_y]) 
                                    circle_p(d=fixture_axle, $fn=6);
                                polygon(points=[
                                        [block_axle_x, block_axle_y],
                                        [block_axle_x-fixture_axle, block_axle_y+fixture_axle/2],
                                        [block_axle_x-fixture_axle, block_axle_y-fixture_axle/2]
                                    ]);
                            }
                        }
                        // dog blocker
                        y0=inset_edge+dog_blocker_cover_offset;
                        y1=y0+dog_blocker_strength/2;
                        polygon([
                            [(y0+bevel_z)*dog_slant+dog_nominal_x+dog_strength/2, 
                                y0+bevel_z],
                            [y0*dog_slant+dog_nominal_x+dog_strength/2+bevel_z, 
                                y0],
                            each arc(
                                [y0*dog_slant+dog_nominal_x+dog_strength/2+dog_blocker_strength/2, 
                                    y0],
                                [y1*dog_slant+dog_nominal_x+dog_strength/2, 
                                    y1],
                                270),
                        ]);

                    }
                    
                    // thinner parts of the base plate (embossed)
                    beveled_extrude(height=base_thickness-emboss, bevel=bevel_z, convexity=10) {
                        difference() {
                            union() {
                                margin = max(lever_axle_outer_diameter/2, base_margin);
                                max_y=max(lever_axle_y+margin, spool_axle_y+reel_holder_strength/2);
                                max_spool_dy = max_y-spool_axle_y-reel_holder_strength/2;
                                translate([spool_axle_x, spool_axle_y]) 
                                        circle_p(d=spool_ratchet_shield);
                                polygon([
                                    [spool_axle_x, spool_axle_y+reel_holder_strength/2+max_spool_dy],
                                    [min(spool_axle_x+spool_dx-reel_holder_strength/2, base_begin), 
                                        spool_axle_y],
                                    [min(spool_axle_x+spool_dx-reel_holder_strength/2, base_begin), 
                                        base_bottom],
                                    [base_end, base_bottom],
                                    [base_end, 0],
                                    [dog_nominal_x+dog_strength/2+dog_blocker_strength, 0],
                                    each arc(
                                    [dog_nominal_x+dog_strength/2+dog_blocker_strength, 
                                        dog_nominal_y+dog_height1-dog_blocker_strength],
                                    [lever_axle_x+margin, lever_axle_y],
                                    -90),
                                    each arc(
                                    [lever_axle_x+margin, lever_axle_y],
                                    [lever_axle_x, lever_axle_y+margin],
                                    90),
                                    [lever_axle_x, lever_axle_y+margin],
                                    [spool_axle_x+reel_holder_strength/2+max_spool_dy, 
                                        spool_axle_y+reel_holder_strength/2+max_spool_dy],
                                ]);
                                
                                if (extrusion_mount_enabled) 
                                    extrusion_mount_2D();
                            }
                            union() {
                                translate([reel_x, reel_y])
                                    circle_p(r=distance(reel_x-base_begin, reel_y-base_bottom)); 
                            }
                        }
                    }
                    
                    // anti friction ring
                    translate([lever_axle_x, lever_axle_y, base_thickness-emboss-e]) {
                        cylinder_p(h=layer_height+e, d=lever_axle_diameter+2*base_anti_friction_ring);
                    }
                    
                    if (emboss > 0) {
                        // thicker parts of the base plate
                        beveled_extrude(height=base_thickness, bevel=bevel_z, convexity=6) {
                            // tape side
                            y0 = -base_height;
                            tape_lane_profile = [
                                [base_begin+base_length, y0],
                                each arc(
                                [base_begin+base_length, 0],
                                [base_begin+base_length-base_tape_edge, base_tape_edge],
                                90),
                            
                                [dog_nominal_x+dog_strength/2+dog_blocker_strength+dog_slant*base_tape_edge, 
                                    base_tape_edge],
                                [dog_nominal_x+dog_strength/2+dog_blocker_strength+dog_slant*base_tape_edge, 
                                    dog_nominal_y+dog_height1-dog_blocker_strength],
                                [dog_nominal_x+dog_strength/2
                                    +dog_slant*(dog_nominal_y+dog_height1-dog_blocker_strength), 
                                    dog_nominal_y+dog_height1-dog_blocker_strength],
                                [dog_nominal_x+dog_strength/2, 
                                    0],
                                [dog_nominal_x-dog_travel_nominal-sprocket_pitch-dog_strength, 
                                    0],
                                [dog_nominal_x-dog_travel_nominal-sprocket_pitch-dog_strength-inset_edge, 
                                    inset_edge+e],
                            
                                each arc(
                                [base_begin+base_tape_edge, base_tape_edge],
                                [base_begin, 0],
                                90),
                                [base_begin, y0],
                                ];
                            polygon(tape_lane_profile);
                        }
                    }
                    /* --> on the inset
                    // sprocket ledge
                    translate([0, 0, base_thickness-e]) {
                        linear_extrude(height=sprocket_margin+e, convexity=4) {
                            // tape side
                            y0 = -base_height;
                            tape_ledge_profile = [
                                [base_end, y0],
                                each arc(
                                [base_end, -base_tape_edge],
                                [base_end-base_tape_edge, 0],
                                90),
                            
                                each arc(
                                [base_begin+base_tape_edge, 0],
                                [base_begin, -base_tape_edge],
                                90),
                                [base_begin, y0],
                                ];
                            polygon(tape_ledge_profile);
                        }
                    }*/
                    
                }
                union() {
                    // cutaways
                    
                    // logo
                    if (logo_enabled) {
                        if (logo_size > 0) {
                            translate([logo_x, logo_y, -e]) {
                                render_preview(convexity=20) 
                                linear_extrude(height=logo_etch+e) {
                                    mirror([1, 0, 0]) {
                                        difference() {
                                            offset(delta=logo_etch_pen/2)
                                                oshw_logo(logo_size);
                                            offset(delta=-logo_etch_pen/2)
                                                oshw_logo(logo_size);
                                        }   
                                    }
                                }
                            }
                        }
                        if (logo_text != "") {
                            translate([logo_text_x, logo_text_y, -e]) {
                                render_preview(convexity=20) 
                                linear_extrude(height=logo_etch+e) {
                                    mirror([1, 0, 0]) {
                                        offset(delta=logo_etch_font/2) 
                                            text(text=logo_text, size=logo_font_size, 
                                                halign="center", valign="baseline",
                                                font=logo_font, $fa=30);
                                    }
                                }
                            }
                        }
                    }
                    if (logo_tag != "") {
                        translate([logo_tag_x, logo_tag_y, -e]) {
                            render_preview(convexity=20) 
                            linear_extrude(height=logo_etch+e) {
                                mirror([1, 0, 0]) {
                                    offset(delta=logo_etch_font/2) 
                                        text(text=logo_tag, size=logo_tag_font_size, 
                                            halign="left", valign="baseline",
                                            font=logo_tag_font, $fa=30);
                                }
                            }
                        }
                    }
                
                    
                    
                    // cross screws / punchouts
                    translate([lever_axle_x, lever_axle_y, -5*e])
                        cylinder_p(d=cross_screw_diameter+screw_play, 
                            h=base_thickness+tape_width+reel_wall+10*e);
                    translate([spool_axle_x, spool_axle_y, -5*e])
                        cylinder_p(d=cross_screw_diameter+screw_play, 
                            h=base_thickness+tape_width+reel_wall+10*e);
                    translate([block_axle_x, block_axle_y, -5*e])
                        cylinder_p(d=cross_screw_diameter+screw_play, 
                            h=base_thickness+tape_width+reel_wall+10*e);
                    translate([(base_begin+tape_inset_begin)/2, -base_height/2, -5*e])
                        cylinder_p(d=cross_screw_diameter+screw_play, 
                            h=base_thickness+tape_width+reel_wall+10*e);
                    
                    /*
                    // anti-vibration structures
                    for (dx = [-2, 0, 2], dy = [0, 2]) {
                        translate([dog_nominal_x-sprocket_pitch+dx, 
                                -tape_max_height-extrusion_width*4, base_thickness+sprocket_hole_distance+dy]) {
                            rotate([90, 0, 0]) {
                                cylinder_p(d=1, 
                                    h=-extrusion_mount_h/2-extrusion_mount_y-tape_max_height-extrusion_width*8,
                                    $fn=4);
                            }
                        }
                    }
                    */
                    
                    if (base_mount_screws) {
                        if (extrusion_mount_enabled) {
                            // add screws through 
                            translate([extrusion_mount_x-extrusion_mount_w/2+extrusion_mount_unit/2, 
                                -tape_max_height+e, base_thickness+tape_width/2]) {
                                rotate([90, 0, 0]) {
                                    cylinder_horizontal_cut(d=extrusion_mount_screw_diameter+screw_play, 
                                        h=-extrusion_mount_y+5*e);
                                    translate([0, 0, -tape_max_height-base_tape_edge-e])
                                        cylinder_horizontal_cut(d=screw_dk+screw_play,
                                            h=base_tape_edge+tape_max_height+screw_k);
                                }
                            }
                            if (extrusion_mount_x+extrusion_mount_w/2 < -5) {
                                translate([0, 
                                    -tape_max_height+e, base_thickness+tape_width/2]) {
                                    rotate([90, 0, 0]) {
                                        cylinder_horizontal_cut(d=extrusion_mount_screw_diameter+screw_play, 
                                            h=-extrusion_mount_y+5*e);
                                        translate([0, 0, -tape_max_height-base_tape_edge-e])
                                            cylinder_horizontal_cut(d=screw_dk+screw_play,
                                                h=base_tape_edge+tape_max_height+screw_k);
                                        /*cylinder_p(d=7.8/cos(30)+play,
                                            h=3.8, $fn=6);
                                        */
                                        translate([0, 0, -tape_max_height-(extrusion_mount_y+extrusion_mount_h/2)+2*e])
                                            cylinder_horizontal_cut(d=extrusion_mount_screw_diameter*2,
                                                h=-extrusion_mount_y);
                                    }
                                }
                            }
                        }
                        else {
                            // floor screws
                            sunk=base_height-tape_max_height;
                            for (x = base_screw_holes) {
                                translate([x, -base_height-e, base_thickness+tape_width/2])
                                    rotate([-90, 0, 0]) 
                                        cylinder_p(d1=cross_screw_diameter+screw_play, 
                                            d2=cross_screw_diameter+screw_play+2*sunk,
                                            h=sunk+2*e);
                            }
                        }
                    }
                    
                    // fixture for spent tape chute
                    if (extrusion_mount_enabled) {
                        translate([0, 0, base_thickness-emboss-e]) 
                            spent_tape_chute(cutout=true);
                        // punch-out
                        translate([tape_chute_fixture_x, tape_chute_fixture_y, -5*e])
                            cylinder_p(d=cross_screw_diameter+screw_play, 
                                h=base_thickness+tape_width+reel_wall+10*e);
                    }
                    
                    // window for ratchet spring action
                    if (ratchet_window) {
                        translate([0, 0, -e]) {
                            beveled_extrude(bevel=bevel_z, angle=135, height=base_thickness+2*e) {
                                a0=(ratchet_tooth_start+blocking_spring_tooth)*360/ratchet_teeth;
                                a1=(ratchet_tooth_start+lever_spool_spring_tooth+1)*360/ratchet_teeth;
                                rr0=ratchet_inner_diameter/2-spring_strength;
                                rr1=ratchet_diameter/2+spring_strength;
                                polygon([
                                    each arc(
                                    [spool_axle_x+cos(a0)*rr0, spool_axle_y+sin(a0)*rr0],
                                    [spool_axle_x+cos(a0)*rr1, spool_axle_y+sin(a0)*rr1],
                                    180),
                                    each arc(
                                    [spool_axle_x+cos(a0)*rr1, spool_axle_y+sin(a0)*rr1],
                                    [spool_axle_x+cos(a1)*rr1, spool_axle_y+sin(a1)*rr1],
                                    a1-a0),
                                    each arc(
                                    [spool_axle_x+cos(a1)*rr1, spool_axle_y+sin(a1)*rr1],
                                    [spool_axle_x+cos(a1)*rr0, spool_axle_y+sin(a1)*rr0],
                                    180),
                                    each arc(
                                    [spool_axle_x+cos(a1)*rr0, spool_axle_y+sin(a1)*rr0],
                                    [spool_axle_x+cos(a0)*rr0, spool_axle_y+sin(a0)*rr0],
                                    a0-a1),
                                    
                                    
                                ]);
                            }
                        }
                    }
                    
                    // spool axle groove
                    translate([spool_axle_x, spool_axle_y, spool_axle_groove_z]) {
                        difference() {
                            cylinder_p(d=spool_axle_diameter+2*wall, 
                                h=spool_axle_groove_width);
                            cylinder_p(
                                d1=spool_axle_groove_innner, 
                                d2=spool_axle_groove_outer, 
                                h=spool_axle_groove_width+e);
                        }
                    }
                    
                    // extrusion mounting screws
                    if (extrusion_mount_enabled && extrusion_mount_h/extrusion_mount_unit > 1.5) {
                        for (u = [1.5:extrusion_mount_h/extrusion_mount_unit]) {
                            translate([
                                extrusion_mount_x-extrusion_mount_w/2-extrusion_mount_strength-e, 
                                extrusion_mount_y+extrusion_mount_h/2-u*extrusion_mount_unit,
                                (base_thickness+tape_width+reel_wall)/2
                                ]) {
                                rotate([0,90,0]) {
                                    cylinder_horizontal_cut(d=extrusion_mount_screw_diameter, h=extrusion_mount_strength+2*e);
                                    translate([0, 0, -extrusion_mount_screw_diameter*2])
                                        cylinder_horizontal_cut(d=screw_dk, 
                                            h=extrusion_mount_screw_diameter*3);
                                }
                            }
                        }
                    }
                    
                    // handle & lock cutout
                    translate([handle_lock_axle_x, handle_lock_axle_y, 
                        base_thickness-emboss+lever_thickness+e]) {
                        handle_lock(cutout=true);
                    }

                    
                    if (base_with_reel_holder) {
                        // reel holder cutaways
                        translate([reel_x, reel_y, -3*e])
                            cylinder_p(d=reel_axle-2*reel_axle_wall, 
                                h=reel_width+reel_holder_thickness+6*e);

                    }
                }
            }
        }
    }
}
tape_pocket_center=(tape_width+sprocket_gap)/2;
tape_support_knee=min(tape_emboss-extrusion_width, extrusion_width); 
tape_margin=(tape_width-sprocket_gap-tape_emboss_size)/2-layer_height;
tape_inset_support=false;//(tape_emboss > extrusion_width*2);
tape_45_margin=tape_margin-tape_emboss;
tape_margin_eff=tape_inset_support ? tape_margin : max(-thorn_groove, tape_45_margin); // just as good as possible

function inset_profile(cover=true) = [
    [sprocket_margin, -base_height-e],
    [tape_width+reel_wall-e, -base_height-e],
    each [ if (cover) each [
        [tape_width+reel_wall-e, inset_edge],
        [0, inset_edge-tape_thickness*tape_inset_cover_tension],
        [0, -tape_thickness*tape_inset_cover_tension],
        each arc(
        [tape_width-inset_edge, 0],
        [tape_width, 0],
        -135),
    ] else each [
        [tape_width+reel_wall-e, 0],
    ]
    ],
    [tape_width, 0],
    
    [tape_width, -tape_thickness],
    [tape_width-tape_margin, -tape_thickness],
    
    /* does not work in the slicer, unfortunately (wont 90° bridge it)
    // support, if needed and possible
    each [ if (tape_inset_support) each [ 
    [tape_width-tape_margin, -tape_thickness],
    [tape_pocket_center, -tape_thickness-tape_support_knee],
    [sprocket_gap+tape_margin+e, -tape_thickness],
    [sprocket_gap+tape_margin+e, -tape_thickness-extrusion_width],
    [tape_pocket_center, -tape_thickness-extrusion_width-tape_support_knee],
    [tape_width-tape_margin, -tape_thickness-extrusion_width],
    ]],
    */
    
    [tape_width-tape_margin, -tape_thickness-tape_emboss],
    [sprocket_gap+tape_margin, -tape_thickness-tape_emboss],
    [sprocket_gap+tape_margin_eff, -tape_thickness],
    //[sprocket_margin-tape_margin, -tape_thickness],
    //[sprocket_hole_margin, -tape_thickness],
    [bevel_z, -tape_thickness],
    [0, -tape_thickness-bevel_z],
    [0, -base_height-e],
];

if (do_inset) {
    
    color([0,0.7,0,0.6]) {
        translate([
            debug_eff ? 0 : -base_begin+reel_x+reel_washer+gap - 20, 
            debug_eff ? 0 : reel_y-base_height-gap + 15, 
            debug_eff ? emboss : (inset_flipped ? inset_height : 0)]) {
            rotate([inset_flipped ? 180 : 0, 0, 20]) {
                
                render_preview(convexity=10)
                union() {
                    // the actual inset
                    intersection() {
                        union() {
                            // main tape slide
                            translate([base_end, 0, 0]) {
                                rotate([0, -90, 0]) {
                                    linear_extrude(height=base_end-tape_inset_begin, 
                                        convexity=10) {
                                        polygon(inset_profile(true));
                                    }
                                }
                            }
                            // on-ramp
                            translate([tape_inset_begin+e, 0, 0]) 
                                rotate([0, 0, -90]) 
                                    translate([tape_bend_radius_begin, 0, 0]) 
                                        rotate_extrude(angle=tape_bend_angle, convexity=10, $fa=3) 
                                            translate([-tape_bend_radius_begin, 0]) 
                                                rotate(90) 
                                                    polygon(inset_profile(false));
                            /*
                            // off-ramp
                            translate([tape_inset_end-e, 0, 0]) 
                                mirror([1, 0, 0]) rotate([0, 0, -90]) 
                                    translate([tape_bend_radius_end, 0, 0]) 
                                        rotate_extrude(angle=tape_bend_angle, convexity=10, $fa=4) 
                                            translate([-tape_bend_radius_end, 0]) 
                                                rotate(90) 
                                                    polygon(inset_profile(false));*/
                        }
                        union() {
                            difference() {
                                // cross section
                                translate([0, 0, -e]) {
                                    beveled_extrude(height=inset_height, convexity=10)
                                        polygon([
                                            [base_begin+base_length, -base_height+inset_play+phase2_play],
                                            
                                            each arc(
                                            [base_end, 0],
                                            [base_end-inset_edge, inset_edge+e],
                                            90),
                                            
                                            each arc(
                                            [base_begin+base_tape_edge, inset_edge+e],
                                            [base_begin, -inset_edge],
                                            90),
                                            [base_begin, -base_height+inset_play+phase2_play],
                                            [tape_inset_begin-inset_play-phase2_play, 
                                                -base_height+inset_play+phase2_play],
                                            [tape_inset_begin-tape_inset_slant-inset_play-phase2_play, 
                                                -tape_max_height],
                                            [tape_inset_end+tape_inset_slant+inset_play+phase2_play, 
                                                -tape_max_height],
                                            [tape_inset_end+inset_play+phase2_play, -base_height+inset_play+phase2_play],
                                        ]);
                                }
                                // handle & lock cutout
                                difference() {
                                    translate([handle_lock_axle_x, handle_lock_axle_y, 
                                        -emboss+lever_thickness-layer_height]) {
                                    
                                        handle_lock(cutout=true, lock=false, play=play);
                                    }
                                    
                                    if (inset_flipped && support_grid > 0 ) {
                                        // subtract supports
                                        support_y = [-tape_max_height+extrusion_width-layer_height,
                                                        inset_edge-layer_height];
                                        for (x = [tape_inset_begin+support_grid/2:support_grid:extrusion_mount_x]) {
                                            translate([x, support_y[0], 
                                                inset_height-handle_pull_thickness-e]) 
                                                cube([extrusion_width, 
                                                    support_y[1]-support_y[0], 
                                                    handle_pull_thickness+2*e]);
                                        }
                                    }
                                }
                                translate([0, 0, -e]) {
                                    // pick location window
                                    linear_extrude(height=tape_width-layer_height+e, convexity=4) {
                                        polygon([
                                                [cover_tape_edge+tape_inset_window_length, inset_edge+e],
                                                [cover_tape_edge+tape_inset_window_length+inset_edge, 
                                                    -tape_thickness*tape_inset_cover_tension-e],
                                                [cover_tape_edge, 
                                                    -tape_thickness*tape_inset_cover_tension-e],
                                                [cover_tape_edge-inset_edge, inset_edge+e],
                                        ]);
                                    }
                                    // window for dog
                                    dog_x0=dog_nominal_x-dog_travel_nominal-dog_strength-sprocket_pitch;
                                    linear_extrude(height=sprocket_gap+layer_height+e, convexity=4) {
                                        polygon([
                                            [dog_x0-inset_edge, 
                                                inset_edge+e], 
                                            [dog_x0, 
                                                    -tape_thickness*tape_inset_cover_tension-e],        
                                            [dog_nominal_x+sprocket_pitch, 
                                                    -tape_thickness*tape_inset_cover_tension-e],        
                                            [dog_nominal_x+sprocket_pitch-inset_edge, inset_edge+e],        
                                            ]);
                                    }
                                    // leave rear open
                                    linear_extrude(height=inset_height+2*e, convexity=4) {
                                        polygon([
                                            [dog_x0-sprocket_pitch*2, inset_edge+e], 
                                            [dog_x0-sprocket_pitch*2+inset_edge, 
                                                    -tape_thickness*tape_inset_cover_tension-e],        
                                            [base_begin, 
                                                    -tape_thickness*tape_inset_cover_tension-e],        
                                            [base_begin, inset_edge+e],        
                                            ]);
                                    }
                                }
                                
                                // dog thorn groove
                                groove = [
                                    [sprocket_margin-tape_min_margin+thorn_groove/2, -tape_thickness+e],
                                    [sprocket_margin-tape_min_margin-thorn_groove/2, -tape_thickness-thorn_groove],
                                    [sprocket_hole_margin+thorn_groove/2, -tape_thickness-thorn_groove],
                                    [max(0, sprocket_hole_margin-thorn_groove/2), -tape_thickness+e]
                                ];
                                translate([dog_nominal_x+sprocket_pitch, 0, 0]) {
                                    rotate([0, -90, 0]) {
                                        linear_extrude(height=dog_travel_nominal+sprocket_pitch*4,
                                            convexity=10) {
                                            polygon(groove);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    // tape reversal blocking thorn
                    if (reversal_blocking_thorn_length > 0) {
                        x = dog_nominal_x-dog_travel_nominal-sprocket_pitch*2;
                        translate([round(x/sprocket_pitch)*sprocket_pitch, e, 
                            sprocket_hole_distance-thorn_sideways_tension]) {
                            rotate([90, 0, 0]) 
                                thorn(diameter=thorn_diameter, 
                                      length=reversal_blocking_thorn_length+e);
                        }
                    }
                                        
                    
                    // label
                    if (label_enabled) {
                        // Side wall thickness, connecting the label
                        label_side_wall=handle_pull_thickness;

                        translate([0, 0, inset_height-label_side_wall]) {
                            beveled_extrude(height=label_side_wall, convexity=10) {
                                polygon([
                                    [tape_inset_end+tape_inset_slant, -tape_max_height],
                                    [tape_inset_end, -base_height+play],
                                    [base_end, -base_height+play],
                                    [base_end, -base_height+play],
                                    each arc(
                                    [base_end+label_distance, -base_height+play],
                                    [base_end+label_distance+label_length, 
                                        label_top-label_frame_thickness*2-label_frame_slot],
                                    10),
                                    [base_end+label_distance+label_length, 
                                        label_top-label_frame_thickness-label_frame_slot],
                                    each arc(
                                    [base_end+label_distance, 
                                        label_top-label_frame_thickness-label_frame_slot],
                                    [base_end, -base_tape_edge],
                                    -30),
                                    [tape_inset_end, -base_tape_edge],
                                ]);
                            }
                        }
                        difference() {
                            // body of the holde
                            translate([base_end+label_distance, 
                                label_top-label_frame_thickness*2-label_frame_slot, 
                                -base_thickness])
                                beveled_extrude(height=inset_height+base_thickness, bevel=bevel_z,
                                    convexity=10) 
                                    square([label_length, 
                                        label_frame_thickness*2+label_frame_slot]);
                            // cutout slot
                            translate([base_end+label_distance+label_frame_thickness, 
                                label_top-label_frame_thickness-label_frame_slot, 
                                -base_thickness+label_frame_wall])
                                linear_extrude(height=inset_height+base_thickness-label_frame_wall+e, convexity=10) 
                                    square([label_length-2*label_frame_thickness, 
                                        label_frame_slot]);
                            // cutout window
                            translate([base_end+label_distance+label_frame_thickness*2, 
                                label_top-label_frame_thickness-label_frame_slot+e, 
                                -base_thickness+label_frame_wall+label_frame_thickness])
                                linear_extrude(height=inset_height+base_thickness-label_frame_wall*4, convexity=10) 
                                    square([label_length-4*label_frame_thickness, 
                                        label_frame_slot+label_frame_thickness]);
                            // cutout thumb
                            translate([base_end+label_distance+label_length/2, 
                                label_top-label_frame_thickness*2-label_frame_slot-e, 
                                -base_thickness]) 
                                rotate([-90, 0, 0])
                                    cylinder_p(d=label_thumb, h=label_frame_thickness+label_frame_slot-e);
                        }
                    }           
                }
            }
        }
    }
}


if (do_lever) {
    color([1,0,0,0.6])
        translate([
        debug_eff ? 0 : -lever_axle_x-lever_axle_diameter-2*gap - 120, 
        debug_eff ? 0 : -base_height-extrusion_mount_strength + 18
    -4*gap-lever_axle_y-lever_axle_diameter-lever_feed_y, 
        debug_eff ? layer_height+e : 0]) {
         rotate([0, 0, 230]) {
            // ratchet spring tooth calculations
            tooth_r=ratchet_inner_diameter/2;
            tooth_angle=(ratchet_tooth_start+lever_spool_spring_tooth)*360/ratchet_teeth;
            tooth_x=tooth_r*cos(tooth_angle)+spool_axle_x;
            tooth_y=tooth_r*sin(tooth_angle)+spool_axle_y;
            lever_spool_node=[lever_spool_x+lever_axle_x+cos(lever_spool_angle)*spring_strength/2, 
                    lever_spool_y+lever_axle_y+sin(lever_spool_angle)*spring_strength/2];
            tooth_relaxed = spring_relaxed_endpoint(
                lever_spool_node,
                [tooth_x, tooth_y],
                lever_spool_spring_bend,
                -spring_tension);
                
            tooth_eff_x = debug_eff && ! relax_springs ? tooth_x : tooth_relaxed.x;
            tooth_eff_y = debug_eff && ! relax_springs ? tooth_y : tooth_relaxed.y;
            lever_spool_spring_bend_eff = debug_eff && ! relax_springs ? 
                lever_spool_spring_bend :
                lever_spool_spring_bend-spring_tension;
            tooth_next_angle=(ratchet_tooth_start+lever_spool_spring_tooth+1)*360/ratchet_teeth
                + (debug_eff && ! relax_springs ? 0 : -spring_tension);
            
            dog_lever_thickness=lever_actuation_thickness;//spool_wall_left+tape_width-sprocket_gap; 
                    
            render_preview(convexity=12)
            difference() {
                union() {
                    beveled_extrude(height=ratchet_thickness-layer_height, convexity=4) {
                        // spool ratchet spring
                        spring_contour(lever_spool_node,
                                [tooth_eff_x, tooth_eff_y],
                                lever_spool_spring_bend_eff,
                                0, spring_strength,
                                tooth_next_angle);
                    }
                    beveled_extrude(height=lever_actuation_thickness, bevel=bevel_z, convexity=12) {
                        union() {
                            // the lever shape
                            translate([lever_axle_x, lever_axle_y]) {
                                hull() {
                                    rotate([0, 0, lever_feed_angle])
                                        translate([lever_feed_leverage, 0])
                                            circle_p(d=lever_axle_diameter);
                                    circle_p(d=lever_axle_diameter+2*wall);
                                }
                                hull() {
                                    rotate([0, 0, lever_feed_angle])
                                        translate([lever_spool_leverage-lever_axle_diameter/2, 0])
                                            circle_p(d=lever_axle_diameter);
                                    rotate([0, 0, lever_spool_angle])
                                        translate([lever_spool_leverage, 0])
                                            circle_p(d=lever_node);
                                }
                                //circle_p(d=lever_axle_outer_diameter);
                            }
                            
                            
                        }
                    }
                    // dog lever
                    beveled_extrude(height=dog_lever_thickness, bevel=bevel_z, convexity=12) {
                        // leverage
                        translate([lever_axle_x, lever_axle_y]) {
                            hull() {
                                rotate([0, 0, lever_dog_angle])
                                    translate([lever_dog_leverage, 0])
                                        circle_p(d=lever_node);
                                circle_p(d=lever_axle_diameter);
                            }
                        }
                        // dog spring
                        spring_contour(
                            [lever_tape_x+lever_axle_x, 
                                lever_tape_y+lever_axle_y],
                            [dog_eff_x-dog_length+dog_slant*dog_height0, 
                                    dog_eff_y+dog_height0],
                            dog_spring_bend_eff,
                            -spring_strength/2,
                            spring_strength/2);
                        // dog
                        translate([dog_eff_x, dog_eff_y])
                            translate(dog_neck)
                                rotate(dog_spring_bend_eff-dog_spring_bend)
                                    translate(-dog_neck)
                                        polygon(dog_contour);    
                    }
                    // add the dog's thorn
                    translate([dog_eff_x, dog_eff_y, 
                        emboss+sprocket_hole_distance-thorn_sideways_tension
                        -layer_height]) // one layer height down because of the friction ring
                        translate([dog_neck.x, dog_neck.y, 0])
                            rotate([0, 0, dog_spring_bend_eff-dog_spring_bend])
                                translate([dog_thorn_nominal_x-dog_nominal_x-2*e, e, 0]     
                                    - [dog_neck.x, dog_neck.y, 0])
                                    rotate([90, 0, 0]) 
                                        thorn(diameter=thorn_diameter, 
                                            length=thorn_length+e);
                    
                    translate([lever_axle_x, lever_axle_y, 0]) {
                        union() {
                            // make it full lever thickness at the axle
                            beveled_extrude(height=lever_thickness-layer_height*2, 
                                bevel=bevel_z, convexity=12) {
                                circle_p(d=lever_axle_outer_diameter);
                            }
                            
                            // nozzle actuation knob
                            translate([lever_feed_x, lever_feed_y, lever_actuation_thickness-e])
                                cylinder_p(
                                    d=lever_axle_diameter-nozzle_play,
                                    h=lever_thickness-lever_actuation_thickness+e);
                        }
                    }
                }
                union() {
                    // cutout axle
                    translate([lever_axle_x, lever_axle_y, -e])
                        beveled_extrude(height=lever_thickness-layer_height*2+2*e, 
                            bevel=bevel_z, angle=135) {
                            circle_p(d=lever_axle_diameter+axle_play+phase2_play);
                        }
                    
                    // dog cutout 
                    dog_cut=dog_r*3;
                    dog_cutaway = [
                        [dog_slant*(dog_height0-dog_cut)-dog_length-dog_cut, 
                            dog_slant_c*dog_cut+dog_height0-dog_cut],
                        [dog_slant*(dog_height0-dog_cut)-dog_length-dog_cut, -e],
                        [dog_slant*(dog_height1-dog_cut)+dog_cut, -e],
                        [dog_slant*(dog_height1-dog_cut)+dog_cut, 
                            dog_height1-dog_cut],
                    ];
                    translate([0, 0, sprocket_gap+emboss-layer_height]) {
                        beveled_extrude(height=dog_lever_thickness-sprocket_gap-emboss
                            +layer_height+e, angle=135) {
                            translate([dog_eff_x, dog_eff_y])
                                translate(dog_neck)
                                    rotate(dog_spring_bend_eff-dog_spring_bend)
                                        translate(-dog_neck)
                                            polygon(dog_cutaway);  
                        }
                    }
                    
                }
            }
        }
    }
}

if (do_blocking_spring) {
    tooth_r=ratchet_inner_diameter/2;
    tooth_angle=(blocking_spring_early+ratchet_tooth_start+blocking_spring_tooth)*360/ratchet_teeth;
    tooth_x=tooth_r*cos(tooth_angle)+spool_axle_x;
    tooth_y=tooth_r*sin(tooth_angle)+spool_axle_y;
    blocking_node = [block_axle_x-fixture_axle/2+spring_strength, block_axle_y+spring_strength/2];
    tooth_relaxed = spring_relaxed_endpoint(
        blocking_node,
        [tooth_x, tooth_y],
        blocking_spring_bend,
        -spring_tension);
    
    tooth_eff_x = debug_eff && ! relax_springs ? tooth_x : tooth_relaxed.x;
    tooth_eff_y = debug_eff && ! relax_springs ? tooth_y : tooth_relaxed.y;
    blocking_spring_bend_eff = debug_eff && ! relax_springs ? 
        blocking_spring_bend : 
        blocking_spring_bend-spring_tension;

    color([1, .5, 0, .5]) {
        translate([
            debug_eff ? 0 :  -block_axle_x + spool_outer_diameter/2 - 170, 
            debug_eff ? 0 :  lever_axle_y-fixture_axle + 15, 
            0]) {
                render_preview(convexity=6)
                rotate([0, 0, 80]) {
                    union() {
                        beveled_extrude(height=ratchet_thickness-layer_height, convexity=10) {
                            // spool blocking ratchet spring
                            spring_contour(
                                blocking_node, 
                                [tooth_eff_x, tooth_eff_y],
                                blocking_spring_bend_eff,
                                0, spring_strength,
                                tooth_angle+blocking_spring_bend_eff-blocking_spring_bend);
                        }
                        translate([0, 0, ])
                            beveled_extrude(height=tape_width+emboss) 
                                translate([block_axle_x, block_axle_y])
                                    circle_p(d=fixture_axle-fixture_play-phase2_play, $fn=6);
                    }
            }
        }
    }
}                     
                   

if (do_friction_wheel) {
    // spool right side
    color([0, 0, 1, 0.6])
    translate([
        debug_eff ? spool_axle_x : -spool_inner_diameter, 
        debug_eff ? spool_axle_y : gap + spool_inner_diameter,
        debug_eff ? ratchet_thickness+2*e : tape_width-sprocket_gap
        ]) {
            
        render_preview(convexity=20)
        rotate([debug_eff ? 0 : 180, 0, 0]) {
        
            friction_wing_length=(spool_inner_diameter-friction_axle_diameter-spool_drum_strength*2)/2
                    +friction_tension-phase2_play/2;
            friction_wing_offset=friction_axle_diameter/2-spring_small_strength/2;
            
            translate([0, 0, -spool_wall_left]) {
                intersection() {
                    union() {
                        // anti friction ring
                        linear_extrude(height=layer_height+e, convexity=6) {
                            difference() {
                                circle_p(d=friction_axle_diameter-fixture_play-2*extrusion_width);
                                circle_p(d=spool_axle_diameter+spool_axle_play+phase2_play);
                            }
                        }
                        // hex axle
                        translate([0, 0, layer_height]) {
                            linear_extrude(height=spool_wall_left+layer_height+e, convexity=6) {
                                difference() {
                                    circle_p(d=friction_hex_diameter-fixture_play, 
                                        $fn=friction_wings);
                                    circle_p(d=spool_axle_diameter+spool_axle_play+phase2_play);
                                }
                            }
                        }
                    }
                    
                    cylinder_p(d2=friction_axle_diameter-play-6*layer_height, 
                        d1=friction_axle_diameter-play-6*layer_height+2*spool_wall_left,
                        h=spool_wall_left+2*layer_height+3*e);
                }
            }
            beveled_extrude(height=tape_width-sprocket_gap, convexity=6) {
                union() {
                    difference() {
                        circle_p(d=friction_axle_diameter-play);
                        circle_p(d=spool_axle_diameter+spool_axle_play+phase2_play);
                    }
                    for (a = [0:friction_wings]) {
                        da=180/PI*spring_small_strength/friction_wing_offset;
                        rotate(a*360/friction_wings-da) {
                            r1=friction_wing_offset+friction_wing_length;
                            a1=360/friction_wings-da;
                            spring_contour(
                                [friction_wing_offset, 0],
                                [cos(a1)*r1, sin(a1)*r1+e],
                                50+a1,
                                -spring_small_strength/2,
                                spring_small_strength/2);
                        }
                    }
                }
            }
        }
    }
}
       

if (do_spool_left) {
    // spool left side with ratchet
    color([0.3, 0.3, 1, 0.4]) {
        translate([
            debug_eff ? spool_axle_x : 0, 
            debug_eff ? spool_axle_y : max(lever_axle_y, spool_axle_y) 
            +lever_strength+base_margin+spool_outer_diameter/2+gap, 
            debug_eff ? 0 : spool_wall_left]) { 
            rotate([debug_eff ? 0 : 180, 0, 0]) {
            
                render_preview(convexity=20)
                difference() {
                    union() {
                        
                        //NOPE: on the friction wheel
                        // cylinder_p(d=friction_hex_diameter+base_anti_friction_ring*2,
                        //    h=layer_height+e);
                        
                        translate([0, 0, layer_height]) {
                            rotate([0, 0, 360*ratchet_tooth_start/ratchet_teeth]) ratchet(
                                teeth=ratchet_teeth,
                                overhang=ratchet_overhang,
                                diameter0=ratchet_inner_diameter,
                                diameter1=ratchet_diameter,
                                thickness=ratchet_thickness-layer_height+e,
                                bluntness=ratchet_bluntness);
                        }

                        
                        translate([0, 0, ratchet_thickness]) {
                            r0=ratchet_diameter/2+spool_spoke_strength/2;
                            r1=spool_outer_diameter/2-spool_spoke_strength;
                            ratchet(
                                teeth=grip_teeth,
                                overhang=0.5,
                                diameter0=spool_outer_diameter,
                                diameter1=spool_outer_diameter+grip_depth,
                                thickness=spool_wall_left-ratchet_thickness,
                                spokes=spool_spokes_left,
                                spoke_strength=spool_spoke_strength,
                                spoke_r0=r0,
                                spoke_r1=r1,
                                bevel=0);
                        }
                    }
                    union() {
                        translate([0, 0, -e]) {
                            beveled_extrude(height=spool_wall_left+2*e, bevel=bevel_z, angle=135) {
                                circle_p(d=friction_hex_diameter,
                                    $fn=friction_wings);
                            }
                        }
                    }
                }
            }
        }
    }
}


if (do_spool_right) {
    // spool right side
    color([0.8, 0.8, 0.8, 0.7])
    translate([
        debug_eff ? spool_axle_x : -spool_outer_diameter-gap, 
        debug_eff ? spool_axle_y : max(lever_axle_y, spool_axle_y) 
            +lever_strength+base_margin+spool_outer_diameter/2+gap,
        debug_eff ? 0 : spool_width]) 
        rotate([debug_eff ? 0 : 180, 0, debug_eff ? 0 : -90]) {
            
        r0=spool_inner_diameter/2-spool_drum_clamp_strength;
        r1=spool_inner_diameter/2;
        dx1=cos(spool_drum_clamp_open_angle/2)*r1;
        dy1=sin(spool_drum_clamp_open_angle/2)*r1;
        dy0=dy1+spool_drum_clamp_strength/3;
        a0=asin(dy0/r0);
        dx0=cos(a0)*r0;
                            
        spool_drum_clamp= [
            each arc(
            [dx1, dy1],
            [dx1, -dy1],
            360-spool_drum_clamp_open_angle),
            each arc(
            [dx0, -dy0],
            [dx0, dy0],
            a0*2-360),
            ];
            
        // spool half
        render_preview(convexity=20)
        difference() {
            union() {
                // spool drum 
                translate([0, 0, spool_wall_left]) 
                    cylinder_p(h=tape_width-sprocket_gap+e, 
                        d=spool_inner_diameter);
                
                // right wall    
                translate([0, 0, spool_wall_left+tape_width-sprocket_gap])  {
                    r0=spool_inner_diameter/2+spool_spoke_strength/2;
                    r1=spool_outer_diameter/2-spool_spoke_strength;
                    ratchet(
                        teeth=grip_teeth,
                        overhang=0.5,
                        diameter0=spool_outer_diameter,
                        diameter1=spool_outer_diameter+grip_depth,
                        thickness=spool_wall_right,
                        spokes=spool_spokes_right,
                        spoke_strength=spool_spoke_strength,
                        spoke_r0=r0,
                        spoke_r1=r1,
                        bevel=0);
                }
                
                
                // spool drum clamp
                translate([debug_eff ? 0 : (spool_inner_diameter/2-spool_outer_diameter/2) + 15, 
                    debug_eff ? 0 : (spool_inner_diameter/2+spool_outer_diameter/2) + 3, 
                    debug_eff ? spool_wall_left : spool_wall_left+spool_wall_right+play]) {
                    linear_extrude(height=tape_width-sprocket_gap-play, convexity=10) {
                        scale([1-spool_drum_clamp_tension, 
                            1-spool_drum_clamp_tension]) 
                            polygon(spool_drum_clamp);
                    }
                }

                // groove axle nut washer
                translate([debug_eff ? 0 : spool_outer_diameter/2, 
                    debug_eff ? 0 : -spool_outer_diameter/2, 
                    debug_eff ? spool_axle_groove_z-base_thickness+emboss : 
                        spool_width]) {
                    rotate([debug_eff ? 0 : 180, 0, 0]) {
                        difference() {
                            cylinder_p(h=spool_axle_groove_width, 
                                d=spool_axle_groove_outer+4*wall);
                            hull() {
                                translate([0, 0, -e]) 
                                    cylinder_p(h=spool_axle_groove_width+2*e, 
                                        d2=spool_axle_groove_outer, d1=spool_axle_groove_innner);
                                translate([spool_axle_diameter, 0, -e]) 
                                    cylinder_p(h=spool_axle_groove_width+2*e, 
                                        d2=spool_axle_groove_outer, d1=spool_axle_groove_innner);
                            }
                        }
                    }
                }
            }
            union() {
                // cut away spool axle
                translate([0, 0, spool_wall_left-e]) 
                    cylinder_p(h=spool_width-spool_wall_left+2*e, 
                        d=spool_axle_diameter+screw_play); // use screw play for free rotation

                // orientation mark
                translate([spool_axle_diameter/2+4, 0, spool_wall_left-e]) 
                    cylinder_p(h=spool_width-spool_wall_left+2*e, 
                        d=2); 

                // cut away drum clamp 
                translate([0, 0, spool_wall_left-e]) 
                    linear_extrude(height=tape_width-sprocket_gap, convexity=6) {
                        offset(delta=_fp) 
                            polygon(spool_drum_clamp);
                    }
                
                // cut away friction wheel in drum
                translate([0, 0, spool_wall_left-e]) 
                    cylinder_p(h=tape_width-sprocket_gap+0.5*e, 
                        d=spool_inner_diameter-spool_drum_strength*2);
                drum_cone=wall-extrusion_width;
                translate([0, 0, spool_wall_left-2*e]) 
                    cylinder_p(h=drum_cone, 
                        d1=spool_inner_diameter-spool_drum_strength*2+drum_cone*2,
                        d2=spool_inner_diameter-spool_drum_strength*2-e);
            }
        }
    }
}    

// template
if (do_litefeeder && $preview) {

    rotate([-90, 0, 0]) {
        translate([0,5, 0]) {
            color([1, 1, 0, 0.3]) 
                import("feeder40_body.stl", convexity=10);
            color([1, 0.5, 0, 0.3]) 
                import("feeder40_dog.stl", convexity=10);
        }
    }
}

// --------------------------------------------------------------------------------------
    
function fn_by_err(r_eff) = 
    let(da=acos(1 - _fp/max(r_eff, _fp*2))*2,
        _fn = ceil(max(12, min(360/da, 3600)))
    )
    _fn;
    


module cylinder_p(d = undef, d1 = undef, d2 = undef, r = undef, h = undef, $fn=undef) {
    r_eff = abs(r == undef ? (d == undef ? max(d1, d2)/2 : d/2) : r);
    _fn = ($fn != undef ? $fn : fn_by_err(r_eff));
    if (r != undef) 
        cylinder(r=r, h=h, $fn=_fn);
    else if (d != undef) 
        cylinder(d=d, h=h, $fn=_fn);
    else 
        cylinder(d1=d1, d2=d2, h=h, $fn=_fn);
}

module cylinder_horizontal_cut(d = undef, r = undef, h = undef, $fn=undef) {
    r_eff = abs(r == undef ? d/2 : r);
    _fn = ($fn != undef ? $fn : fn_by_err(r_eff));
    d=1/sqrt(2);
    d0=tan(180/8);
    linear_extrude(height=h) {
        polygon([
            each arc(
            [-d*r_eff, d*r_eff],
            [d*r_eff, d*r_eff],
            270),
            [d0*r_eff, r_eff],
            [-d0*r_eff, r_eff],
        ]); 
    };
}

module circle_p(d=undef, r=undef, $fn=undef) {
    r_eff = abs(r == undef ? d/2 : r);
    _fn = ($fn != undef ? $fn : fn_by_err(r_eff));
    if (r != undef)
        circle(r=r, $fn=_fn);
    else
        circle(d=d, $fn=_fn);
}

function curve(a0, a1, r0, r1, x, y, scale=false) = [ 
    let(
        r_eff = max(abs(r0), abs(r1)),
        n = ceil(fn_by_err(r_eff)*abs(a1-a0)/360)
        //echo(r_eff, fn_by_err(r_eff), n)
    )
    for (i = [0:n])
        let (
            a=a0+i*(a1-a0)/n,
            ratio = (a-a0)/(a1-a0),
            r = (1-ratio)*r0+ratio*r1,
            o = i*90/n
        )
        scale ? 
            [ x + cos(o)*cos(a0)*r0 + sin(o)*cos(a1)*r1, 
              y + cos(o)*sin(a0)*r0 + sin(o)*sin(a1)*r1 ] :
            [ x + cos(a)*r, y + sin(a)*r ]
    ];
 
    
function arc(p0, p1, angle) =  
    let(
        d=p1-p0,             // bee-line
        m=(p1+p0)/2,         // mid point
        n=[-d.y, d.x],       // perpendicular of same scale
        c=m+cos(angle/2)/sin(angle/2)*n/2, // center point
        b=p0-c,              // radial to p0
        a0=atan2(b.y, b.x),  // starting angle
        a1=a0+angle,         // ending angle
        r=sqrt(pow(b.x, 2)+pow(b.y, 2)) // radius
    ) 
    curve(a0, a1, r, r, c.x, c.y);

function spring_relaxed_endpoint(p0, p1, angle, angle_relax) = 
    let (
        d=p1-p0,             // bee-line
        m=(p1+p0)/2,         // mid point
        n=[-d.y, d.x],       // perpendicular of same scale
        c=m+cos(angle/2)/sin(angle/2)*n/2, // center point
        b=p0-c,              // radial to p0
        a0=atan2(b.y, b.x),  // starting angle
        a1=a0+angle,         // ending angle
        r=sqrt(pow(b.x, 2)+pow(b.y, 2)), // radius
        angle_new=angle+angle_relax,
        b_new=b*angle/angle_new,
        c_new=p0-b_new,
        p1_new=c_new+[ cos(angle_new)*b_new.x - sin(angle_new)*b_new.y, 
            sin(angle_new)*b_new.x + cos(angle_new)*b_new.y]
    )
    p1_new;

module spring_contour(p0, p1, angle, 
    strength0=-spring_strength/2, 
    strength1=spring_strength/2, 
    end_angle = undef) {
    strength=strength1-strength0;
    d=p1-p0;
    m=(p1+p0)/2;
    n=[-d.y, d.x];
    c=m+cos(angle/2)/sin(angle/2)*n/2;
    v0=p0-c;
    r=distance(v0.x, v0.y);
    n0=sign(-angle)*v0/r;
    v1=p1-c;
    n1=sign(-angle)*v1/r;
    
    difference() {
        polygon([
            each arc(
            p0+n0*strength0, 
            p1+n1*strength0,
            angle),
            
            each arc(
            p1+n1*strength1, 
            p0+n0*strength1,
            -angle),
        ]);
        if (end_angle != undef) { 
            // cut off @ end angle
            a1=atan2(v1.y, v1.x);
            ch=distance(1, tan(a1-end_angle))*1.1;
            s1 = [cos(end_angle), sin(end_angle)];
            ns1 = [-s1.y, s1.x];
            polygon([
                p1+s1*ch*strength,
                p1+(s1-ns1)*ch*strength,
                p1+(-s1-ns1)*ch*strength,
                p1-s1*ch*strength,
            ]);
        }
    }
}
    

module ratchet(
    teeth=24,
    overhang=1.05,
    bluntness=0.0,
    diameter0=30,
    diameter1=31,
    thickness=1,
    spokes=0,
    spoke_strength=1,
    spoke_r0=5,
    spoke_r1=25,
    bevel=layer_height
    ) {
    ratchet_outline = [ 
        for (i = [0:teeth-1])
            let(a0 = (i-bluntness)*360/teeth, 
                a0b = (i+bluntness)*360/teeth, 
                a1b = (i+overhang-bluntness*3)*360/teeth, 
                a1 = (i+overhang-bluntness)*360/teeth) 
            each [
                [ diameter0/2*cos(a0), diameter0/2*sin(a0)],
                [ diameter0/2*cos(a0b), diameter0/2*sin(a0b)],
                [ diameter1/2*cos(a1b), diameter1/2*sin(a1b)],
                [ diameter1/2*cos(a1), diameter1/2*sin(a1)],
            ]
        ];
    beveled_extrude(height=thickness, bevel=bevel,
        convexity=10) {
        difference() {
            polygon(points=ratchet_outline);
            if (spokes > 1) {
                for (a = [0:spokes-1]) {
                    angle0=360*(a-0.5)/spokes;
                    angle1=360*(a+0.5)/spokes;
                    offset(r=-spoke_strength/2, $fn=16) /*offset(delta=-spoke_strength)*/ {
                        polygon([
                            each arc(
                            [cos(angle0)*spoke_r1, sin(angle0)*spoke_r1],
                            [cos(angle1)*spoke_r1, sin(angle1)*spoke_r1],
                            angle1-angle0, $fn=$fn/spokes),
                            each arc(
                            [cos(angle1)*spoke_r0, sin(angle1)*spoke_r0],
                            [cos(angle0)*spoke_r0, sin(angle0)*spoke_r0],
                            angle0-angle1, $fn=$fn/spokes),
                        ]);
                    }
                }
            }    
        }
    }
}

module wire_cube(dim, wire=0.1) {
    cube([dim[0], wire, wire]);
    translate([0, 0, dim[2]-wire]) cube([dim[0], wire, wire]);
    translate([0, dim[1]-wire, 0]) cube([dim[0], wire, wire]);
    translate([0, dim[1]-wire, dim[2]-wire]) cube([dim[0], wire, wire]);
    
    cube([wire, dim[1], wire]);
    translate([0, 0, dim[2]-wire]) cube([wire, dim[1], wire]);
    translate([dim[0]-wire, 0, 0]) cube([wire, dim[1], wire]);
    translate([dim[0]-wire, 0, dim[2]-wire]) cube([wire, dim[1], wire]);
    
    cube([wire, wire, dim[2]]);
    translate([0, dim[1]-wire, 0]) cube([wire, wire, dim[2]]);
    translate([dim[0]-wire, 0, 0]) cube([wire, wire, dim[2]]);
    translate([dim[0]-wire, dim[1]-wire, 0]) cube([wire, wire, dim[2]]);
}

module render_preview(convexity=undef) {
    if (preview_rendering || ! $preview) {
        render(convexity) 
            children();
    }
    else {
        children();
    }
}

module beveled_extrude(height=1, bevel=layer_height*1, angle=45, convexity=undef) {
    render_preview(convexity=convexity) union() {
        if ((bevel+e)*2 < height && bevel > e) {
            for (h = [0:layer_height:bevel-e]) {
                l=min(layer_height, bevel-h);
                rh=bevel-h;
                rb=rh*tan(90-angle);
                translate([0,0,h]) {
                    linear_extrude(height=l+e, convexity=convexity) {
                        offset(delta=-rb, chamfer=true) children();
                    }
                }
                translate([0,0,height-h-l-e]) {
                    linear_extrude(height=l+e, convexity=convexity) {
                        offset(delta=-rb, chamfer=true) children();
                    }
                }
            }
            translate([0,0,bevel]) {
                linear_extrude(height=height-bevel*2, convexity=convexity) {
                    children();
                }
            }
        }
        else{
            linear_extrude(height=height, convexity=convexity) {
                children();
            }
        }
    }
}

module thorn(diameter, length, overlength=0) {
    
    hull() {
        linear_extrude(height=e) {
            hull() {
                translate ([0, 0])
                    circle_p(d=diameter);
                if (overlength != 0) {
                    translate ([-overlength*(diameter*thorn_pointedness)/length, 0])
                        circle_p(d=diameter);
                }
            }
        }
        translate([0, 0, length-e]) {
            linear_extrude(height=e) {
                intersection() {
                    translate ([diameter*(thorn_pointedness+thorn_overhang), 0])
                        circle_p(d=diameter);
                    translate ([diameter*thorn_overhang, 0])
                        circle_p(d=diameter);
                }
            }
        }
    }
}   


module oshw_logo(scale=10) {
    angle0 = 12.4912; 
    angle1 = 7.59464;
    angle2 = 20.0;
    radius0 = 0.35*scale; 
    radius1 = 0.45*scale;
    radius2 = 0.125*scale;
    polygon([
        each [ for(i=[1:7]) 
            let(a=360*i/8-90) 
        each [
            each arc(
            [radius0*cos(a-360/16), radius0*sin(a-360/16)],
            [radius0*cos(a-angle0), radius0*sin(a-angle0)],
            360/16-angle0),
            [radius1*cos(a-angle1), radius1*sin(a-angle1)],
            [radius1*cos(a+angle1), radius1*sin(a+angle1)],
            each arc(
            [radius0*cos(a+angle0), radius0*sin(a+angle0)],
            [radius0*cos(a+360/16), radius0*sin(a+360/16)],
            360/16-angle0),
            ],
        ],
        each arc(
        [radius2*cos(270-angle2), radius2*sin(270-angle2)],
        [radius2*cos(-90+angle2), radius2*sin(-90-angle2)],
        angle2*2-360)
        ]);
}
    
function distance(dx=0, dy=0, dz=0) = sqrt(pow(dx, 2) + pow(dy, 2) + pow(dz, 2));


function rot(p, x0, y0, rot) = let(s=sin(rot), c=cos(rot)) [c*p.x - s*p.y + x0, c*p.y + s*p.x + y0];
function rot_each(v, x, y, rot) = [ for (p = v) rot(p, x, y, rot) ];

function extrusion_side(x0, y0, xdim, ydim, rot) = 
    let(
        u=extrusion_mount_unit, o=extrusion_mount_slot_outer,
        i=extrusion_mount_slot_inner, th=extrusion_mount_slot_thickness,
        bs=1.96, ii=i, b=5.46, 
        s=1.64, q=ii+1.5/sqrt(2)*2, d=u/2-th-q/2, do=d-s, c=4.2)

    [ for (x = [0:u:xdim-1]) each [
            rot([x+u/2-o/2, 0], x0, y0, rot),
            rot([x+u/2-i/2, th], x0, y0, rot),
            rot([x+u/2-i/2-do, th], x0, y0, rot),
            rot([x+u/2-i/2-do, th+s], x0, y0, rot),
            rot([x+u/2-ii/2, th+d], x0, y0, rot),
            rot([x+u/2, th+d], x0, y0, rot),
    
            if (((rot<180 || ydim > u || x==0) && (x < xdim-u-1)) || (xdim == u && ydim == u && rot == 0)) each rot_each(curve(
                270, -90,
                c/2, c/2,
                x+u/2, u/2), x0, y0, rot),
                
            rot([x+u/2, th+d], x0, y0, rot),
            rot([x+u/2+ii/2, th+d], x0, y0, rot),
            rot([x+u/2+i/2+do, th+s], x0, y0, rot),
            rot([x+u/2+i/2+do, th], x0, y0, rot),
            rot([x+u/2+i/2, th], x0, y0, rot),
            rot([x+u/2+o/2, 0], x0, y0, rot),
            
            if ((rot<180 || ydim > u) && (x < xdim-u-1)) each rot_each([
                [x+u, 0],
                [x+u, th],
                [x+u-b/2, th],
                [x+u-b/2, th+bs],
                [x+u/2+q/2, u/2-i/2],
                [x+u/2+q/2, u/2+i/2],
                [x+u-b/2, u-th-bs],
                each if (extrusion_mount_w == u || extrusion_mount_h == u) [
                [x+u-b/2, u-th],
                [x+u+b/2, u-th],
                ],
                [x+u+b/2, u-th-bs],
                [x+u*3/2-q/2, u/2+i/2],
                [x+u*3/2-q/2, u/2-i/2],
                [x+u+b/2, th+bs],
                [x+u+b/2, th],
                [x+u, th],
                [x+u, 0],
            ], x0, y0, rot), 
        ],
    ];