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
|Plane|ask for permission|
|Airport|gives permmision to land|

Airport <---- allows plane to land <--- after landing plane goes to hangar
3. Create an Airport class
4. Create landing methods
5. Create plane class
6. Create method ask_for_permission
7. Create landing

8.  New user story:
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
Functional representation of that story:

| Objects       | Messages      |
| ------------- | ------------- |
|Airport        | gives permission to take off|
|Airport        |confirm that plane is no longer at the airport|
Airport <---- allows plane to take off <--- after take off plane dissapear from hangar
9. Create hangar
10. Put planes that landed into the hangar
11. Check a plane count after take off
12. Allow for take off only the plane that is in the hangar



## Installation



## Usage


```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.



## License
[MIT](https://choosealicense.com/licenses/mit/)
