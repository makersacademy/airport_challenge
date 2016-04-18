AIRPORT CHALLENGE

Synopsis
--------
The task is to write the software to control the flow of planes at an airport. The planes can take off and land provided that the weather conditions are stable. The software must ensure that planes are landing in and taking off from the correct airport.


Code Example
------------
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fbf1b913200 @planes=[], @capacity=30>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fbf1b908558 @flying=true>
2.2.3 :004 > airport.land(plane)
 => [#<Plane:0x007fbf1b908558 @flying=false>]
2.2.3 :005 > airport.land(plane)
RuntimeError: Plane not flying
  from (irb):5
2.2.3 :006 > airport.take_off(plane)
 => #<Plane:0x007fbf1b908558 @flying=true>
2.2.3 :007 >


Motivation
----------
First weekend challenge, forked from MakersAcademy.


Progress
--------
Project finished. However, code is clumsy and in no way elegant and easy to read. In urgent need to be refactored.


Author
------
HannaEb