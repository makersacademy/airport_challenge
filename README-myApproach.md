## Airport-Challenge

My goal for this project is to create a software that will manage planes landing and taking off for an Airport. It should be able adapt to weather conditions 'sunny' and 'stormy'.

+ When it's sunny planes should be able to land and take off
+ However, When it's stormy planes cannot land or take off

### The steps I am taking:

- [x] Create a functional representation of the first User-Story
- [x] Perform a feature test, analyse the errors and begin creating your first unit test.  

Now that I understand how I want my program to run, and have created my Airport object. Now lets create our Plane object and also test drive creating the land method for the Airport. Below are the TDD steps I followed to successfully do this:

Goal: Create the :land_plane method for the Airport class
- [x] Create a failing test to check if the airport object of class Airport responds to the method :land_plane
- [x] Make the above test pass - then check if you can refactor your solution
- [x] Next create a test to describe what kind of output :land_plane should produce - it should create a Plane instance
- [x] Make this test pass and refactor
- [x] Run a feature test and ensure your code is working how you want 

Review: Planes can now land at an Airport

#### Lets look at the second User Story:

- [x] Create a functional representation of the second user story
- [x] Perform a feature test and analyse any errors that occur

To satisfy this user story, we need to allow a plane to take off from our Airport, it should output a Plane. 

Goal: Create a :take_off method for the Airport class
-[x] Create a test to check if Airport responds to :take_off
-[x] Pass this test and refactor
-[x] Create a test to check if :take_off outputs a Plane
-[x] Pass this test and refactor
-[x] Create a test to check if the plane has left the airport
-[x] pass this test and refactor
-[x] Perform a feature test to ensure your code is behaving correctly

Review: Planes can now land, and take off. The Airport instance knows what planes are in it using an instance variable. We created a test to confirm that the plane is no longer in the airport.

#### Now the Third User Story:

After Creating the functional representation of the user story, perform a feature test to get an idea of any errors you want to expect and how you want to use your software as well.

To satisfy this user story we need to set a maximum capacity of 10 Planes for this Airport and we should expect an error when 11 planes try to land. 

Goal: Set a maximum Plane capacity of 10 Planes

-[x] Describe a test which attempts to land 11 planes at an Airport instance and should expect and error to be raised.
-[x] pass this test and rafactor your solution if needed
-[ ] Your test should still run without errors when attempting to land up to 10 planes. Create a test for this.
-[ ] Pass this test and refactor
-[ ] perform a feature test


