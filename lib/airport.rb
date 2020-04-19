# understading airport object
require_relative 'plane'
class Airport
  attr_accessor :capacity, :weather
  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def takeoff(plane)
    raise 'plane is flying' if plane.status == 'flying'
    raise 'air is stormy' if stormy?
    raise 'this plane is currently in another airport' unless @planes.include?(plane)

    @planes.each do |pln|
      pln.flying
      return @planes.delete(plane)
    end
  end

  def land(plane)
    raise 'plane is in apron' if plane.status == 'taxi'
    raise 'Airport is full now' if @planes.count >= DEFAULT_CAPACITY
    raise 'air is stormy' if stormy?

    plane.taxi
    @planes << plane
  end

private
  def randomweather
    weather = ['sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'stormy']

    @weather = weather[rand(weather.length - 1)]
  end

  def stormy?
    randomweather
    @weather == 'stormy'
  end
end
