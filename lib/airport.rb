require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes_landed, :planes_in_air

  def initialize(capacity = DEFAULT_CAPACITY, planes_landed = [], planes_in_air = [])
    @capacity = capacity
    @planes_landed = planes_landed
    @planes_in_air = planes_in_air
  end

  def land(plane)
    fail 'Airport is full.' if planes_landed.length >= @capacity
    fail 'Plane already landed.' if planes_landed.include?(plane)
    @planes_landed << plane
  end

  def landed?(plane)
    planes_landed.include?(plane)
  end

  def take_off(plane)
    weather = Weather.new
    fail 'Weather is stormy' if weather.stormy == 0
    fail 'Plane already in flight.' if planes_in_air.include?(plane)
    planes_in_air << plane
  end

  def taken_off?(plane)
    planes_in_air.include?(plane)
  end
end
