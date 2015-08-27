require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :planes
  attr_accessor :capacity

  def initialize(weather)
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = weather
  end

  def request_landing plane
    if @weather.weather_report == "stormy"
      raise "You can not land!  The weather is stormy!"
    elsif over_capacity?
      raise "Airport at capacity!  You can not land here!"
    else
      land_plane plane
    end
  end

  def request_take_off
    if @weather.weather_report == "stormy"
      raise "You can not take off!  The weather is stormy!"
    elsif no_planes_available?
      raise "There are currently no planes ready for take off."
    else
      release_plane
    end
  end

  private

  def land_plane plane
    plane.land
    planes.push(plane)
    plane
  end

  def release_plane
    plane = planes.pop
    plane.fly
    plane
  end

  def over_capacity?
    planes.count >= capacity
  end

  def no_planes_available?
    planes.empty?
  end
end
