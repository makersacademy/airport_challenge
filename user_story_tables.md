```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
| Objects | Messages |
|---------|----------|
| plane |  confirm landing |
| Airport | land |
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no
longer in the airport
```
| Objects | Messages |
|---------|----------|
| Plane | confirm take_off |
| Airport | take_off |
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

| Objects | Messages |
|---------|----------|
| Weather | stormy? |
| Airport | take_off |
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

| Objects | Messages |
|---------|----------|
| Weather | stormy? |
| Airport | land |
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

| Objects | Messages |
|---------|----------|
| Airport | land |
|         | full? |
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

| Objects | Messages |
|---------|----------|
