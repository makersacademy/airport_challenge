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


Task
-----

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
<p style="text-align:center">
<img src="https://i.gyazo.com/dbfcc22efac6400b2bc39543377501e4.png" alt="object model diagram">

**All code was tested using either London/Chicago style Test Driven Development**

<ol>

<li> Create an Airport class that will instantiate a new Airport object with 
    <ul>
        <li>An empty planes collection, acting as a hangar.</li>
        <li> The airport's maximum plane capacity. If no argument is passed DEFAULT is 10. (First argument -- Integer) </li>
        <li> Determines if the airport has stormy (bad) weather. If no argument is passed calls on Weather.new.stormy (Second argument -- Boolean)</li>
        <li>
            <b>Methods</b> 
            <br>Land: Attempts plane landing 
            <br>Takeoff: Attempts plane takeoff 
            <br>Empty?: Returns true if hangar is empty
            <br> Full?: Returns true if maximum hangar capacity is reached
            <br>Bad_weather?: Returns true if the weather is bad 
        </li>
    </ul>  
</li>
<li> Create a Weather class that will instantiate a new Weather object with 
    <ul>
        <li>A weather collection that stores :stormy or :not_stormy</li>
        <li><b>Methods</b> 
        <br>Weather_types: Samples the the weather collection
        <br>Stormy?: Checks whether the sampled value is stormy and returns boolean response </li>
    </ul>
</li>
<li> Create a Plane class that will instantiate a new Plane object with
    <ul>
        <li>The Planes flying status. If no argument is passed the default is TRUE.</li>
        <li>
            <b>Methods</b>
            <br>Flying?: Returns flying status.
            <br>Land: Attempts to land the plane
            <br>Takeoff: Attempts to takeoff the plane
        </li>
    </ul>
</li>
</ol>

