# Airport Challenge

First weekend challenege to apply our TDD and ruby skils. It required a group of rspec tests and ruby files, to create an airport with planes that can land and take off to suit the user stories.

## My approach

Three classes: Airport, Plane and Weather

Airport class was required to hold the plane objects.
Plane class was required to create objects to be added or removed from the airport.
Weather was set up as a separate class so I could try to mock/double/stub this and use it as a consistent element in my rspec tests.

## Running tests

Rspec tests are not runnning consistently. Stub to override random weather to ensure consistent test behaviour has not been successful.

