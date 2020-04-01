require "./lib/plane"
require "./lib/weather"

class Airport

  attr_reader :planes, :capacity

  DEFALTCAPACITY = 20

  def initialize(capacity = DEFALTCAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather = Weather.new)
    raise "There is no space avaliable!" if full?
    raise "This plane has already landed" if plane.landed?
    raise "You cannot land there is currently a storm" if weather.stormy?

    plane.land
    @planes << plane
  end

  def take_off(plane, weather = Weather.new)
    raise "There are currently no planes ready for take off" if empty?
    raise "This plane is not in this airport" unless present?(plane)
    raise "You cannot take off there is currently a storm" if weather.stormy?

    plane.take_off
    @planes.delete(plane)
  end

  private

  def empty?
    @planes.count < 1
  end

  def full?
    @planes.count >= capacity
  end

  def present?(plane)
    @planes.include?(plane)
  end

end
