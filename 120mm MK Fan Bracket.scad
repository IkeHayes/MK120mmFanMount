// ******************************************
// 120mm Fan Mount Bracket for Mini Kossel 3D Printer
// By Isaac Hayes
// Copyright 2014
// http://scuttlebots.com
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
// ******************************************

$fn=100;

module FanMount()
{
	difference() {
		cube([120,3,10]);	//Lip that fan mounts to
		translate([7.5,3.5,7.5]) rotate([90,0,0]) cylinder(d=3.25,h=4);	//Screw holes for fan
		translate([112.5,3.5,7.5]) rotate([90,0,0]) cylinder(d=3.25,h=4);
		translate([60,3.05,60]) rotate([90,0,0]) cylinder(d=143,h=3.1);	//Cutout for fan cavity to fit
	}
}

module FanHolder()
{
	union() {
		translate([0,5,4]) FanMount();
		cube([120,25,4]);
	}
}

module Bracket()
{
	render(convexity=2){
		difference() {
			union() {
				difference(){	
					cube([30,15,6]);	//Rail Attachment
					rotate([0,0,-30]) translate([-120,0,4]) cube([120,25,3]);
				}
				rotate([0,0,-30]) translate([-120,0,0]) FanHolder();
			}
			translate([10,7.5,0])  cylinder(d=3.75,h=6); //M3 Shaft Hole
			translate([10,7.5,3])  cylinder(d=6.75,h=3);	//M3 Counter Sink Hole
			translate([24,7.5,0])  cylinder(d=3.75,h=6);
			translate([24,7.5,3])  cylinder(d=6.75,h=3);
		}
	}
}

color("aqua") Bracket();

