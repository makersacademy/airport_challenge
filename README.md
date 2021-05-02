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

This challenge involved modelling airports and aeroplanes. Aeroplanes can land at, and launch from, an airport. The weather also comes into play, with aeroplanes only able to land/launch when the weather is sunny, not stormy.

I decided to start with the Airport class, with land and launch methods, both of which are passed a plane. The Airport instance keeps track of which planes are landed on it, so that it doesn't launch a plane it doesn't have, and doesn't land more planes than it can hold. The Plane class instances only keep track of whether or not they are landed, which the Airport instance checks so that the plane can't land at multiple airports. I also created a Weather class, with a method #current_weather.

This project has 100% test coverage (SimpleCov) and conforms to Rubocop style.
