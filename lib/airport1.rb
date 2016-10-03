require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :weather, :capacity
  def initialize(num = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = num
  end

  def land(plane)
    raise 'this plane has already landed' if plane.in_air == 'landed'
    raise 'airport is full' if planes.count >= @capacity
    raise 'This plane cannot land due to stormy weather' if weather.stormy
    @planes << plane
    plane.change_status('landed')
  end

  def take_off
    raise 'This plane cannot take_off due to stormy weather' if weather.stormy
    raise 'Airport is empty, no planes can take off' if planes.empty?
    plane = @planes.pop
    plane.change_status('flying')
  end
end
