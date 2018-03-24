require_relative "plane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 100
  attr_accessor :capacity
  attr_accessor :hangar
  attr_accessor :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    wrong_input_type_error unless capacity.is_a?(Integer)
    negative_capacity_error if capacity.negative?
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    not_a_plane_error unless plane.is_a?(Plane)
    stormy_weather_landing_error if weather.stormy?
    airport_full_error if airport_full?
    plane_lander(plane)
  end

  def takeoff(plane = @hangar.pop)
    stormy_weather_takeoff_error if weather.stormy?
    plane_takeoff_helper(plane)
  end

  private

  # ERROR MESSAGES
  def wrong_input_type_error
    raise "The capacity specified was not a number!"
  end

  def negative_capacity_error
    raise "The capacity must be a positive number!"
  end

  def not_a_plane_error
    raise "That's not a plane! It can't land here!"
  end

  def airport_full_error
    raise "Sorry, this airport is full! Bye!"
  end

  def stormy_weather_landing_error
    raise "Cannot land in stormy weather!"
  end

  def stormy_weather_takeoff_error
    raise "Cannot take off in stormy weather!"
  end

  # HELPER METHODS
  def airport_full?
    @hangar.length >= @capacity
  end

  def plane_lander(plane)
    @hangar << plane
  end

  def plane_takeoff_helper(plane)
    @hangar.delete_if { |plane_to_takeoff| plane_to_takeoff == plane }
  end

end

=begin

[TODO] #takeoff(plane) => takes a plane from the hangar and tells it to take
off. Takes an instance of plane as an argument, but the plane must be in the
hangar.
    Tests:
    - [FAIL] Plane is removed from the hangar
    - [FAIL] Planes are not allowed to take off when the weather is stormy.
    Attempting to do so will raise an error.

=end
