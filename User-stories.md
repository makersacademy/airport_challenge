### Story 1
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

```
nouns: air traffic controller, plane, airport
verbs: land


Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  | land
airport  |

plane  > land > airport

### Story 2
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

```
nouns: air traffic controller, plane, airport
verbs: take-off,


Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  | take-off
airport  |

plane  > take-off > airport

### Story 3
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

```
nouns: air traffic controller, weather, stormy
verbs: prevent landing,


Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  | landing
weather | stormy
airport  |

plane  > landing > airport

### Story 4
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

```
nouns: air traffic controller, weather, stormy
verbs: prevent take-off,


Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  | take-off
weather | stormy
airport  |

plane  > take-off > airport

### Story 5
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

```
nouns: air traffic controller, airport, full
verbs: prevent, landing,


Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  | landing
airport full | prevent

plane  > landing > airport
