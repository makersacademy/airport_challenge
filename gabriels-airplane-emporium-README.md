# Gabriel's Airplane Emporium
### aka Week 1 weekend challenge.

## Features:

## Airport:
Can do all kinds of cool stuff like landing and takeoffing planes. Except when the weather is shitty. Then it can't do those things because people might die. We don't want that at our airports.

### Current Features:
\#initialize => Runs when Airport.new is called. Creates a new airport. Takes
one argument which sets the capacity of the airports hangar. If no arguments are
given DEFAULT_CAPACITY is used to set capacity. DEFAULT_CAPACITY is set to 100.
    Notes:
    * Airport.new creates an airport with a @hangar with a capacity of DEFAULT_CAPACITY.
    * If an argument is provided then the @capacity of @hangar will be set to that number.
    * Entering anything other than a positive integer for capacity will raise an error.

    Examples:
    ```
    our_airport = Airport.new
    our_airport.capacity # => 100, also known as DEFAULT_CAPACITY

    other_airport = Airport.new(50)
    other_airport.capacity # => 50
    ```

### Future Features:

TBA
