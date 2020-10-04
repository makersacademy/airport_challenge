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

# Airport

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## Process
1. Write a README.md
2. User story: As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport.

Functional representation of that story:

| Objects       | Messages      |
| ------------- | ------------- |
|a traffic controller|      |
|Passanger|get  to a destination |
|Plane|asks for permission|
|Airport|gives permmision for landing|

Airport <---- allows plane to land <--- after landing plane goes to hangar

Feature tests follow Unit tests follow code.
You can find feature test in ./playground_aka_feature_tests.rb

3.  New user story:
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
Functional representation of that story:

| Objects       | Messages      |
| ------------- | ------------- |
|Airport        | gives permission to take off|
|Airport        |confirm that plane is no longer at the airport|

Airport <---- allows plane to take off <--- after take off plane dissapear from hangar

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.



## License
[MIT](https://choosealicense.com/licenses/mit/)
