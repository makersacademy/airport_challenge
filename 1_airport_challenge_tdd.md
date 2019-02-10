# TDD Process

## Contents

1. [Domain Model](#1-domain-model)
2. [Feature Tests](#2-feature-testing-with-pry)  
    * [instruct a plane to land at an airport](#instruct-a-plane-to-land-at-an-airport)  
    * [instruct a plane to take off from an airport and confirm that it is no longer in the airport](#instruct-a-plane-to-take-off-from-an-airport-and-confirm-that-it-is-no-longer-in-the-airport)
    * [prevent takeoff when weather is stormy](#prevent-takeoff-when-weather-is-stormy)
    * [prevent landing when weather is stormy](#prevent-landing-when-weather-is-stormy)
    * [prevent landing when the airport is full](#prevent-landing-when-the-airport-is-full)
    * [default airport capacity can be overridden](#default-airport-capacity-can-be-overridden)

## 1. Domain Model

|Object    |Message
|----------|-------
|Passenger | destination
|Plane     | location, land, take_off
|Weather   | stormy?
|Airport   | location, full?, capacity

## 2. Feature testing with `pry`

#### _instruct a plane to land at an airport:_

In terminal, launch `pry`

```pry

1] pry(main)> plane.land(airport)
NameError: undefined local variable or method `plane' for main:Object
from (pry):1:in `__pry__'


```

Create **plane.rb**: `touch lib/plane.rb`

In **plane.rb**, define `Plane` class so that the variable `plane` can be assigned a `Plane` object (an instance of the `Plane` class):

```ruby

class Plane
end


```

Back in `pry`:

```pry

[1] pry(main)> require_relative "plane"
=> true
[2] pry(main)> plane = Plane.new
=> #<Plane:0x00007fc2f81a0cf8>
[3] pry(main)> plane.land(airport)
NameError: undefined local variable or method `airport' for main:Object
from (pry):3:in `__pry__'


```

Create **airport.rb**: `touch lib/airport.rb`

In **airport.rb**, define `Airport` class so that the variable `airport` can be assigned an `Airport` object (an instance of the `Airport` class):

```ruby

class Airport
end


```

Back in `pry`:

```pry

[1] pry(main)> require_relative "plane"
=> true
[2] pry(main)> require_relative "airport"
=> true
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007fc637092d10>
[4] pry(main)> airport = Airport.new
=> #<Airport:0x00007fc6370a8098>
[5] pry(main)> plane.land(airport)
NoMethodError: undefined method `land' for #<Plane:0x00007fc637092d10>
from (pry):5:in `__pry__'


```

In **plane.rb**, define the method `land`:  

```ruby

class Plane
  def land(airport)
  end
end


```

Test in `pry`:

```pry

[1] pry(main)> require_relative "airport"
=> true
[2] pry(main)> require_relative "plane"
=> true
[3] pry(main)> airport = Airport.new
=> #<Airport:0x00007ff893039da8>
[4] pry(main)> plane = Plane.new
=> #<Plane:0x00007ff89086f3b8>
[5] pry(main)> plane.land(airport)
=> nil


```

#### _instruct a plane to take off from an airport and confirm that it is no longer in the airport_

```pry

[1] pry(main)> require_relative "airport"
=> true
[2] pry(main)> require_relative "plane"
=> true
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007ff7301d5770>
[4] pry(main)> airport = Airport.new
=> #<Airport:0x00007ff72eeb4308>
[5] pry(main)> plane.take_off(airport)
NoMethodError: undefined method `take_off' for #<Plane:0x00007ff7301d5770>
from (pry):5:in `__pry__'


```

In **plane.rb**, define method `take_off`:

```ruby

class Plane
  def land(airport)
  
  end

  def take_off(airport)
  
  end
end


```

In `pry`:

```pry

[1] pry(main)> require_relative "airport"
=> true
[2] pry(main)> require_relative "plane"
=> true
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007f88e94dd360>
[4] pry(main)> airport = Airport.new
=> #<Airport:0x00007f88e94fea38>
[5] pry(main)> plane.take_off(airport)
=> nil
[6] pry(main)> airport.has?(plane) == false
NoMethodError: undefined method `has?' for #<Airport:0x00007f88e94fea38>


```

In **airport.rb**, define method `has?`:

```ruby

class Airport
  def has? (plane)

  end
end


```

Back to `pry`:

```pry

[1] pry(main)> require_relative "plane"
=> true
[2] pry(main)> require_relative "airport"
=> true
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007fe10e7686c0>
[4] pry(main)> airport = Airport.new
=> #<Airport:0x00007fe1113b9d50>
[5] pry(main)> plane.take_off(airport)
=> nil
[6] pry(main)> airport.has?(plane)
=> nil


```

User story expects `airport.has?(plane)` to return `false`. For now, hard-code it in `airport.rb`:

```ruby

class Airport
  def has? (plane)
    false
  end
end


```

Done:

```pry

[1] pry(main)> require_relative "airport"
=> true
[2] pry(main)> require_relative "plane"
=> true
[3] pry(main)> airport = Airport.new
=> #<Airport:0x00007fe77a9abf28>
[4] pry(main)> plane = Plane.new
=> #<Plane:0x00007fe779251490>
[5] pry(main)> plane.take_off(airport)
=> nil
[6] pry(main)> airport.has?(plane)
=> false

```

#### _prevent takeoff when weather is stormy_

  i.e. only take off if weather is not stormy

```pry

[1] pry(main)> plane.take_off(airport) if !weather.stormy?
NameError: undefined local variable or method `weather' for main:Object
from (pry):1:in `__pry__'


```

Create **weather.rb**: `touch lib/weather.rb`

In **weather.rb**, define `Weather` class so that the variable `weather` can be assigned a `Weather` object (an instance of the `Weather` class):

```ruby

class Weather
  STORMY_NUMBERS = [0]
  def stormy?
    random_number = rand(3)
    puts "DEBUG-TEXT: stormy if random_number == 0"
    puts "DEBUG-TEXT: random_number is #{random_number}"
    STORMY_NUMBERS.include?(random_number) ? true : false
  end
end


```

```pry

[1] pry(main)> require_relative "lib/airport"
=> true
[2] pry(main)> require_relative "lib/plane"
=> true
[3] pry(main)> require_relative "lib/weather"
=> true
[4] pry(main)> weather = Weather.new
=> #<Weather:0x00007fd409571608>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x00007fd40958b238>
[6] pry(main)> airport = Airport.new
=> #<Airport:0x00007fd40bc98c40>
[7] pry(main)> plane.take_off(airport) if !weather.stormy?
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 2
=> nil
[8] pry(main)> plane.take_off(airport) if !weather.stormy?
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 1
=> nil
[9] pry(main)> plane.take_off(airport) if !weather.stormy?
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 0
=> nil


```

In **plane.rb**, `take_off` needs to respond to the result of `stormy?`:

```ruby

class Plane
  def land(airport)

  end

  def take_off(airport, stormy)
    if stormy
      puts "Take-off aborted. "
    else

    end
  end
end


```

Done:

```pry

# pry lines 1-6, test setup (requires and object instantiations), omitted for brevity

[7] pry(main)> plane.take_off(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 2
=> nil
[8] pry(main)> plane.take_off(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 1
=> nil
[9] pry(main)> plane.take_off(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 0
Take-off aborted.
=> nil


```

#### _prevent landing when weather is stormy_

```pry

[1] pry(main)> require_relative "lib/airport"
=> true
[2] pry(main)> require_relative "lib/plane"
=> true
[3] pry(main)> require_relative "lib/weather"
=> true
[4] pry(main)> weather = Weather.new
=> #<Weather:0x00007fdf76980140>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x00007fdf7505dd48>
[6] pry(main)> airport = Airport.new
=> #<Airport:0x00007fdf7699b9b8>
[7] pry(main)> plane.land(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 1
ArgumentError: wrong number of arguments (given 2, expected 1)
from /Users/student/weekend_challenges/wk1/airport_challenge/lib/plane.rb:2:in `land'


```

In **plane.rb**: with respect to `stormy?`, the methods `land` and `take_off` work the same way. So change it to accept weather and copy over the if-statement.

```ruby

class Plane
  def land(airport, stormy)
     if stormy
       puts "Landing aborted. "
     else
  
     end
  end

  def take_off(airport, stormy)
    if stormy
      puts "Take-off aborted. "
    else
  
    end
  end
end


```

Done:

```pry

# pry lines 1-6, test setup (requires and object instantiations), omitted for brevity

[7] pry(main)> plane.land(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 2
=> nil
[8] pry(main)> plane.land(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 2
=> nil
[9] pry(main)> plane.land(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 2
=> nil
[10] pry(main)> plane.land(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 0
Landing aborted.
=> nil


```

#### _prevent landing when airport is full_

Already know how to prevent landing. The new part is knowing when the airport is full. Start from there:

```pry

[1] pry(main)> require_relative "lib/airport"
=> true
[2] pry(main)> require_relative "lib/plane"
=> true
[3] pry(main)> require_relative "lib/weather"
=> true
[4] pry(main)> weather = Weather.new
=> #<Weather:0x00007fb2af04a470>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x00007fb2ad150df8>
[6] pry(main)> airport = Airport.new
=> #<Airport:0x00007fb2ad1899f0>
[7] pry(main)> airport.full?
NoMethodError: undefined method `full?' for #<Airport:0x00007fb2ad1899f0>
from (pry):7:in `__pry__'


```

In **airport.rb**, begin defining the method `full?` - user story expects this to return `true` so for now we hard-code that:

```ruby

class Airport
  def has?(plane)
    false
  end

  def full?
    true
  end
end

```

Now returns `true` instead of `NoMethodError`:

```pry

pry(main)> airport.full?
=> true

```

`land` method in `plane.rb` amended to behave appropriately to `airport.full?`

```ruby

def land(airport, stormy)
  if stormy && airport.full?
    puts "Landing aborted: Stormy and Airport full"
  elsif stormy
    puts "Landing aborted: Stormy."
  elsif airport.full?
    puts "Landing aborted: Airport full."
  else
    # TODO: Plane allowed to land
  end  
end

```

And done:

```pry

# omitted for brevity: requires and instantiations, test setup

[7] pry(main)> airport.full?
=> true

[8] pry(main)> plane.land(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 2
Landing aborted: Airport full.
=> nil

[9] pry(main)> plane.land(airport, weather.stormy?)
DEBUG-TEXT: stormy if random_number == 0
DEBUG-TEXT: random_number is 0
Landing aborted: Stormy and Airport full
=> nil

```

#### *default airport capacity can be overridden*

```pry

[1] pry(main)> require_relative "lib/airport"
=> true
[2] pry(main)> require_relative "lib/plane"
=> true
[3] pry(main)> require_relative "lib/weather"
=> true
[4] pry(main)> weather = Weather.new
=> #<Weather:0x00007fd372374c48>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x00007fd372392810>
[6] pry(main)> airport = Airport.new
=> #<Airport:0x00007fd36f8101b0>
[7] pry(main)> airport.capacity
NoMethodError: undefined method `capacity' for #<Airport:0x00007fd36f8101b0>
from (pry):7:in `__pry__'


```

In **airport.rb**: define `capacity` variable for the `Airport` objects, and give it a default value. Define `attr_accessor` to allow access to this variable

```ruby

class Airport

  attr_accessor :capacity

  def initialize(capacity = 10)
    @capacity = capacity
  end

  def has?(plane)
    false
  end

  def full?
    true
  end
end


```

```pry

[1] pry(main)> require_relative "lib/airport"
=> true
[2] pry(main)> require_relative "lib/plane"
=> true
[3] pry(main)> require_relative "lib/weather"
=> true
[4] pry(main)> weather = Weather.new
=> #<Weather:0x00007fd4b46f4858>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x00007fd4b52e2458>
[6] pry(main)> airport = Airport.new
=> #<Airport:0x00007fd4b5221bb8 @capacity=10>


```

Unless specified when calling `Airport.new`, the new `Airport` object has a default capacity of 10. This can be changed after object creation:

```pry

[7] pry(main)> airport.capacity = 15
=> 15
[8] pry(main)> airport.capacity
=> 15

```

Alternatively, if capacity is specified when calling `Airport.new`, the new `Airport` created with the specified capacity:

```pry

[9] pry(main)> big_airport = Airport.new(30)
=> #<Airport:0x00007fd533ebcac0 @capacity=30>
[10] pry(main)> big_airport.capacity
=> 30

```