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

4. The next stage would be to incorporate whether or not a plane is in the air
or airport (flying or landed). I would of done this within the Plane class.

5. Then the final bonus task, would be relatively easy to incorporate as I have
already generated an array for the planes to live in (making it easy to add
and remove) but, I would need to use something other than .pop as it isn't
specific enough.
