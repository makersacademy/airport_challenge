
# Airport Challenge

## How To Use:

Load in IRB (or your REPL of choice!), and begin by creating a new plane:

```plane = Plane.new```

From here, you can take off (unless it is stormy):

```plane.take_off```

You can use the following commands to check the plane's location and status throughout:

```plane.status```
```plane.location```

Once you have taken off, you can land at your destination, and pick up new passengers:

```plane.land_at_destination```

Repeat until it's stormy!


## Domain Models

After reading through the user stories, it struck me that the user itself is not an object, but rather has certain requirements for different objects. Here is where I began:

### Air Traffic Controller
Object | Action
------ | ------
Plane | take_off, confirm_location
Airport | full?, land
Weather | stormy?

### System Designer
Object | Action
------ | ------
Airport | Overwrite default capacity

---

## The Process:

After creating the domain models, I began using TDD to create an airport class. Once it became obvious that I needed to create the Weather class and Plane class in order to test my Airport class–– I switched my focus toward developing those classes.

I didn't run into any big problems with this project until it was time to use a stub in my test, but after a lot of research–– I was able to implement it in my code.

The next difficulty was that I had forgotten that each plane starts with a new Airport as a destination and a new Airport as a location. Because of that, I had to use a stub for each of these occurances in my tests to ensure that an error would not be raised unless expected.





