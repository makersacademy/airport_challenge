require_relative "plane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 100
  attr_accessor :capacity
  attr_accessor :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    raise wrong_input_type_error unless capacity.is_a?(Integer)
    raise negative_capacity_error if capacity.negative?
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise not_a_plane_error unless plane.is_a?(Plane)
    raise airport_full_error if airport_full?
    plane_lander(plane)
  end

  private

  # ERROR MESSAGES
  def wrong_input_type_error
    "The capacity specified was not a number!"
  end

  def negative_capacity_error
    "The capacity must be a positive number!"
  end

  def not_a_plane_error
    "That's not a plane! It can't land here!"
  end

  def airport_full_error
    "Sorry, this airport is full! Bye!"
  end

  # HELPER METHODS
  def airport_full?
    @hangar.length >= @capacity
  end

  def plane_lander(plane)
    @hangar << plane
  end

end

=begin

[TODO] `land(plane)` => takes a plane instance as an argument and tells it
to land at the airport.
Tests:
* Plane needs to appear in the airport's `@hangar`.
* Only instances of the `Plane` class can be landed. Attempting to land anything
else raises the error (`not_a_plane_error`).
* Attempting to land a plane at a full airport will raise `airport_full_error`.
    - [FAIL] Planes are not allowed to land when the weather is stormy.
    Attempting to land when stormy will raise an error.

[TODO] #takeoff(plane) => takes a plane from the hangar and tells it to take
off. Takes an instance of plane as an argument, but the plane must be in the
hangar.
    Tests:
    - [FAIL] Plane is removed from the hangar
    - [FAIL] Planes are not allowed to take off when the weather is stormy.
    Attempting to do so will raise an error.

=end
