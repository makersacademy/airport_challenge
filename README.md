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

I started this challenge with a TDD approach.
Beginning with laying out the user stories, I created plane and airport classes, with functionality to land, take off and use dependency injection to check each other's attributes.
The challenge has been left unfinished due to confusion over stubs/mocks/doubles.
An earlier version included an extracted Weather class, but came up against the same problem with mocking for testing.
My next steps once mocking for weather variation was understood and implemented would be to create a capacity attribute at my airport and ensure that when full, new planes were not permitted to land.
