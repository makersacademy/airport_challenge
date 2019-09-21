# My Process

## 1. create Domain Model for User Story 1
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

| Object | message |
| ------ | ------ |
| Plane | |
| Airport | land(plane)|

## 2. Feature Test
```
plane = Plane.new
airport = Airport.new
airport.land(plane)
```

## Unit Test
