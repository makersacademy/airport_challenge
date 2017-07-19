require_relative 'weather'

class Airport
  CAPACITY = 20

  def initialize(weather = Weather.new, planes = [], capacity = CAPACITY)
    @planes = planes
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "You cannot land the same plane" if planes.include?(plane)
    raise "The weather is too stormy for landing" if @weather.stormy?
    raise "Landing is not permitted as airport has reached capacity" if self.full?
    planes << plane
    plane.land!
    plane
  end

  def take_off(plane)
    raise "The plane has already taken off" unless planes.include?(plane)
    raise "The weather is too stormy for take_off" if @weather.stormy?
    planes.reject! { |p| p == plane }
    plane.take_off!
    planes
  end

  def full?
    planes.count == @capacity
  end

  private

  attr_accessor :planes

end
