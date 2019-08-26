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
SUMMARY
This file contains the program files and spec files for the Airport Challenge weekend exercise.  This exercise is the first weekend exercise as part of the 12-week Makers Academy coding mastery course.  

AUTHOR
This solution is authored by Thomas Ross.  Questions can be referred to thomasross3610@gmail.com.  This is my first stab at a solo project like this...

STRUCTURE
This solution consists of three lib files and three associated spec files.  These Lib files correspond to the three separate Ruby Classes created as part of the project.  These classes are as follows:

Airport Class - This Class contains the most code and its corresponding Spec file is therefore the largest.  The majority of the methods in this solution refer to the Airport class.  The reason for this is that the overall Airport problem is set out from the perspective of an airport, specifically an air traffic controller.  It therefore made sense that the majority of the methods would refer to actions taken to an Airport object.

Plane Class - Planes are clearly separate objects to Airports so they warrant their own object class.  There are relatively few methods for the Plane Class, however, as there was no requirement in the instructions to differentiate between types of planes.  My solution did not require any methods to be run on the planes, as opposed to just using them as variables in a method called on an Airport object.  This class could be expanded and due course as the project grows in sophistication - for example by having different types of plane (freight vs passenger) or different sizes of plane.

Weather Class - I chose to make Weather a separate class to Planes and Airports in recognition of it being a clearly separate phenomenon that required its own class object status.  The purpose of the weather class is to set the weather conditions for the aiport - in this case rather simply "stormy" or "sunny".  In the future this class could expand to encompass more complex methods related to the weather which would in turn affect other class objects as appropriate.

ROOM FOR IMPROVEMENT
- The code can no doubt be refactored more effectively to ensure it is DRY-er and more human readable.  I struggled a bit with the instance variables if I am honest.
- I tried to allow TDD to drive the development of the code as much as possible.  This was not always easy, although I think I got better towards the end.  Whilst my test coverage is high (97%), I am not convinced that I have effectively used the tests to cover all possible edge cases.
- The fluency of drafting my code is driving me TOTALLY NUTS.  I need to get faster and more competent with the syntax or this is going to be a long slog each week...
- I have some methods that seem to work well in IRB - next step is to turn these isolated methods into a functional Ruby program with some sort of user interface that doesn't require IRB jiggery-pokery.

Thank you for reading!

PS - I didn't make the plane at the top alas.
