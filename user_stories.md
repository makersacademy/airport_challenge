# User Stories and Domain Models

## Step 1
```
As an air traffic controller,
So I can get passengers to a destination,
I want to instruct a plane to land at an airport.
```
| Objects | Messages |
| ------- | -------- |
| ATC | |
| plane | land at an airport |

```
As an air traffic controller,
So I can get passengers on the wait to their destination,
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport.
```
| Objects | Messages |
| ------- | -------- |
| ATC | |
| plane | take_off at an airport|
| plane | confirm take_off |

```
AS an air traffic controller,
To ensure safety,
I want to prevent landing when the airport is full.
```
| Objects | Messages |
| ------- | -------- |
| ATC | |
| plane | don't land if airport.full?|
| airport | full? |

```
As the system designer,
So that the software can be used for many different airports,
I would like a default airport capacity that can be overridden as appropriate.
```
| Objects | Messages |
| ------- | -------- |
| system designer | |
| airport | DEFAULT_CAPACITY |
| airport | capacity = int or DEFAULT_CAPACITY |

```
As an air traffic controller,
To ensure safety,
I want to prevent takeoff when weather is stormy.
```
| Objects | Messages |
| ------- | -------- |
| ATC | |
| weather | stormy? |
| plane | don't take off |

```
As an air traffic controller,
To ensure safety,
I want to prevent landing when weather is stormy.
```
| Objects | Messages |
| ------- | -------- |
| ATC | |
| weather | stormy? |
| plane | don't land |
