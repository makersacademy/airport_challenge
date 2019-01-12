
# User Stories

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

air traffic controller <-> land <-> plane
air traffic controller <-> land <-> airport
```

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

air traffic controller <-> take off <-> plane
air traffic controller <-> check <-> airport
```

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

air traffic controller <-> check weather <-> airport
air traffic controller <-> block take off <-> plane
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

air traffic controller <-> check weather <-> airport
air traffic controller <-> block landing <-> plane
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

air traffic controller <-> check planes <-> airport
air traffic controller <-> block landing <-> plane
```

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

system designer <-> set default <-> airport
```
# AirTrafficControl v Airport
On my first commit, I attempted to use the SecretDiary example of cohesion to
separate the responsibilities of air traffic controller from airport. However,
on second thought that feels too pre-emptive for TDD, as i realise the first
line of a user story only implicates the context under which you're looking to
interact with the objects, not the objects to be implemented.

# Cohesion
```
takeoff                
land

block landing         set default
block take off

check weather
check planes
```
