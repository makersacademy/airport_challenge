```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

**Plane class** should have a *land* method
which can land the plane instance into an instance of the
**Airport class**

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
**Plane Class** should have a *take_off* method which should
set the instance status to flying, and the **Airport** should then remover the plane from the airport and output a list of remaining planes at the airport, along with capacity remaining.

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

**Airport Class** should have a *safe_weather* method which will
raise an error if it is too stormy to take off. I'd thought a weather class was important for this but I think I can do it with either a method or a module. If it is safe weather, the plane should execute the take_off method.

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

As above but in reverse.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

**Airport Class** instance should take a *land* method with a parameter of a plane. The land method after checking *safe_weather* should check if the airport instance is *'available?'*. If the weather is fine and the airport is available the plane should set itself to *landed* and add itself to the airport instance.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

**Airport Class** instances should be able to take a capacity from a parameter when they are initialised. If no parameter is given it should be set to the default.
