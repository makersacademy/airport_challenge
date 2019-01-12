require_relative  'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane, weather)
    fail 'Turbulent weather cannot takeoff' if weather.stormy? == true
    @planes.delete(plane)
  end

  def taken_off?(plane)
    @planes.include?(plane) ? false : true

  end

end
