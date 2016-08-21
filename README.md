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

Overview
---
Welcome to my airport simulation! Here planes can land in and take_off from airports, but not when Zeus is angry. The Domain Model below summarises the main objects and messages they can respond to. For more User Stories and other detail on the below Tests, refer to instructions.md

You can have a play in irb, simply:
* Clone this repo
* run `gem install bundle`
* run `bundle`

Or scroll down to see an example irb play

Code lives in ./lib
Tests in ./spec

Domain Model
---------

Objects | Messages     | Attributes
 --------|------------ | ---
 Planes  | plane? |   
 Airport | full?, in_airport?, land, take_off,| capacity, planes
 Weather | zeus (rand), stormy? |


- [ ] write my own README.md

Tests
------

airport_spec
- [x] is stormy when zeus decides (from shared example weather_spec)
- [x] is not stormy when zeus decides (from shared example weather_spec)
- [x] stops planes taking off when stormy (from shared example weather_spec)
- [x] has planes take off
- [x] does not accept planes when full
- [x] allows controller to override default capacity
- [x] can harbour planes
- [x] can check whether a plane is harboured
- [x] only lets a plane harbour once

plane_spec
- [x]  only allows plane objects to be passed into methods

- [ ] edge case: loads of planes are landed at once but storms happen per landing not per instance of airport. thus error when doing 20 landings is not related to capacity but to weather, incorrectly

Example IRB play
---
```
Tams-Air:airport_challenge tamborine$ irb --simple-prompt
>> require './lib/airport'
=> true
>> airport = Airport.new
=> #<Airport:0x007fabca869a70 @planes=[], @capacity=20>
>> plane1 = Plane.new
=> #<Plane:0x007fabca861820>
>> plane2 = Plane.new
=> #<Plane:0x007fabca853720>
>> airport.land(plane1)
RuntimeError: stormy day, no flying
	from /Users/tamborine/Documents/projects/airport_challenge/lib/airport.rb:25:in `land'
	from (irb):5
	from /Users/tamborine/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
>> airport.land(plane1)
RuntimeError: stormy day, no flying
	from /Users/tamborine/Documents/projects/airport_challenge/lib/airport.rb:25:in `land'
	from (irb):6
	from /Users/tamborine/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
>> airport.land(plane1)
=> [#<Plane:0x007fabca861820>]
>> airport.land(plane1)
RuntimeError: plane already landed
	from /Users/tamborine/Documents/projects/airport_challenge/lib/airport.rb:23:in `land'
	from (irb):8
	from /Users/tamborine/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
>> airport.land(plane2)
=> [#<Plane:0x007fabca861820>, #<Plane:0x007fabca853720>]
>>
?> airport.take_off
=> #<Plane:0x007fabca853720>
>> airport.in_airport?(plane2)
=> false
>> airport.in_airport?(plane1)
=> true
>> 25.times do airport.land(Plane.new) end
RuntimeError: stormy day, no flying
	from /Users/tamborine/Documents/projects/airport_challenge/lib/airport.rb:25:in `land'
	from (irb):14:in `block in irb_binding'
	from (irb):14:in `times'
	from (irb):14
	from /Users/tamborine/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
  ```
