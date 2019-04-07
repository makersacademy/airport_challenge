require_relative 'weather.rb'

class Airport
  attr_reader :plane, :planes

  include Weather

  def initialize
    @planes = []
    @weather = :weather
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    raise 'Weather is too dangerous for take off.' if stormy?
    @planes.delete(plane)
  end

  def plane_counter
    :weather
    @planes.count
  end
end
