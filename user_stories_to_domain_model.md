## User Story

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy
```

### The nouns in the User Stories

As an **air traffic controller** 
So I can get **passengers** to a **destination** 
I want to instruct a **plane** to land at an **airport**

As an **air traffic controller** 
So I can get **passengers** on the way to their **destination** 
I want to instruct a **plane** to take off from an **airport** and confirm that it is no longer in the airport

As an **air traffic controller**
To ensure safety 
I want to prevent landing when the **airport** is full 

As the **system designer**
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an **air traffic controller** 
To ensure safety 
I want to prevent takeoff when **weather** is stormy 

As an **air traffic controller** 
To ensure safety 
I want to prevent landing when **weather** is stormy

### The verbs in the User Stories

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to **land** at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to **take off** from an airport and **confirm that it is no longer in the airport**

As an air traffic controller 
To ensure safety 
I want to **prevent landing** when the airport **is full** 

As the system designer
So that the software can be used for many different airports
I would like a **default airport capacity** that can be **overridden** as appropriate

As an air traffic controller 
To ensure safety 
I want to **prevent takeoff** when weather **is stormy** 

As an air traffic controller 
To ensure safety 
I want to **prevent landing** when weather **is stormy**

### Organise the nouns and verbs into Objects and Messages

Objects  | Messages
------------- | -------------
Air traffic controller | 
Passengers  | 
Destination |
Plane | land, take-off, at_airport?
Airport | full?
System designer | 
Weather | is_stormy?

### Diagram to show how our Objects will use Messages to communicate with one another

```
Plane <-- land  --> true/false
Plane <-- take-off  --> true/false
Plane <-- at_airport? --> true/false
Airport <-- full? --> true/false
Weather <-- is_stormy? --> true/false
```
