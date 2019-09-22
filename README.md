Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Intro
---------
This command line application allows you to create airports and planes, and perform basic operations such as landing and taking off. The user may define the capacity of an airport but it will else default to 20.

The weather can sometimes be a problem, so on occasion plans will not land or take off due to stormy weather.

Setup
-------

1. Clone this repo locally. Paste the following into your terminal: git clone git@github.com:NabilleH/airport_challenge.git
1. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Automated tests may be run by running 'rspec' in the terminal from the directory root folder

User guide
-------

1. Launch 'irb' from the command line to operate your airport.
2. type and enter: 'require .lib/airport'

Commands
-------

#Create an airport: gatwick = Airport.new (supply an argument to set airport capacity)
#Create a plane: london_air = Plane.new
#Land a plane(same as parking for newly created planes): gatwick.land(london_air)
#Fly a plane: gatwick.take_off(london_air)

Possible errors when trying to fly...
-------
#'Unable to take off due to stormy weather'
#'Plane is already in the air'
#'Plane has already landed'
#'Unable to land due to stormy weather'
#'Can't land, airport is full'
