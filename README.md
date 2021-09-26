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

### User Story 1
---------

### Design:

Objects  | Messages
------------- | -------------
plane    |  land(airport)
airport  |  

**Notes:**
```
I decided to give the "Plane" class a method "land" which will do something in the future, given an "airport".
```

### User Story 2
---------

### Design:

Objects  | Messages
------------- | -------------
plane    |   land(airport), takeoff, in_airport?(airport)
airport  |  

**Notes:**
```
 I've added three methods to the Plane class: "initialize", which sets an instance variable as nil, that will indicate if the plane is inside the airport or not through the "in_airport?" method. Now, both "land" and "takeoff" are able to change the status of the plane. 
```

### User Story 3
---------

### Design:

Objects  | Messages
------------- | -------------
plane    |  land(airport), takeoff, in_airport?(airport)
airport  |  full?, plane_landed

**Notes:**
```
For this User Story, I've created two methods for the "Airport" class. One ("full?") that defines, when a airport is at its full capacity, and the second one "plane_landed", that increments a counter of planes inside the airport. I've then, edited the method "land" inside the "Plane" class, to raise an error in case the airport reported full.
```

User Story 4
---------

### Design:

Objects  | Messages
------------- | -------------
plane    |  land(airport), takeoff, in_airport?(airport)
airport  |  full?, plane_landed

**Notes:**
```
I've added a parameter to the airport constructor, which sets the capacity of the airport. I've also added the possibility to raise an error, in case the method "plane_landed" is called on a full airport.
```

User Story 5
---------

### Design:

Objects  | Messages
------------- | -------------
plane    |  land(airport), takeoff, in_airport?(airport)
airport  |  full?, plane_landed
weather  |  stormy?

**Notes:**
```
In this case, since the weather was generated with a random number, the only way to test it reliably was to use an instance double and a stub. I've added a `let` and `context`, to refactor and avoid defining the subject twice.
```
User Story 6
---------

### Design:

Objects  | Messages
------------- | -------------
plane    |  land(airport), takeoff, in_airport?(airport)
airport  |  full?, plane_landed
weather  |  stormy?

**Notes:**
```
I followed the same procedure of US5, but added a little refactor in the spec file.
```
