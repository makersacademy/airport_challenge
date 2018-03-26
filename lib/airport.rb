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
    plane_at_other_airport_error unless plane.flying?
    stormy_weather_landing_error if weather.stormy?
    airport_full_error if airport_full?
    plane_lander(plane)
  end

  def takeoff(plane)
    not_a_plane_error unless plane.is_a?(Plane)
    plane_not_here_error unless @hangar.include?(plane)
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
    raise "That's not a plane!"
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

  # This error is redundant since trying to takeoff a plane that isn't at the
  # airport raises an error also.
  # def plane_flying_error
  #   raise "This plane is flying already!"
  # end

  def plane_at_other_airport_error
    raise "This plane is already landed at another airport!"
  end

  def plane_not_here_error
    raise "That plane is not at this airport!"
  end

  # HELPER METHODS
  def airport_full?
    @hangar.length >= @capacity
  end

  def plane_lander(plane)
    @hangar << plane
    plane.airborne = false
  end

  def plane_takeoff_helper(plane)
    @hangar.delete_if { |plane_to_takeoff| plane_to_takeoff == plane }
    plane.airborne = true
  end

end
