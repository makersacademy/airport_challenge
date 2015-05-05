I have been creating a model of an airport using TDD to drive the project.

At this stage I have got as far as clearing 3 main feature tests. The first two were essentially created as mirrors of each other - Taking off and landing.

After this part I came up against it a little, eventually (after much trial and much error) shoring up a third feature test handling the capacity of the airport.

I've commented out what came next - I was attempting to dradt a couple of basic tests to handle the weather. If I'm correct in following how TDD works, The feature test is being set up first for something simple - a basic 'if it's stormy don't allow takeoff', followed by a concurrent 'if it's stormy don't allow landing' scenario.

I'm not yet clear on the exact way I'm going to handle even receiving news of the weather, let alone then expanding on the test and code to account for the requested random conditions, but will hopefully get a chance to look into this as the week progresses.