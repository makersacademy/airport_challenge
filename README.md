# Airport Challenge

In this challenge, we had a request from a client to write the software to control
the flow of planes at an airport. The planes can land and take off provided that
the weather is sunny. Occasionally it may be stormy, in which case no planes can
land or take off.

## Approach to solve the Challenge

### BDD:
        The challenge was solved using a BDD approach. The failing feature tests
        were written first, followed by failing unit tests which were passed with
        an implementation and then feature tests were run again to ensure that the implementation solved the problem as required.
      ```
         [2] pry(main)> require './lib/airport'
                => true
         [3] pry(main)> airport = Airport.new
                => #<Airport:0x007feb9112ae88
                @capacity=10,
                @planes=[],
                @weather=#<Weather:0x007feb9112ac30>>
         [4] pry(main)> plane = Plane.new
                => #<Plane:0x007feb91881970>
         [5] pry(main)> airport.land(plane)
                => true
         [6] pry(main)> plane.landed?
                => true
         [7] pry(main)> airport.take_off(plane)
                => true
         [8] pry(main)> plane.taken_off?
                => true
        ```
        example of a passing feature test.

### SRP
      All methods were writing with a view of the single responsibility principle.
### Issues
      Attempts to override random weather behaviour using test doubles and method stubs
      proved to be unsuccessful. The syntax provided within the rspec documentation
      also proved to be ineffective.
