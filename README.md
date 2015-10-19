Airport Challenge
=================

One of our clients has requested us to design and develop software which will help in managing planes at an airport. Here is a summary of the requirement:

a) Air traffic controller should be able to

  instruct an incoming plane to land, provided

    weather is not stormy
    airport has spare landing space (airport not full)

  instruct a plane to take off, provided
    weather is not stormy
    So that all planes land and take off safely, the air traffic controller will make sure that

      a plane takes off from the airport where it is located currently

      check plane's status
        allow those planes with status 'flying' to land,
        allow those planes with status 'landed' to take off

b) Plane should report their status

  as flying
  as landed

c) Airports should have following

  default airport capacity and can be overridden

I plan to start rspec test first and then on to code with above specs.

Will, update README as I make further progress

PS - Sorry for the delay, as was extremely tied up with some personal matter

I have been having rspec erros when testing raise_error.  Have attached the errors below.  I also have added irb output of testing the code.  This is after the errors below.

===============================================================================
rspec errors  (They probably are due to version issue). Will seek help tomorrow
===============================================================================

[rajeevhejib:...y/wc-wk01/airport_challenge]$ rspec                                                                      (master✱)
[Coveralls] Set up the SimpleCov formatter.
[Coveralls] Using SimpleCov's default settings.

Airport
  should respond to #land with 1 argument
  should respond to #take_off
  has a default capacity
  plane cannot land as airport capacity is full (FAILED - 1)
  plane cannot land as weather now is stormy (FAILED - 2)
  plane cannot take off as weather now is stormy (FAILED - 3)

Plane
  should respond to #log with 1 argument
  should respond to #unlog
  already at the airport (FAILED - 4)
  already flying

Failures:

  1) Airport plane cannot land as airport capacity is full
     Failure/Error: expect{subject.land(plane)}.to raise_error("Cannot land, capacity full")
       expected Exception with "Cannot land, capacity full", got #<RSpec::Mocks::MockExpectationError: Double :plane received unexpected message :log with (#<Airport:0x007ffa61eb9700 @planes=[], @capacity=1>)> with backtrace:
         # ./lib/airport.rb:15:in `land'
         # ./spec/airport_spec.rb:15:in `block (3 levels) in <top (required)>'
         # ./spec/airport_spec.rb:15:in `block (2 levels) in <top (required)>'
     # ./spec/airport_spec.rb:15:in `block (2 levels) in <top (required)>'

  2) Airport plane cannot land as weather now is stormy
     Failure/Error: expect{subject.land(plane)}.to raise_error("Cannot land, weather is stormy")
       expected Exception with "Cannot land, weather is stormy", got #<RSpec::Mocks::MockExpectationError: Double :plane received unexpected message :log with (#<Airport:0x007ffa61ec30c0 @planes=[], @capacity=1>)> with backtrace:
         # ./lib/airport.rb:15:in `land'
         # ./spec/airport_spec.rb:19:in `block (3 levels) in <top (required)>'
         # ./spec/airport_spec.rb:19:in `block (2 levels) in <top (required)>'
     # ./spec/airport_spec.rb:19:in `block (2 levels) in <top (required)>'

  3) Airport plane cannot take off as weather now is stormy
     Failure/Error: expect{subject.take_off(plane)}.to raise_error("Cannot take off, weather is stormy")
       expected Exception with "Cannot take off, weather is stormy", got #<RuntimeError: No planes to take off> with backtrace:
         # ./lib/airport.rb:21:in `take_off'
         # ./spec/airport_spec.rb:23:in `block (3 levels) in <top (required)>'
         # ./spec/airport_spec.rb:23:in `block (2 levels) in <top (required)>'
     # ./spec/airport_spec.rb:23:in `block (2 levels) in <top (required)>'

  4) Plane already at the airport
     Failure/Error: expect {subject.log airport }.to raise_error("Plane already at airport")
       expected Exception with "Plane already at airport" but nothing was raised
     # ./spec/plane_spec.rb:11:in `block (2 levels) in <top (required)>'

Finished in 0.00518 seconds (files took 0.2302 seconds to load)
10 examples, 4 failures

Failed examples:

rspec ./spec/airport_spec.rb:14 # Airport plane cannot land as airport capacity is full
rspec ./spec/airport_spec.rb:18 # Airport plane cannot land as weather now is stormy
rspec ./spec/airport_spec.rb:22 # Airport plane cannot take off as weather now is stormy
rspec ./spec/plane_spec.rb:10 # Plane already at the airport

[Coveralls] Outside the CI environment, not sending data.
[rajeevhejib:...y/wc-wk01/airport_challenge]$



===============================================================================
IRB output
===============================================================================
2.2.3 :001 >
2.2.3 :002 >
2.2.3 :003 >   a1=Airport.new
 => #<Airport:0x007f8a31039478 @planes=[], @capacity=1>
2.2.3 :004 > a2=Airport.new(2)
 => #<Airport:0x007f8a31028cb8 @planes=[], @capacity=2>
2.2.3 :005 > p1=Plane.new
 => #<Plane:0x007f8a3101a898 @status="Flying">
2.2.3 :006 > p2=Plane.new
 => #<Plane:0x007f8a308a7110 @status="Flying">
2.2.3 :007 > p3=Plane.new
 => #<Plane:0x007f8a3089e858 @status="Flying">
2.2.3 :008 > p4=Plane.new
 => #<Plane:0x007f8a308964f0 @status="Flying">
2.2.3 :009 >
2.2.3 :010 >
2.2.3 :011 >   a1.land(p1)
 => [#<Plane:0x007f8a3101a898 @status="Not Flying", @where=#<Airport:0x007f8a31039478 @planes=[...], @capacity=1>>]
2.2.3 :012 > a1.land(p2)
RuntimeError: Cannot land, capacity full
	from /Users/rajeevhejib/Projects/MakersAcademy/wc-wk01/airport_challenge/lib/airport.rb:13:in `land'
	from (irb):12
	from /Users/rajeevhejib/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :013 >
2.2.3 :014 >
2.2.3 :015 >   a2.land(p2)
 => [#<Plane:0x007f8a308a7110 @status="Not Flying", @where=#<Airport:0x007f8a31028cb8 @planes=[...], @capacity=2>>]
2.2.3 :016 > a2.land(p3)
 => [#<Plane:0x007f8a308a7110 @status="Not Flying", @where=#<Airport:0x007f8a31028cb8 @planes=[...], @capacity=2>>, #<Plane:0x007f8a3089e858 @status="Not Flying", @where=#<Airport:0x007f8a31028cb8 @planes=[...], @capacity=2>>]
2.2.3 :017 > a2.land(p4)
RuntimeError: Cannot land, capacity full
	from /Users/rajeevhejib/Projects/MakersAcademy/wc-wk01/airport_challenge/lib/airport.rb:13:in `land'
	from (irb):17
	from /Users/rajeevhejib/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :018 >
2.2.3 :019 >   a1.land(p2)
RuntimeError: Cannot land, capacity full
	from /Users/rajeevhejib/Projects/MakersAcademy/wc-wk01/airport_challenge/lib/airport.rb:13:in `land'
	from (irb):19
	from /Users/rajeevhejib/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :020 > a2.land(p1)
RuntimeError: Cannot land, capacity full
	from /Users/rajeevhejib/Projects/MakersAcademy/wc-wk01/airport_challenge/lib/airport.rb:13:in `land'
	from (irb):20
	from /Users/rajeevhejib/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :021 >
2.2.3 :022 >   a2.take_off(p3)
 => #<Plane:0x007f8a3089e858 @status="Flying", @where="In Air">
2.2.3 :023 >
2.2.3 :024 >
2.2.3 :025 >   a2.land(p1)
RuntimeError: Plane already at airport
	from /Users/rajeevhejib/Projects/MakersAcademy/wc-wk01/airport_challenge/lib/plane.rb:10:in `log'
	from /Users/rajeevhejib/Projects/MakersAcademy/wc-wk01/airport_challenge/lib/airport.rb:15:in `land'
	from (irb):25
	from /Users/rajeevhejib/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :026 > a2.take_off(p1)
RuntimeError: this plane not at this airport
	from /Users/rajeevhejib/Projects/MakersAcademy/wc-wk01/airport_challenge/lib/airport.rb:22:in `take_off'
	from (irb):26
	from /Users/rajeevhejib/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :027 >
