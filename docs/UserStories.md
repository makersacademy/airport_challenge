# Airport Challenge
## v.0.1

### Story 01

| Objects | Messages |
| ---- | ---- |
| ATC |  |
| airport | land(plane) |
| plane | status: landed @ airport |

### Story 02

| Objects | Messages |
| ---- | ---- |
| ATC |  |
| airport | takeoff(plane) |
| plane | status: in-flight |

### Story 03

| Objects | Messages | Conditions |
| ---- | ---- | ---- |
| ATC |  |  |
| weather | stormy? |  |
| airport | takeoff(plane) exception | weather.stormy? |

### Story 04

| Objects | Messages | Conditions |
| ---- | ---- | ---- |
| ATC |  |  |
| weather | stormy? |  |
| airport | land(plane) exception | weather.stormy? |

### Story 05

| Objects | Messages | Conditions |
| ---- | ---- | ---- |
| ATC |  |  |
| airport | full? |  |
| airport | land(plane) exception | airport.full? |

### Story 06

| Objects | Messages | Conditions |
| ---- | ---- | ---- |
| System Designer |  |  |
| airport | initialize with default capacity | unless custom capacity given |

### Story 07: EC-01, inconsistent takeoff

| Objects | Messages | Conditions |
| ---- | ---- | ---- |
| ATC |  |  |
| airport | takeoff(plane) exception | plane not at given airport |

### Story 08: EC-02, inconsistent plane status

| Objects | Messages | Conditions |
| ---- | ---- | ---- |
| ATC |  |  |
| plane | takeoff(plane) exception; cannot be at airport | status: in-flight |

### Story 09: EC-03, inconsistent plane status

| Objects | Messages | Conditions |
| ---- | ---- | ---- |
| ATC |  |  |
| plane | land(plane) exception; must be at airport | status: landed |


airport -- land -- plane
airport -- takeoff -- plane
plane -- status -- airport
weather -- stormy?
airport -- full?
