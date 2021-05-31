## Airport Challenge notes

> As an air traffic controller
>
> So I can get passengers to a destination
>
> I want to instruct a plane to land at an airport

| Object  | Method |
| ------  | ------ |
| Plane   |        |
| Airport | Land   |

> As an air traffic controller
>
> So I can get passengers on the way to their destination
>
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

| Object  | Method   |
| ------  | -------- |
| Plane   |          |
| Airport | takeoff  |

_Note: language used here is ambiguous - not clear who is confirming that the plane is no longer in the airport (does plane/pilot confirm when airborne or does controller confirm by checking the airport). Will work on the assumption that it is the second of these_

> As an air traffic controller
>
> To ensure safety
>
> I want to prevent landing when the airport is full

| Object  | Method        |
| ------  | ------------- |
| Airport | airport_full  |

> As the system designer
>
> So that the software can be used for many different airports
>
> I would like a default airport capacity that can be overridden as appropriate

| Object  | Method           |
| ------  | ---------------- |
| Airport | default_capacity |
|         | change_capacity  |

> As an air traffic controller
>
> To ensure safety
>
> I want to prevent takeoff when weather is stormy

| Object  | Method |
| ------  | ------ |
| Airport | closed |
|  |   |

> As an air traffic controller
>
> To ensure safety
>
> I want to prevent landing when weather is stormy

| Object  | Method |
| ------  | ------ |
|   |        |
|  |   |
