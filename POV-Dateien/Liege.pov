// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 90      // front view
                            location  <0.0 , 5.0 ,-15.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 5.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
// sun ---------------------------------------------------------------------
light_source{<-1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <1.0,1.0,1.0>]
                                   [0.30 rgb <0.0,0.1,1.0>]
                                   [0.70 rgb <0.0,0.1,1.0>]
                                   [1.00 rgb <1.0,1.0,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   50
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8}
// ground ------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ color rgb <0.825,0.825,0.825>}
              } // end of texture
     } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------   


// Boden unten
cone{<0,0,0>,3,<0,0.5,0>, 0.8
       texture{ pigment { color rgb<0.5,0.5,0.5> } }
}

// Ständer zur Liege
cylinder { <0,0,0>,<0,1.75,0>, 0.5 

           texture { pigment { color rgb<0.5,0.5,0.5> }
           translate <0, 0.5, 0>  }
}     

// Liegefläche
union {
// Oberer Teil
box { <0,0,0>, <9, 0.7, 5>
      rotate <0,0,30>  
      translate <2,1,-2.5>
}      

// Verbindungsstück des oberen und mittleren Teils
cylinder { <0,0,0>, <0, 0, 5>, 0.5
           texture { pigment { color White } } 
           translate <1.75,1.25,-2.5>
}


// Mittlerer Teil      
box { <0,0,0>, <5, 0.7, 5>
      rotate <0,0,-20>  
      translate <-3,2.5,-2.5>
}          

// Verbindungsstück des mittleren und unteren Teils
cylinder { <0,0,0>, <0, 0, 5>, 0.5
           texture { pigment { color White } } 
           translate <-2.75,2.75,-2.5>
}
        
// Unterer Teil        
box { <0,0,0>, <4, 0.7, 5>
      rotate <0,0,10>  
      translate <-6.75,1.6,-2.5>
} 
      
texture { pigment { color White } }
}  
        
















