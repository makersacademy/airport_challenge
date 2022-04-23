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
10. Repeat from step 4.

## User Stories

> As an air traffic controller
> So I can get passengers to a destination
> I want to instruct a **_plane_** to **_land_** at an **_airport_**

```
airport = Airport.new
plane = Plane.new
airport.land(plane)
```

---

> As an air traffic controller
> So I can get passengers on the way to their destination
> I want to instruct a **_plane_** to **_take off_** from an **_airport_** and **_confirm_** that it is no longer in the **_airport_**

```
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
airport.planes
```

---
