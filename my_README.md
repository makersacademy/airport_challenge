## Natasha's Airport Challenge Readme ##

## How to Use
```shell
irb -r './lib/airport.rb'
```

## Example irb transcript
```shell
$ irb
2.6.5 :001 > airport = Airport.new
 => #<Airport:0x00007fd16f0adc08 @hangar=[], @capacity=10, @weather=#<Weather:0x00007fd16f0adb68>>
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007fd16f0b4e18>
2.6.5 :003 > airport.land(plane)
Plane landed
 => [#<Plane:0x00007fd16f0b4e18 @landed=true>]
2.6.5 :004 > plane2 = Plane.new
 => #<Plane:0x00007fd16f0ce638>
2.6.5 :005 > airport.land(plane2)
Plane landed
 => [#<Plane:0x00007fd16f0b4e18 @landed=true>, #<Plane:0x00007fd16f0ce638 @landed=true>]
2.6.5 :006 > airport.take_off(plane)
Plane departed
 => #<Plane:0x00007fd16f0b4e18 @landed=false>
2.6.5 :007 > airport.take_off(plane2)
Traceback (most recent call last):
        5: from /Users/natashamcintyre/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/natashamcintyre/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/natashamcintyre/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):7
        1: from /Users/natashamcintyre/Projects/weekend-challenges/airport_challenge/lib/airport.rb:28:in `take_off'
RuntimeError (Take off aborted due to stormy weather)
```

## My approach to the airport challenge
Perform the following steps for each user story:
1. Draw a diagram modelling the user story
2. Write a feature test in irb to test the story from the user's perspective
3. Write an rspec test to drive the development
4. Write code to pass the test
5. Check rspec, irb, rubocop. Fix any issues.
6. Commit and push

Some user stories contained quite a lot, such as user story 4. The system designer has requested a default capacity that can be overridden. I first updated the tests then the code to allow for more than one plane (ie an array). Next I added a default capacity (arbitrarily chose the number 10 since no default capacity was provided). After this I updated it appropriately to allow it to be overridden.

After passing all rspec tests, I noticed with further irb testing that I needed to update the fail if airport full method to take the capacity of the airport (as opposed to the default capacity). After this, I also noticed that I needed to update the take_off method to allow for 2 things:
1. Only one plane now needs to be removed from the hangar.
2. This plane must already be in the airport.
3. This plane should be removed from wherever it is in the hangar.

Reflecting on my code, I have spotted poor SRP - the land and take_off methods are both evaluating the status of the hangar and landing / removing the plane. I created a full? and a present? method to evaluate these.

User stories 5 and 6. For these, when do we want the weather to be "created" (ie in this case, when do we want the random number to be generated)?
Options: 1) when airport is created by system designer. 2) when air traffic controller wants to land/send off a plane?
Considerations: User stories state air traffic controller. Weather changes so not good to initialize when airport is created.
Decision: When planes are instructed to land and take_off

After a fair bit of research into mocks and stubs, I eventually created set stormy to false in an initial subject, and a contextual subject for stormy weather. This then broke when I tried to make the weather method private so I have omitted the privacy for now (I have left a commented out private where I would have done this.)
