**OWN README**

**APPROACH**

The initial approach is to have break down each user story into 1-2 tests. For example, instruct plane to land. that would require the planes on the ground to have that plane landed.

So to pass this test, and the other tests. I drew up a 'relationship' diagram, where there are 2 classes, Airport and Plane, with the method being land, takeoff etc. Then i defined attribute of airport class, stormy, which sets condition whether can takeoff/land. Same with validation of full?, which sets before action requirement for land.

The last point is quite confusing, as I was thinking about changing capacity, rather than changing default capacity. So to test this, I change the default capacity in test, and the test would be to expect that airport would still be able to accommodate the number of increased planes landed.

To make this test pass (which took a while), I made attribute configuration for the Airport class so that if default capacity is not set, its set to a default,(e.g. 20), if it is, it is set to default capacity. capacity is set to default to default capacity unless it is changed.

To do the stub took quite a while(2- 3hours), as I experimented using a Double of airport, but it wouldn't respond to other methods in Airport class.


Then, to pass the extra validation tests(edge cases), e.g. plane cannot takeoff if already flying, cannot land if already landed. I made test to raise error if these conditions are present. The code to pass the test would be incorporated into the takeoff and land methods.

Things I didn't do:
-  ensuring that planes can only take off from airports they are in
i plan to test using 2 airports, and set a scenario where one plan leaves a wrong airport and raises an error. To pass this test I think i might be able to assign 2 airports or assign airport attribute on plane class (e.g. @airport = 1) and use a conditional statement in land.
