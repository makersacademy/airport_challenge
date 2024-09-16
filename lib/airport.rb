require_relative 'plane'
require_relative 'weather' 

class Airport
  attr_reader :capacity, :hangar

  def initialize(capacity)
    @capacity = capacity
    @hangar = [Plane.new]

  end

  def safe_landing
    @plane = Plane.new
    weather = Weather.new
    if weather.stormy == true
      (fail 'unsafe conditions')
    else
      (@plane.land)
    end
    @hangar.push(@plane)
  end

  def safe_takeoff
    weather = Weather.new
    @plane = @hangar.pop
    if weather.stormy == true
      (fail 'unsafe conditions')
    else
      (@plane.take_off)
    end
  end
end