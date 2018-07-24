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

## How to run:

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

## Context
This was the first Weekend challenge at Makers. This was given after one week of the course. This week we focused on understanding Ruby, creating a set of classes and modules, and passing objects into different methods and while testing said methods in Rspec.  

## Task
I wrote software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

## User Stories

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
## Approach

My first challenge was to take each of the user stories and deduce their corresponding feature test. The third line of each story outlines the feature test and the method that ought to be tested in IRB. Through the week, we learned Test Driven Development and it seemed practical to use this project as an opportunity to implement this. Therefore, after identifying the feature test, unit tests were written to fail. After each failure, I wrote the code required to pass the test. At first this seemed unintuitive. It felt as though we were placing the cart before the horse. However, overtime I did observe its adoption provided a succinct way of coding. The same approach was taken for each of the feature tests outlined above.
## Summary

Overall, the airport challenge allowed the introduction of new concepts. For example, the use of attribute readers to create methods that only contained the instance variable. I learned about passing results from methods as arguments of another. For example, we pass each plane to the 'land' method to be placed into the airport. As it was week one, there were holes in my knowledge. For example, to inject realism into the code, it seems more logical to separate the airport and plane and use dependency injections to allow both to communicate and be aware of each other's environment and state. If a plane is aware that an airport is full, it may decide to land in another airport. Here, the importance of independent learning became increasingly obvious. For example, I noted that I need to fix the capacity of each airport. This led to the discovery of constants. All in all, as a week one project, the airport challenge made me excited for the more learning that is to come!

## State of project and changes to be made

At the moment, the basic user stories have been completed. However, there is always room for improvement. I will endeavour to refractor my code further and, perhaps, include my own user stories. The code currently has 95% coverage. This can also be improved.


##My additional User stories.

```
As an air traffic controller
To ensure that all planes land
I would like to direct a plane to another airport and get a confirmation of landing

As the system designer
So that the software can be used for many different airports
I would like a list of different airports with different capacities.

```
## Feature testing

The feature test can be run from the IRB as stated below:

## How to use

#### 1. Run IRB from the main folder 'airport_challenge'
```
irb
```

#### 2. Require the proper files
```
require './lib/airport.rb'
```

#### 3. Create a new airport
```
airport = Airport.new
```  

#### 4. Land the plane
* When we create a new airport, a new plane has been initialized.
  ```
  airport.land(plane)
  ```
#### 5. The plane takes off from the airport

```
airport.take_off(_plane)
```
#### 6. When finished, exit IRB
```
exit
```
