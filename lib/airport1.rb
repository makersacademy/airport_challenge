require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  DEFAULT_CAPACITY = 10

  def initialize(num = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = num
  end

  attr_reader :planes, :weather, :capacity

  def land(plane)
    raise 'This plane cannot land due to stormy weather' if weather.stormy?
    raise 'this plane has already landed' unless plane.in_air
    raise 'airport is full' if planes.count >= @capacity
    plane.landed?
    @planes << plane
  end

  def take_off
    raise 'This plane cannot take_off due to stormy weather' if weather.stormy?
    raise 'Airport is empty, no planes can take off' if planes.empty?
    plane = @planes.pop
    plane.taken_off?
    puts "#{plane} has successfully landed"
  end
end
