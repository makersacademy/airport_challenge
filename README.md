# Airport Challenge

``````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

``````

This program models planes and airports. Airports control the landing and taking off of planes, protecting against edge cases. Planes only know if they are flying or not. For example, if a plane is unable to take off because it is not in that airport, an error is raised. A successful landing or take off results in the addition or removal of that plane to the airport hangar.

The weather is randomly generated, and any action is prevented while the weather is stormy, which will also raise an error.

This program used SimpleCov to test the coverage at 100%.

No offenses detected using RuboCop.

## Installation

```
git clone https://github.com/cms718/airport_challenge.git
bundle
```

## Usage

```
require './lib/airport'

airport = Airport.new
airport_two = Airport.new

plane = airport.hangar.first

airport.take_off(plane)
airport_two.land(plane)
```
