Elsie Ashworth, 24/08/19
Notes made during my work on this project:

airport_challenge README.md:
Steps:
1. Fork this repo, and clone to your local machine
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle

After running bundle, it fetched and installed various gems.
Final part of output:
=>
Post-install message from rubocop:
Rails cops will be removed from RuboCop 0.72. Use the `rubocop-rails` gem instead.

Put this in your `Gemfile`.

```rb
gem 'rubocop-rails'
```

And then execute:

```sh
$ bundle install
```

Put this into your `.rubocop.yml`.

```yaml
require: rubocop-rails
```

I edited the above files accordingly.
Further info on rubocop here:
https://rubocop.readthedocs.io/en/latest/cops_bundler/

4. Complete the following task:
See README.md

Questions arising:

What is a module? Research:
  An instance of the Module class
  Contains behaviour, not state.
  Can be included in a class.
  Include in two or more classes that share the same behaviour.
What is a stub?
Read docs re test doubles.
What other edge cases will I test for?
Stretch goal:
Instead of using irb, put feature tests in feature_spec.rb in spec directory.

Progress notes:
When I changed into the airport_challenge directory, I saw this message:
Required ruby-2.6.0 is not installed.
To install do: 'rvm install "ruby-2.6.0"'
So I ran the above command to install ruby 2.6.0.

User story 1:

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
Objects: ATC, plane, airport.
Method: #land_a_plane

Domain model:
Airport <-- land_a_plane --> a Plane.

User story 2:
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport...

Objects: ATC, plane, airport.
Methods: #plane_take_off
Domain model for taking off:
Airport <-- plane_take_off --> a Plane.

...and confirm that it is no longer in the airport

So I need:
The ability to remember landed planes (state)
The ability to report landed planes (behaviour)
Modified domain model:
Airport <-- land_a_plane --> a Plane
where the plane is assigned to @plane, an instance variable of airport,
to represent whether the airport contains a plane.

Confirming whether a plane is in the airport: feature test in irb:
Does Airport.new.plane return nil? Because @plane == nil
Does Airport.new.take_off_plane.plane return nil? Because @plane == nil
Does Airport.new.land_a_plane(Plane.new).plane return a plane? # @plane = plane

2.6.0 :001 > require './lib/airport.rb'
 => true
2.6.0 :002 > airport = Airport.new
 => #<Airport:0x00007ff161160260>
2.6.0 :003 > airport.plane
 => nil
2.6.0 :004 > airport.take_off_plane
 => #<Plane:0x00007ff16111ac88>
2.6.0 :005 > airport.plane
 => nil
2.6.0 :006 > plane = airport.take_off_plane
 => #<Plane:0x00007ff16180a3b8>
2.6.0 :007 > airport.plane
 => nil
2.6.0 :008 > airport.land_a_plane(plane)
 => #<Plane:0x00007ff16180a3b8>
2.6.0 :009 > airport.plane
 => #<Plane:0x00007ff16180a3b8>

Edge cases provided in the challenge:
Your code should defend against edge cases
such as inconsistent states of the system ensuring that
1. planes can only take off from airports they are in;
2. planes that are already flying cannot take off and/or be in an airport;
3. planes that are landed cannot land again and must be in an airport,
etc.

My notes:
Need to confirm that plane is not in the airport unless it has landed.
Need to add plane to the airport's state as it lands.
Need to confirm that plane is in the airport if it has landed.
Plane cannot land if it is already in airport.
Need to confirm that plane is in the airport before it can take off.
Need to remove plane from the airport's state as it takes off.

Implementing edge cases:
1. Planes can only take off from airports they are in:
Assuming an airport capacity of 1 plane:
Check whether there is a plane in the airport before allowing take-off:
take_off_plane needs to check that @plane != nil before allowing take-off,
and raise an error if the airport is empty.

Feature test:
2.6.0 :001 > require './lib/airport.rb'
 => true
2.6.0 :002 > airport = Airport.new
 => #<Airport:0x00007fa3e5191578>
2.6.0 :003 > airport.plane
 => nil
2.6.0 :004 > airport.take_off_plane
Traceback (most recent call last):
        5: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):4
        1: from /Users/Contrabando2/Documents/Coding/MA_course/Wk1/airport_challenge/lib/airport.rb:11:in `take_off_plane'
RuntimeError (Unable to take off: plane not in airport)
2.6.0 :005 > airport.land_a_plane(Plane.new)
 => #<Plane:0x00007fa3e5819c88>
2.6.0 :006 > airport.plane
 => #<Plane:0x00007fa3e5819c88>
2.6.0 :007 > airport.take_off_plane
 => #<Plane:0x00007fa3e524e8d0>
2.6.0 :008 > airport.take_off_plane
 => #<Plane:0x00007fa3e50fefe8>

The feature test shows that as soon as there has been a landing (@plane != nil),
it's possible to take off more than one plane (infinite planes).
Need to check whether the actual plane that will be taking off
is in the airport
before allowing take-off:

Should an airport:

Start empty, or
Start containing a plane?
Assume the airport starts empty.
This assumption implies that we'll need to change our earlier user story
regarding the take_off_plane method
to ensure that there is a plane to use for the first take-off.
Feature test:

2.6.0 :001 > require './lib/airport.rb'
 => true
2.6.0 :002 > airport = Airport.new
 => #<Airport:0x00007f8c4220d660>
2.6.0 :003 > airport.plane
 => nil
2.6.0 :004 > airport.take_off_plane
Traceback (most recent call last):
        5: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):4
        1: from /Users/Contrabando2/Documents/Coding/MA_course/Wk1/airport_challenge/lib/airport.rb:11:in `take_off_plane'
RuntimeError (Unable to take off: plane not in airport)
2.6.0 :005 > airport.land_a_plane(Plane.new)
 => #<Plane:0x00007f8c4222e3b0>
2.6.0 :006 > airport.plane
 => #<Plane:0x00007f8c4222e3b0>
2.6.0 :007 > airport.take_off_plane
 => #<Plane:0x00007f8c4222e3b0>
2.6.0 :008 > airport.take_off_plane
 => #<Plane:0x00007f8c4222e3b0>
2.6.0 :009 >

The above feature test shows that we can take off the same plane twice in a row.
What about confirming that it is no longer in the airport?

Working feature test:
2.6.0 :001 > require './lib/airport.rb'
 => true
2.6.0 :002 > airport = Airport.new
 => #<Airport:0x00007f80aa06be18>
2.6.0 :003 > airport.plane
 => nil
2.6.0 :004 > airport.land_a_plane(Plane.new)
 => #<Plane:0x00007f80a90f6cf8>
2.6.0 :005 > airport.plane
 => #<Plane:0x00007f80a90f6cf8>
2.6.0 :006 > airport.take_off_plane
 => #<Plane:0x00007f80a90f6cf8>
2.6.0 :007 > airport.plane
 => nil
2.6.0 :008 > airport.take_off_plane
Traceback (most recent call last):
        5: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):8
        1: from /Users/Contrabando2/Documents/Coding/MA_course/Wk1/airport_challenge/lib/airport.rb:11:in `take_off_plane'
RuntimeError (Unable to take off: no planes available)

Can I land the same plane twice in a row, without taking off in between?
Feature test:
2.6.0 :010 > airport.plane
 => nil
2.6.0 :011 > airport.land_a_plane(plane2)
 => #<Plane:0x00007f80a90f73b0>
2.6.0 :012 > airport.plane
 => #<Plane:0x00007f80a90f73b0>
2.6.0 :013 > airport.land_a_plane(plane2)
 => #<Plane:0x00007f80a90f73b0>
2.6.0 :014 > airport.plane
 => #<Plane:0x00007f80a90f73b0>

The same plane can land multiple times without taking off in between.
Write unit test:
 expect that land_a_plane will raise_error if plane already in airport.
Write code to pass test.

Working feature test:
2.6.0 :001 > require './lib/airport.rb'
 => true
2.6.0 :002 > airport = Airport.new
 => #<Airport:0x00007f86141300f0>
2.6.0 :003 > airport.plane
 => nil
2.6.0 :004 > plane = Plane.new
 => #<Plane:0x00007f8614100c88>
2.6.0 :005 > airport.land_a_plane(plane)
 => #<Plane:0x00007f8614100c88>
2.6.0 :006 > airport.plane
 => #<Plane:0x00007f8614100c88>
2.6.0 :007 > airport.land_a_plane(plane)
Traceback (most recent call last):
        5: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/Contrabando2/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):7
        1: from /Users/Contrabando2/Documents/Coding/MA_course/Wk1/airport_challenge/lib/airport.rb:7:in `land_a_plane'
RuntimeError (Unable to land: plane already in airport.)

User story 3:
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

Additional instructions/resources:
You will need to use a random number generator to set the weather
(it is normally sunny but on rare occasions it may be stormy).
In your tests, you'll need to use a stub
to override random weather to ensure consistent test behaviour.
For overriding random weather behaviour,
please read the documentation to learn how to use test doubles:
https://www.relishapp.com/rspec/rspec-mocks/docs .
There’s an example of using a test double
to test a die that’s relevant to testing random weather in the test.
