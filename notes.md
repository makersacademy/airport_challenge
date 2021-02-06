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
