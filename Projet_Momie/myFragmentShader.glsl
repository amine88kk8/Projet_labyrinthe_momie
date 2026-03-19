/*
  Part of the Processing project - http://processing.org

  Copyright (c) 2012-15 The Processing Foundation
  Copyright (c) 2004-12 Ben Fry and Casey Reas
  Copyright (c) 2001-04 Massachusetts Institute of Technology

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation, version 2.1.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
*/
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;      //texture du rendu
uniform sampler2D noiseTexture; //texture du noise

uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 backVertColor;
varying vec4 vertTexCoord;
varying vec3 vViewDir;
varying vec3 vNormal;



void main() {

  vec4 baseColor = (texture2D(texture, vertTexCoord.st) * (gl_FrontFacing ? vertColor : backVertColor));;
  
  
  vec2 noiseUV = vertTexCoord.st*0.3;
  float pertu = (texture2D(noiseTexture, noiseUV).r);



  vec4 finalColor = mix(baseColor, baseColor*0.4, pertu);


  finalColor.a = 1;


  gl_FragColor = finalColor;
  // Appliquer une correction gamma (gamma = 2.2)
  gl_FragColor.rgb = pow(gl_FragColor.rgb, vec3(1.0 / 1.6));

}
