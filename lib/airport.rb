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

  def takeoff
    raise 'air is stormy' if stormy?
    raise 'no airplane at airport' if @planes == []

    @planes.each_with_index do |plane, index|
      plane.flying?
      return @planes.delete_at(index)
    end
  end

  def land(plane)
    raise 'plane is in apron' if plane.status == 'taxi'
    raise 'Airport is full now' if @planes.count >= DEFAULT_CAPACITY
    raise 'air is stormy' if stormy?

    plane.taxi?
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
