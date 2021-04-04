Airport Challenge

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

These requirements were solved step by step and were written test first:

1. The plane can land at an airport
2. The plane can takeoff from an airport
3. Once a plane has taken off from an airport there is confirmation that it is no longer in the airport
4. Planes can't land if the airport is full
5. The airport now has a default capacity which can be overriden 
6. Planes can't takeoff if the weather is stormy
7. Planes can't land if the weather is stormy

Rubocop was run when the project was complete.

