## #1
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
|Objects | Messages|
|---|---|
|Air Traffic Controller | |Passenger|destination|
|Airport|
|Plane|land|

- When a plane is in the air i.e. it is not at any airport, it can be instructed to land taking an airport as a parameter, something like:

  - ```ruby
    class Plane
      attr reader :location
      def land(airport)
        raise "Already landed" if @location
        airport.planes << self
        @location = airport
      end
    end
    ```

- So my code then might look something like this:

  - ```ruby
    p1 = Plane.new
    plane.land(Airport)
    ```

    - Let's test for my classes in irb

## #2

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
|Objects|Messages|
|---|---|
|Air Traffic Controller|
|Passenger|destination|
|Airport|planes|
|Plane|take_off|



## #3

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
|Objects|Messages|
|---|---|
|Air Traffic Controller| |
|Airport|check_weather|
|Weather| |
|Plane|take_off|

- So here I need to raise an error when the weather is stormy. Check weather will  create a new weather object and return it.

- Weather will set its stormy? variable randomly when initialised

  - ```ruby
    # weather.rb
    class Weather
      def is_stormy?
        (rand(5) == 0) ? true : false
      end
    end
    
    # airport.rb class Airport(weather)
    def stormy?
    	@weather.is_stormy?
    end
    
    # plane.rb Plane#take_off(airport)
    if airport.stormy?
      raise "Can't take off in stormy conditions!"
    end
    
    #plane_spec
    storm = double('weather')
    no_storm = double('weather')
    allow(storm).to receive(:is_stormy?) { true }
    allow(no_storm).to receive(:is_stormy?) { false }
    
    ```

## #4

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
|Objects|Messages|
|---|---|
|Air Traffic Controller| |
|Airport|weather|
|Plane|land|

## #5
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
|Objects|Messages|
|---|---|
|Air Traffic Controller| |
|Airport|capacity, planes|
|Plane|land|

## #6
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
|Objects|Messages|
| ---- | ---- |
|Air Traffic Controller|
|Airport|capacity|
|Plane|land|
```

```