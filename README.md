Airport Challenge
=================

```
        ______
        _\____\_____
=  = ==(__CB AIR____)
          \_____\___________________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                          )
                `---~~\___________/---------------------`````
          =      =  ===(_________)

```

______
 
[Set up](#Setup) | [Interact](#Interact) | [Run Tests](#Tests) | [User Stories](#User-Stories)

### Ladies and gentlemen welcome on board! 
#### Thank you for flying CB AIR. I hope you have a pleasant stay, please fasten your seatbelts.

## Implementation

Functional representation of user requirements:

Objects  | Messages
------------- | -------------
Air traffic controller | 
Plane | plane object
Plane | flying?
Airport | airport object
Airport | hangar
Airport | capacity
Airport | weather
Airport | landing
Airport | takeoff
Plane | prevent_takeoff
Plane | prevent_landig

[Check out my workflow mindmap](https://github.com/CorinneBosch/airport_challenge/blob/main/workflow/screenshot.png)

## <a name="Setup">Set up</a>

1. **Fork** this [airport challenge repository](https://github.com/CorinneBosch/airport_challenge) 
2. Then clone **your** fork to your computer.
3. Ensure you have `Ruby` and `rspec` installed. 
4. Run `gem install bundler` if you dont have bundler.
5. Once installed, run `bundle`.

## <a name="Interact">Interact with the programme</a>

You can frature test and run this airport program in any `code editor` or `IRB`.

## <a name="Tests">Run test</a>

To test specific features in your terminal.
```
$ cd airport_challenge/lib
$ rspec spec/file_name.rb
```
To test all features at once in your terminal.
```
$ cd airport_challenge
$ rspec
```

## <a name="User-Stories">The airport challenge is built upon the following user stories:</a>


```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Source of original Repository: [Makers Academy GitHub](https://github.com/makersacademy/airport_challenge)
