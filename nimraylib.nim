import nimraylib/raylib
export raylib

proc newColor*(r, b, g, a: int): Color =
  Color(r: cast[cuchar](r), b: cast[cuchar](b), g: cast[cuchar](g), a: cast[cuchar](a))

const
  LightGray*  = newColor( 200, 200, 200, 255 )
  Gray*       = newColor( 130, 130, 130, 255 )
  DarkGray*   = newColor( 80,  80,  80,  255 )
  Yellow*     = newColor( 253, 249, 0,   255 )
  Gold*       = newColor( 255, 203, 0,   255 )
  Orange*     = newColor( 255, 161, 0,   255 )
  Pink*       = newColor( 255, 109, 194, 255 )
  Red*        = newColor( 230, 41,  55,  255 )
  Maroon*     = newColor( 190, 33,  55,  255 )
  Green*      = newColor( 0,   228, 48,  255 )
  Lime*       = newColor( 0,   158, 47,  255 )
  DarkGreen*  = newColor( 0,   117, 44,  255 )
  Skyblue*    = newColor( 102, 191, 255, 255 )
  Blue*       = newColor( 0,   121, 241, 255 )
  DarkBlue*   = newColor( 0,   82,  172, 255 )
  Purple*     = newColor( 200, 122, 255, 255 )
  Violet*     = newColor( 135, 60,  190, 255 )
  DarkPurple* = newColor( 112, 31,  126, 255 )
  Beige*      = newColor( 211, 176, 131, 255 )
  Brown*      = newColor( 127, 106, 79,  255 )
  DarkBrown*  = newColor( 76,   63, 47,  255 )
  White*      = newColor( 255, 255, 255, 255 )
  Black*      = newColor( 0,     0,   0, 255 )
  Blank*      = newColor( 0,     0,   0, 0   )
  Magenta*    = newColor( 255,   0, 255, 255 )
  RayWhite*   = newColor( 245, 245, 245, 255 )
