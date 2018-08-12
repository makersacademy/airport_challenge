require_relative 'plane'
require_relative 'weather'

DEFAULT_CAPACITY = 10

class Airport
    
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
    
  def land(plane, weather = "Sunny")
    raise "Airport is full!!" if airport_full?
    raise "No landing here! way too stormy!" if weather == "Stormy"
    @planes << plane
  end

  def take_off(weather = "Sunny")
    raise "No planes to take off!!" if airport_empty?
    raise "It is too stormy! No planes taking off!" if weather == "Stormy"
    @planes.pop
  end

  private

  def airport_full?
    @planes.count >= @capacity
  end

  def airport_empty?
    @planes.count.zero? ? true : false
  end
end
