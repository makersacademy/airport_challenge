## User Stories & Object Model

#### Land

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

Object | Messages
------------------------------- | ---------------------------------------
controller | 
passenger | 
plane | 
airport | land_plane


#### Take-off

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport
and confirm that it is no longer in the airport
```

Object | Messages
------------------------------- | ---------------------------------------
controller | 
passenger | 
plane | 
airport | land_plane
airport | launch_plane


#### Prevent take-off

```
As an air traffic controller 
To ensure safety 
I want to prevent take-off when weather is stormy 
```

Object | Messages
------------------------------- | ---------------------------------------
controller | 
passenger | 
plane | 
airport | land_plane
airport | launch_plane
airport | is_stormy?

1. is_stormy? should be a method
2. is_stormy? method returns false
3. Prevents launch_plane if is_stormy? is true (guard condition)
4. Allows launch_plane if is_stormy? is false
5. Provide an input for is_stormy? to be able to return true


#### Prevent landing in stormy weather

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Object | Messages
------------------------------- | ---------------------------------------
controller | 
passenger | 
plane | 
airport | land_plane
airport | launch_plane
airport | is_stormy?


#### Prevent landing when airport is full

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

Object | Messages
------------------------------- | ---------------------------------------
controller | 
passenger | 
plane | 
airport | land_plane
airport | launch_plane
airport | prevent_take_off
airport | prevent_landing
airport | is_full?
weather | is_stormy?


#### Airport capacity

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Object | Messages
------------------------------- | ---------------------------------------
controller | 
passenger | 
plane | 
airport | land_plane
airport | launch_plane
airport | prevent_take_off
airport | prevent_landing
airport | is_full?
airport | set_capacity
weather | is_stormy?
