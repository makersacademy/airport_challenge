# Airport Challenge

=================

``````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

``````

This is the first weekend challenge for Makers Academy. During the previous week, we worked on the Boris Bikes Challenge (of which I have two examples, [here](https://github.com/day-katy/Boris_Bikes) and [here](https://github.com/day-katy/Boris_Bikes2)) which helped walk us through the basics of RSpec, the benefits of TDD, and helped us become comfortable with pair programming. This Airport Challenge is a recap of what we covered in the Boris Bikes Challenge, though now we're doing in on our own, without pair programming. The point is to solidify what we've learned the week before - in this case, why TDD is a good approach to coding, how RSpec works, how to write our own RSpec tests, - and to apply them to a different, but similar, challenge.

We received the below instructions:

---

## We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

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

# Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

---

To accomplish this, I approached it in a similar way as we did the Boris Bikes Challenge. The first was to wrap my brain around what the challenge was really asking from us, which came from reading the user stories and understanding what they were really asking. To do this I wrote up some [domain models](https://github.com/day-katy/airport_challenge/blob/master/user-stories.md), and concluded that it would be important to create two new objects: airports and airplanes. To do this, I ran feature tests to create new planes and airports, and ran into my first errors:

2.7.0 :001 > airport = Airport.new
Traceback (most recent call last):
NameError (uninitialized constant Airport)
2.7.0 :002 > plane = Airplane.new
Traceback (most recent call last):
NameError (uninitialized constant Airplane)

This of course happened because I have not created the class Airport and Airplane yet.

I created Airport and Airplane spec files, where I put code that would test code I would later create for airports and airplanes.

I continued in this fashion - running unit tests, failing them, writing code that would pass them, and running feature tests to make sure they passed - for the next few domain stories.

When I completed the first four user stories, I had code that would give me a response like the below:

➜ airport_challenge git:(master) ✗ irb -r ./lib/airport.rb

2.6.5 :001 > airport = Airport.new
=> #<Airport:0x00007ffd060cb470 @airplanes=[], @capacity=20>

2.6.5 :002 > plane = Airplane.new
=> #<Airplane:0x00007ffd060d1ff0>

2.6.5 :003 > airport.land(plane)
=> [#<Airplane:0x00007ffd060d1ff0>]

I continued to work on the next user stories, wherein a plane should not be allowed to take off or land if the weather is stormy. This is where I didn't complete my code, though this bit took longer in working out how to randomize the weather - and I haven't been able to successfully test for that completely. I'm also receiving Runtime Errors on my RSpec tests, and I'm not sure why yet. Hopefully, after reviewing the code in Week 2, I'll understand more of what was happening! For now, here is what irb looks like:

➜ airport_challenge git:(master) ✗ irb -r ./lib/airport.rb
2.6.5 :001 > airport = Airport.new

=> #<Airport:0x00007ff5fb8a1878 @airplanes=[], @capacity=20, @weather=#<Weather:0x00007ff5fb8a1800>>

2.6.5 :002 > plane = Airplane.new
=> #<Airplane:0x00007ff5fb8c4490>

2.6.5 :003 > airport.land(plane)
=> [#<Airplane:0x00007ff5fb8c4490>]
