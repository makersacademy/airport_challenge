
# Weekend Challenge 01, Airport

---

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
objects | behaviours
-|-
ATC | tell plane to land  
passengers |
airport | accept plane
plane | land
![story1](https://github.com/n3ttl3t/airport_challenge/blob/master/uml/userstory01.png)


```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
objects | behaviours
-|-
ATC |   
passengers |  
plane | take off from airport, confirm
airport |  
![story2](https://github.com/n3ttl3t/airport_challenge/blob/master/uml/userstory02.png)


```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
objects | behaviours
-|-
ATC | prevent takeoff in bad weather
weather |

![story3](https://github.com/n3ttl3t/airport_challenge/blob/master/uml/userstory03.png)


```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
objects | behaviours
-|-
ATC | prevent landing in bad weather
weather |
![story4](https://github.com/n3ttl3t/airport_challenge/blob/master/uml/userstory04.png)


```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
objects | behaviours
-|-
ATC | prevent landing in full airport
airport | is full or not
![story5](https://github.com/n3ttl3t/airport_challenge/blob/master/uml/userstory05.png)


```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
objects | behaviours
-|-
system designer | override capacity
airport | has default capacity
![story6](https://github.com/n3ttl3t/airport_challenge/blob/master/uml/userstory06.png)

---

So I've met all the user stories, but I haven't distinguished between the Air Traffic Controller and the System Designer. I have made a System Designer class but haven't used it. Maybe I am supposed to have an Air Traffic Controller class too and restrict what methods each can call on the Airport and Plane classes? I'm not sure so I'll do a pull request and see what happens.
