```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```

| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | allow_landing |
|         | confirm_landing |
| Plane   | landed?  |

```
Airport <-- allow_landing --> Plane
Plane <-- landed? --> true/false
Airport <-- confirm_landing --> Plane
```
