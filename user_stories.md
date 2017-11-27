User stories

As an **air traffic controller**
So I can get **passengers** to a **destination**
I want to instruct a **plane** to land at an **airport**

As an **air traffic controller**
So I can get **passengers** on the way to their **destination**
I want to instruct a **plane** to take off from an airport and confirm that it is no longer in the airport

As an **air traffic controller**
To **ensure safety**
I want to prevent **takeoff** when **weather** is stormy

As an **air traffic controller**
To **ensure safety**
I want to **prevent landing** when weather is stormy

As an **air traffic controller**
To **ensure safety**
I want to **prevent landing** when the **airport** is full

As the **system designer**
So that the software can be used for many different airports
I would like **a default airport capacity** that can be **overridden** as appropriate


Object       |  Message
-----------------------------------
As an ATC | I want to instruct a plane to land at an airport, so i can get passengers to a destination
As an ATC |  I want to instruct a plane to take off from an airport and confirm that it is no longer at the airport, so passengers get to destination


ATC --- instruct plane ---> land at airport
ATC --- instruct plane ---> take off from airport --- no longer plane at airport ---> deliver passengers
ATC --- instruct plane ---> not to take off if weather is stormy
ATC --- instruct plane ---> not to land if weather is stormy
ATC --- instruct plane ---> not land at airport --- if airport full
