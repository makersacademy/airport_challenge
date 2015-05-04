I have been creating a model of an airport using TDD to drive the project.

At this stage I have got as far as clearing 3 main feature tests. The first two were essentially created as mirrors of each other - Taking off and landing.

After this part I came up against it a little, eventually (after much trial and much error) shoring up a third feature test handling the capacity of the airport.

The next stage would be to handle the weather. If I'm correct in following how TDD works I'll be looking to first test for something simple - a basic 'if it's stormy don't allow takeoff', followed by a concurrent 'if it's stormy don't allow landing' feature test. I'm led to understand that doubles will be required to handle the randomly-generated weather conditions to ensure consistency of tests, so I will continue to investigate this.