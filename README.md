# Airport Challenge :airplane:

## Instructions

[The task](TASK.md) for the weekend challenge was to create a simple system for an airport subject to the clients needs.		
		
Addressing the User Stories obtained from the correspondence with the client we are able to build the system by Test Driven Design. 

## Steps

### Step 1: Domain Model
The firt step taken to complete the challenge was to create a simple domain model; this helps visualize the problem and allows us to initially predict the object classes we will require and how they will interact. In this challenge it was immediately clear that we would need both an airport and an airplane class and they would interact through take off and landing, for example.

### Step 2: User 

Obtaining [User Stories](USERSTORIES.md) is crucial in order to meet the client requirements when building a system; frequent during the build ensures the client's needs are met throughout. I personally choose to seperate the User Stories into a seperate file in order to isolate them individually.		
	
Assessing the User Stories allows the build process to begin. Predicting most nouns to become classes and verbs to become methods is a good place to start although should be interpreted with caution; in this challenge 'the weather' was not created as a class but rather was a state of an airport. 

### Step 3: Test Driven Design (TDD)
TDD is fundamental when approaching challenges like this. By creating the tests first, using rspec in this case, we are able to create the code critically. It enables the production of the system to be rigorously checked throughout and account for how additional code changes the whole system. 		
	
In this case, starting with the first User Story, we can see a pilot would like to be able to land a plane at an airport. Before writing the code, we first write the test to see if there is a method to land at an airport i.e the pilot 'can' land a plane. 		

Continuing this method through small steps leads to the creation of a system that has been continually tested.

### Step 4: Object Orientated Design (OOD)
Once a test has been written, the goal is to pass that test in the most simple way possible. Following which, we refactor and then repeat the process. Using OOD, we are able to create the classes required to tackle this problem - plane and airport - and address how they interact and what properties they may have. 		
	
For example; the plane can interact with the airport by landing or taking off and the airport has a capacity.

[:banana:]()


