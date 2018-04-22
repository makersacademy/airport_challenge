require './lib/weather.rb'

class Airport

  attr_reader :planes
  attr_reader :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    check_errors_land(plane)
    plane.land unless it_cannot_land
    planes << plane unless it_cannot_land
  end

  def take_off(plane)
    check_errors_take_off(plane)
    plane.take_off unless it_cannot_take_off
    planes.delete(plane) unless it_cannot_take_off
  end

  def check_errors_land(plane)
    raise "Plane is already landed in this airport!" if planes.include? plane
    raise "Can't land: Bad weather conditions!" if weather.stormy?
    raise "Can't land: Airport is full!" unless planes.count < 2
  end

  def check_errors_take_off(plane)
    raise "Plane is not landed in this airport!" unless planes.include? plane
    raise "Can't take off: Bad weather conditions!" if weather.stormy?
  end

  def it_cannot_land
    weather.stormy? || planes.count >= capacity
  end

  def it_cannot_take_off
    weather.stormy?
  end
end
