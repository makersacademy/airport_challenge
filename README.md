# Airport Challenge
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

##User Stories

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

* Feature test: IRB 'airport = Airport.new'

* uninitialized constant Aiport (NameError)

* created airport_spec.rb and airport.rb

* wrote start of first unit test - describe Airport do end - Failure/Error:
  describe Airport do

  
  end

NameError:
  uninitialized constant Airport

* Committed and pushed 'Created airport lib and spec files'

* created Airport class and required lib file in spec - rspec now passes as expected with 0 examples, 0 failures

* was now able to create a new Airport object in IRB, but airport.land throws up "undefined method `land'" for that object

* fleshed out first unit test, which fails as expected, so defined land method in Airport class - unit test now passes, but airport.land in IRB returns nil

* tried airport.land(plane) in IRB - "undefined local variable or method `plane'" - so update unit test with 1 argument, which throws error until I add (plane) argument to land method

* commit 'First unit test'

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)