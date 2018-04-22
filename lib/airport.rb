require './lib/weather.rb'

class Airport

  attr_accessor :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_lands(plane, weather = Weather.new)
    check_errors_land(plane, weather)
    plane.land if can_it_land(plane, weather)
    @planes << plane if can_it_land(plane, weather)
  end

  def plane_take_off(plane, weather = Weather.new)
    check_errors_take_off(plane, weather)
    plane.take_off if can_it_take_off(plane, weather)
    @planes.delete(plane) if can_it_take_off(plane, weather)
  end

  def check_errors_land(plane, weather = Weather.new)
    raise "Plane is already landed in airport!" if planes.include? plane
    raise "Can't land: Bad weather conditions!" if weather.condition < 10
    raise "Can't land: Airport is full!" unless planes.count < 2
  end

  def check_errors_take_off(plane, weather = Weather.new)
    raise "Plane is not landed in this airport!" unless planes.include? plane
    raise "Can't take off: Bad weather conditions!" if weather.condition < 10
  end

  def can_it_land(plane, weather)
    (weather.condition > 10) && (planes.count < 2)
  end

  def can_it_take_off(plane, weather)
    weather.condition > 10
  end
end
