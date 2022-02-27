require_relative 'plane'

class Airport
  DEFAULT_TAKE_OFF_MESSAGE = 'The plane has left the airport'.freeze
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= DEFAULT_CAPACITY
    raise 'Plane unable to land due to stormy weather' if stormy?
    @planes << plane
    plane
  end

  def take_off(plane)
    fail 'Plane unable to take off due to stormy weather' if stormy?
    @planes.delete(plane)
    DEFAULT_TAKE_OFF_MESSAGE
  end

  def weather
    rand(1..100) == 1 ? 'stormy' : 'sunny'
  end

  private

  def stormy?
    weather == 'stormy'
  end
end
