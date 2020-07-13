Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

# My Work-through

1. To begin I made a rough note of what I thought the user stories wanted,
I made a small table where I had objects and messages.

|  Object |    Messages    |
|---------|----------------|
|  Plane  | flying, landed |
|---------|----------------|
| Airport | land, takeoff, |
|         | full           |
|---------|----------------|
| Weather | stormy         |

2. I went through each user story one by one using TDD to build each method up
from the ground. The process went like:
identify what user story wants --> irb (what I would do) --> unit test (against
what I would do and what is the output) --> build method --> pass tests

3. After making the method and passing the tests, I would refactor these,
incorporating test doubles etc.

4. The next stage was to incorporate whether or not a plane is in the air
or airport (flying or landed).

5. Next I moved the stormy method into its own weather class, for separation of
things related.

6. Then the final bonus task, which I didn't do would be relatively easy to
incorporate as I have already generated an array for the planes to live in
(making it easy to add and remove). I also had a default capacity constant set
up which would of allowed for many planes to be landed.
