# README_CW.md

This document outlines my approach to solving the Airport Challenge.

Firstly I Converted the given user stories into domain models:

## Domain Models

### User Story 1

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

**Domain Model:**
|**Objects**|**Messages**|
|-----------|------------|
|Plane      |        |
|Airport    |land          |

Complete: -[x]

### User Story 2

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm it is no longer at the Airport
```

**Domain Model:**
|**Objects**|**Messages**|
|-----------|------------|
|Plane      |    |
|Airport    |takeoff and confirm departure |

Complete: [x]

### User Story 3

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

**Domain Model:**
|**Objects**|**Messages**|
|-----------|------------|
|Plane      |            |
|Airport    |full?       |

Complete: [x]

### User Story 4

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

**Domain Model:**
|**Objects**|**Messages**|
|-----------|------------|
|Airport   |capacity            |

Complete: [x]

### User Story 5

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when the weather is stormy
```

**Domain Model:**
|**Objects**|**Messages**|
|-----------|------------|
|Airport   |stormy?     |

Complete: [x]

### User Story 6

```
As an air traffic controller
To ensure safety
I want to prevent landing when the weather is stormy
```

**Domain Model:**
|**Objects**|**Messages**|
|-----------|------------|
|Airport  |stormy?     |

Complete: [x]

## Test Driven Development of the User Stories
Having drafted the domain models, I stepped through each user story in turn. Firstly scripting a feature test, then a unit test, and then scripting to pass the unit test accordingly. Refactoring where necessary.

Testing for the random stormy weather user stories required stubs.

## Edge Cases
Once the user stories were complete, I revisited the requirements, and implemented tests to cover edge cases, and scripted code to pass the tests.

## Final Refactoring
Finally refactor of the code, ensuring Single Responsibility Principle.

## Style Checking
Checked style of the code using Rubocop.
