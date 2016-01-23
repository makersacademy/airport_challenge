require_relative 'plane'
require_relative './modules/weather'
require_relative './modules/errors'

class Airport
  include Errors
  attr_reader :planes

  CAPACITY = 10

  def initialize(capacity = CAPACITY)
    @capacity= capacity
    @planes = []
  end

  #encapsulated planes array
  def planes
    @planes.dup
  end

  def land(plane)
    pre_landing_checks(plane)
    plane.landed
    @planes << plane
  end

  def takeoff(plane)
    pre_takeoff_checks(plane)
    plane.fly
    @planes.reject {|p| p == plane}
    plane
  end

  private

  def pre_takeoff_checks(plane)
    stormy_error {"takeoff"} if weather_status == "stormy"
    plane_flying_error if plane.status == "flying"
    plane_exist_error unless @planes.include?(plane)
  end

  def pre_landing_checks(plane)
    full_airport_error if @planes.size > @capacity
    stormy_error {"land"} if weather_status == "stormy"
    plane_landed_error if plane.status == "landed"
  end

  def weather_status
    Weather::WEATHER.sample
  end

end
