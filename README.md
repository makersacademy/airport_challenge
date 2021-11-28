# Airport challenge

This is a weekend challenge from Makers Academy week 1. It simulates an airport with random weather which can store, take off, and land planes. Airports are initialised with a weather value (which is random), and stormy weather prevents planes from taking off and landing.

# Using the app

```
git clone https://github.com/ConorButler/airport_challenge.git
cd airport_challenge
bundle
rspec
```

## Set up in irb (REPL)

```
irb
require './lib/weather'
require './lib/plane'
require './lib/airport'
airport200 = Airport.new(200)
plane = Plane.new
```

Planes start not in any particular airport, so you must land them to store them in one:

```
airport200.land(plane)
airport200.planes
airport200.take_off(plane)
```

# Tests

![Tests](https://i.gyazo.com/44a4de0bc5112c24054f80a60a104769.png)

## My Approach

My approach to this challenge was to prevent as many edge cases as possible. Planes can be stored in each airport in the respective **planes** array, but I felt that checking if the plane object is in the current airports planes would not be enough. For example you could **.land** a plane which is at airport 3000 at airport 2000, because it's not in airport 2000s hangar.

To prevent this I used a **current_airport** attribute for the **Plane** class. Prior to this, the plane objects didn't store any information because they didn't need to. This attribute allows you specifically see where a plane currently is, and allows for more detailed error messages. All planes start with no airport (nil). I could have used the object ID but I think this way is more readable and simulates a real airport better - you would always know which airport you were referring to with airport_id, whereas object IDs will be random each time.

## Doubles

Due to the progress we made in the pairing challenge this week, I wanted to test my knowledge of mocks in Rspec by utilising doubles. I only tested each class in isolation, which meant that I had to mock every **Plane** object when I was testing the **Airport** class, which was where the majority of the methods were.

This caused many challenges because of the **current_airport** attribute and how it had to be updated every time a plane lands or takes off. I had to frequently use stubs to tell the plane doubles to expect this message and update it accordingly, as well as ensuring the test was testing what I wanted it to. It was quite the challenge but I learned a lot about mocks and feel more confident going into week 2.

Retroactively, I used the good_weather and bad_weather functions to mock the new dependency-injected weather. I would have passed a weather double as a paramater when creating each test airport, but Rspec doesn't allow you to use doubles outside of it blocks.
