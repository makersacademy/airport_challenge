require_relative './airport'
require_relative './plane'

puts """

  R E A D M E
______________________________________

* You can create Planes like this

      \033[32menola_gay = Plane.new\033[0m

* You can create Airports like this

      \033[32mstn = Airport.new\033[0m

  * At the point of creating Airports, you can specify:

    * The size of the Airport (how many planes its hangar can hold)
    * The Airport's location

      \033[32mlgw = Airport.new(125, \"London Gatwick\")\033[0m

______________________________________


  Air Traffic Control at airports can do a number of things:

      * Land planes that are in the sky, or at the plane factory

          \033[32mstn.land(enola_gay)\033[0m

      * Have a plane take off

          \033[32mstn.takeoff\033[0m

      * Tell you the name of the airport

          \033[32mlgw.name\033[0m

      * Show you all the planes in the hangar

          \033[32mjfk.check_hangar\033[0m

      * Tell you how many planes they hold at capacity

          \033[32mnrt.capacity\033[0m

  But what they can't do is land planes or have planes take off when it's stormy.

  It can be stormy, sometimes without warning.

  You'll see a descriptive error message when this is the case.

______________________________________


  Planes can do a couple of things:

      * Tell you their flight number

          \033[32menola_gay.flight_number\033[0m

      * Tell you where they are, be it at the factory, in the sky, or in a particular Airport hangar.

          \033[32menola_gay.location\033[0m


______________________________________
"""
