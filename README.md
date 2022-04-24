# Airport Challenge

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

[![Coverage](https://lukestorey95.github.io/airport_challenge/blob/main/badge.svg)](https://github.com/lukestorey95/airport_challenge)

[![Ruby](https://badgen.net/badge/icon/ruby?icon=ruby&label)](https://www.ruby-lang.org/)

This program allows the user to simulate a working airport. Planes are able to land and take off from an airport so long as the weather isn't stormy.

<br>

## Installation

```
$ git clone https://github.com/lukestorey95/airport_challenge.git

$ cd airport_challenge

$ bundle
```

<br>

## Quickstart

```
irb

> Dir['./lib/*.rb'].each {|file| require file }

> airport = Airport.new
> plane = Plane.new

> airport.land(plane)

> airport.take_off(plane)
```

> For more usage please see user stories below

<br>

## Running Tests

```
$ rspec
```

<br>

## My Process

1. Break down user story into objects and behaviour
2. Feature test and note down errors/expected errors
3. Write failing test that replicates errors
4. Write the minimum code to make test pass
5. Refactor and ensure tests still pass
6. Repeat step 2 and ensure behaviour works as intended

<br>

## User Stories

> I want to instruct a **_plane_** to **_land_** at an **_airport_**

```
airport = Airport.new
plane = Plane.new
airport.land(plane)
```

---

> I want to instruct a **_plane_** to **_take off_** from an **_airport_** and **_confirm_** that it is no longer in the **_airport_**

```
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
airport.planes
```

---

> I want to **_prevent landing_** when the **_airport_** is **_full_**

```
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.land(plane)
```

---

> I would like a **_default airport capacity_** that can **_be overridden_** as appropriate

```
airport = Airport.new(3)
plane = Plane.new
airport.capacity.times { airport.land(plane) }
airport.land(plane)
```

---

> I want to **_prevent takeoff_** when **_weather_** is stormy

```
airport = Airport.new
plane = Plane.new
weather = Weather.new
airport.land(plane)
airport.take_off(plane)
#=> should raise error if weather is stormy
```

---

> I want to **_prevent landing_** when **_weather_** is stormy

```
airport = Airport.new
plane = Plane.new
weather = Weather.new
airport.land(plane)
#=> should raise error if weather is stormy
```

<br>

## Edge Cases

> I want to **_prevent_** a **_plane_** from **_taking off_**, if it is not in the correct **_airport_**

```
airport = Airport.new
plane = Plane.new
airport.take_off(plane)
#=> should raise error
```

> I want to **_prevent_** a **_landed plane_** from **_landing_** again

```
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.land(plane)
#=> should raise error
```

> I want to **_prevent_** a **_flying plane_** from **_taking off_** again

```
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
airport.take_off(plane)
#=> should raise error
```
