### Airport Challenge
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
###### the idea
To write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off

###### User stories / app capabilities
_An air traffic controller can:_ <br>
- [x] instruct a plane to land at an airport
- [x] instruct a plane to take off from an airport and confirm that it is no longer in the airport
- [x] prevent landing when the airport is full 
- [x] define airport capacity (set to 20 by default)
- [x] prevent takeoff when weather is stormy 
- [x] prevent landing when weather is stormy 

The testing also defends against edge cases such as inconsistent states of the system ensuring that:
- [x] planes can only take off from airports they are in
- [x] planes that are already flying cannot take off and/or be in an airport
- [ ] planes that are landed cannot land again and must be in an airport

###### Built with

Ruby

###### How to run
_only in irb for now_

###### How to test

`Rspec`
_and/or_
`irb feature_test.rb`

###### week 2 @ Makers Academy
first weekend exercise, revisited along with walkthrough to solidify learning

###### Collaborators
solo [Myrtle](https://github.com/Mrtly) 
