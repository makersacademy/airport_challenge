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

Welcome to my solution for the airport challenge. Below I have explained how I approached the challenge, the process I have followed and the learning outcomes achieved. 

Objective
---------
The objective of this challenge was to create a program which controls the flow of planes at an airport by allowing them to land, take_off and stay inside the airport. The program should account for changing weather conditions and take into account any edge cases. 


Progress and Learning Outcomes
------------------------------
At first I found this challenge very difficult to complete. However, by following a robust process, I have managed to complete this test to the best of my ability keeping in line with all the user stories. All the edge cases I could think of have been considered during the writing of this program.

I have learned the following during the completion of this challenge:

1. Gained a deeper understanding of test driven development
2. Have been able to understand RSPEC concept and syntax better
3. Have managed to write cleaner and better fit for purpose tests
4. Have been able to understand abstraction and apply that better
5. Gained further understanding of scope
6. application of SRP
7. Further knowledge and clarity on OOP
8. Understanding of attr_reader, accessor, writer and stubs
9. Gained problem solving skills


Process
-------
I followed the TDD process as below:

1. Break down the user story into its components using problem solving skills
2. Figure out the object and methods from the breakdown
3. Wrote feature tests based on the diagram
4. Wrote unit test based on feature test failures
5. Wrote the code to make the unit pass


Program (Features and Functionality)
------------------------------------
The program allows to manage the flow of traffic in an airport effectively and robustly. The program takes has various features but some of the main features are highlighted below

**Features Tests and User Stories**

Please follow this link for [User story representations and feature tests](https://docs.google.com/document/d/e/2PACX-1vRD_SHoy4B9YGyuX5tKhT0AMdy7yQ7SsbrwUpOB8Z_CuZQocBVMnt6fHaykmG2M23xq4rIVW4GDfhrn/pub). 

**Classes**

The program has three classes which are airport, plane, and weather. For each class the methods and features have been clearly defined in the code and have all been tested out. 

**Airport**

For every new airport, the program creates a hanger where the planes will be kept after landing until they takeoff again. The program also sets the default capacity of that hanger to hold 1 plane which can changed by the user at the creation of the airport.

**Weather**

Weather class has been created to take into account ensure the other functionalities of the program that depend on weather conditions are not compromised. Weather has been assigned a set of procedures where randomises so that it will say the weather is stormy 20% of the times. The procedures defined in this class are integral to other functioanlities of the program. 

**Landing Functionality**

The program allows us the land planes at the airport. It then parks the plane in a hanger on the airport this plane landed in. The program does not allow the plane to land when the weather is stormy, when the hanger is full or the plane that we are asking to be landed has already been landed on the airport.

**Take_off Functionality**

The planes which have previously been landed can also takeoff from the airport. We also test for cases where we will get an error if we instruct for a plane to takeoff which is not in the hanger and to prevent takeoff when weather is stormy. 


Challenges Faced
----------------

Some of the biggest challenges I faced during this challengeare below:

**Problem solving**

I have recently started to try and think like a programmer and problem solve in that capacity. What I have noticed during this challenge is that I can spend a lot of time trying to break down a problem without any actual progress made. I spent an obscene amount of time just stuck at user story 1. This was something that really blocked me and did not let me move on as I was thinking about the end result and not the problem at hand. After a gruelling few hours without any progress, I changed my approach and went back to the drawing board to think about problem solving and TDD process. I then started writing my first meaningful feature test to solve the smallest problem and slowly started building up from there. Once I was unblocked, completing the rest of the challenge was a much better experience. 

**Writing Tests and Rspec**

I do not have any previous experience writing test and using Rspec so it was difficult to figure this out at first. After practising and researching it has now become a bit more easier to write test. I hope that this is something that will become better with time.


Conclusion
----------

I am very happy to have completed this challenge and I am glad that I did not give up when I was blocked. I kept reminding (and will keep reminding myself) the quote 'it's not hard, it's new'.

