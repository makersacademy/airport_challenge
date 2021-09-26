# Description of the challenge:
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## User stories: [User stories analysis :](url)
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

# Setting up the project:

1. git fork
2. Make new directory in your projects folder
3. Pull all the information from the fork 
4. Had to do rvm install “ruby-3.0.2" as I did not have that version of Ruby installed
5. Did bundle, which installed the gems, however the first line said “Warning: the running version of Bundler (2.2.22) is older than the version that created the lockfile (2.2.26). We suggest you to upgrade to the version that created the lockfile by running `gem install bundler:2.2.26`. “ , so I followed the instructions and did gem install bundler:2.2.26

# [User stories analysis :](url)


![User story 1-1](https://user-images.githubusercontent.com/80968551/134821671-b6ecb100-ae6f-417a-ae76-3f53ae8679a1.png)
![User story 2 - 2](https://user-images.githubusercontent.com/80968551/134821673-4fb76cd9-e709-4696-bc13-97eada9aff8e.png)
![User story 3 -3](https://user-images.githubusercontent.com/80968551/134821674-2808ac98-b927-4583-9927-254228001399.png)
![User story 4 - 4](https://user-images.githubusercontent.com/80968551/134821675-e5de86bf-0a40-4a48-912c-9ac2f8c408b3.png)
![User story 5 -5](https://user-images.githubusercontent.com/80968551/134821676-32786a07-ac27-4d01-a2f4-404ae4b237ae.png)
![User story 6 - 6](https://user-images.githubusercontent.com/80968551/134821684-1050df53-e416-4c4a-9e35-40940d01eb53.png)

## User story 1:
- ran my idea in IRB first - small steps
![Image 24-09-2021 at 10 40](https://user-images.githubusercontent.com/80968551/134822055-18a3d921-bb4f-4397-81dc-b41274c76a50.jpg)
- now we need to build the same error in rspec. We make a new file airport_spec.rb in the spec file- for now it contains just describe Airport do \n end
![Image 24-09-2021 at 10 56](https://user-images.githubusercontent.com/80968551/134822070-70351b66-0339-4782-9787-0240b2a975fa.jpg)
- now that we have got the same error as we did in irb ( uninitialised constant Airport), we know that we need to make a file airport.irb that will contain an empty class Airport. Firstly we make a folder called lib and insider it we make the airport.rb file mentioned above

![Image 24-09-2021 at 11 02](https://user-images.githubusercontent.com/80968551/134822106-5649e80c-de4a-4f2d-be66-0b5c36843d38.jpg)
- We then add on line 1 of the spec file require “airport” and then we run the test again
- We then run the test again in irb - first require “./lib/airport.rb” and get it to pass here as well
![Image 24-09-2021 at 11 04](https://user-images.githubusercontent.com/80968551/134822135-07d4bd46-3954-4b38-b5cb-a2b327a759c9.jpg)
- now we can instantiate an Airport object
- I then ran the rubocop and made the required adjustments to the files
![Image 24-09-2021 at 11 11](https://user-images.githubusercontent.com/80968551/134822166-897917d2-f4ae-481d-acc4-9bf34c590e34.jpg)
- We will follow the same steps for plane as well : run irb, then make the test fail the same in rspec, then make the file with empty class, get rspec to pass then run feature test again and make sure class plane works 

- Now that we have made our classes it is time to focus on the methods we need for this user story
- We are going to follow the same steps as before, so irb error, rspec error, write the method, get the unit test to pass, get feature test to pass

![Image 24-09-2021 at 11 35](https://user-images.githubusercontent.com/80968551/134822215-a16801a9-dd08-430e-94f6-bb704d2c281b.jpg)
- The irb error says that there is undefined method land for our plane instance
- We now need to get the same error in rspec 
![Image 24-09-2021 at 11 42](https://user-images.githubusercontent.com/80968551/134822238-22507bbb-02ed-4239-a440-0f8ea7d30923.jpg)
- Now we are going to write the method in our class
<img width="245" alt="image" src="https://user-images.githubusercontent.com/80968551/134822267-fccdd473-983a-494d-8daf-0f6068663650.png">

![Image 24-09-2021 at 11 53](https://user-images.githubusercontent.com/80968551/134822281-3476f14d-4122-4b1a-83bd-74480d0c1a52.jpg)

![Image 24-09-2021 at 11 55](https://user-images.githubusercontent.com/80968551/134822283-539e4723-2593-4be6-8506-e6f4fd894932.jpg)

## User stories 2 - 4
- the steps outlined above were followed for the rest of the user stories

## User stories 5 and 6
- These user stories were not fully completed.
- A weather class has been created and it initializes an instant variable, weather, that is an array containing the strings "sunny" and "stormy"
- The weather class contains a method, weather_conditions, that chooses between sunny and stormy weather
<img width="394" alt="image" src="https://user-images.githubusercontent.com/80968551/134822585-51d292e4-963f-435c-925d-30a89e528a97.png">

<img width="451" alt="image" src="https://user-images.githubusercontent.com/80968551/134822695-69509e1d-3d9a-479c-9869-688224b81d28.png">



- to finish these 2 sections, I would add an edge case to the land and take_off methods, that would raise an error if oen would try to land/take_off in stormy weather


# Links of readings:

- https://stackoverflow.com/questions/3009477/what-is-rubys-double-colon - what is Ruby’s double colon
- https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Classes#Inheritance - Ruby Programming/Syntax/Classes- Inheritance
- https://stackoverflow.com/questions/14063395/rspec-class-variable-testing - RSpec class variable testing 
- https://stackoverflow.com/questions/26118031/rspec-3-vs-rspec-2-matchers - RSpec 3 vs RSpec 2 matchers
- https://stackoverflow.com/questions/50082085/how-can-i-set-the-length-of-an-array - How can I set the length of an array
- https://programmingresources.fandom.com/wiki/Ruby-_Remove_Elements_From_An_Array - Ruby - Remove elements from an array
- https://www.simplybusiness.co.uk/about-us/tech/2020/05/rspec-instance-doubles/ - Using instance_double in RSpec tests
- https://github.com/rspec/rspec-mocks/issues/1152 - How to stub initialise method on object
- https://codereview.stackexchange.com/questions/143818/testing-initialize-of-class-author - testing the initialise class
- http://tutorials.jumpstartlab.com/topics/internal_testing/rspec_practices.html - RSpec practices 
- https://everydayrails.com/2018/03/23/rails-spec-coverage-simplecov.html - Rails test coverage: Measuring what matters with SimpleCov
- https://github.com/simplecov-ruby/simplecov - simplecov-ruby/simplecov
- https://groups.google.com/g/rails-oceania/c/NOKbcNK5TTw?pli=1 - RSpec: “How to test that a class’s initializer method invokes some method?
- https://stackoverflow.com/questions/4530440/rails-rspec-how-to-test-initialize-method - RSpec how to test the initialise method
- https://medium.com/@tomkadwill/all-about-rspec-let-a3b642e08d39 - All about RSpec let
- https://stackoverflow.com/questions/1542945/testing-modules-in-rspec - Testing modules in RSpec
- https://stackoverflow.com/questions/31360945/call-a-method-in-a-class-in-another-class-in-ruby - call a method in a class in another class in Ruby
- https://relishapp.com/rspec/rspec-mocks/docs - RSpec mocks 3.10
