require "plane"
require "weather"

class Airport

  DEFAULT_CAPACITY = 100
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    raise wrong_input_type_error unless capacity.is_a?(Integer)
    raise negative_capacity_error if capacity < 0
    @capacity = capacity
  end

  private

  def wrong_input_type_error
    "The capacity specified was not a number!"
  end

  def negative_capacity_error
    "The capacity must be a positive number!"
  end


end

=begin
[FINISHED] #initialize => Runs when Airport.new is called. Creates a new airport. Takes
one argument which sets the capacity of the airports hangar. If no arguments are
given DEFAULT_CAPACITY is used to set capacity.
    Tests:
    - [PASS] Airport.new creates an airport with a @hangar with a capacity of
    DEFAULT_CAPACITY.
    - [PASS] If an argument is provided then the @capacity of @hangar will be set
    to that number.
    - [PASS] Entering anything other than a positive integer for capacity
    will raise an error.

[TODO] #land(plane) => takes a plane instance as an argument and tells it
to land at the airport.
    Tests:
    - [FAIL] Plane needs to appear in the airport's @hangar (array).
    - [FAIL] If airport is full (@hangar.length >= @capacity) an exception needs
    to be raised. @capacity is set at init or to DEFAULT_CAPACITY.
    - [FAIL] Planes are not allowed to land when the weather is stormy. Attempting
    to land when stormy will raise an error.

[TODO] #takeoff(plane) => takes a plane from the hangar and tells it to take
off. Takes an instance of plane as an argument, but the plane must be in the hangar.
    Tests:
    - [FAIL] Plane is removed from the hangar
    - [FAIL] Planes are not allowed to take off when the weather is stormy.
    Attempting to do so will raise an error.

=end
