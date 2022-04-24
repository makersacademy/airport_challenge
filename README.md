# Airport Challenge

This program allows the user to simulate a working airport, planes and necessary support

## Getting Started

```

```

## Usage

```

```

## Running Tests

```

```

## My Process

1. Fork the repo and clone it to local machine
2. Initialize README file
3. Break down user story into objects and behaviour
4. Feature test
5. Write failing test
6. Write the minimum code to make test pass
7. Check test passses
8. Refactor and check the tests still pass
9. Run feature test again and check it works as intended
10. Repeat from step 3.

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
