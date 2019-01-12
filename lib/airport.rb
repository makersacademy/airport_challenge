require_relative  'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes, :weather, :capacity

  def initialize (capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    fail 'Turbulent weather cannot land' if weather.stormy? == true
    fail 'Airport full cannot land' if @planes.count >= capacity
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
