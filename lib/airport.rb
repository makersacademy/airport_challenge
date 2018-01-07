require_relative 'plane'

class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise "plane cannot land due to stormy weather" if weather.storm?
    raise "the airport is currently full" if airport_full?
    @planes << plane
  end

  def take_off(plane)
    raise "plane cannot take off due to stormy weather" if weather.storm?
    raise "plane not currently at airport" unless at_airport?(plane)
    @planes.delete(plane)
    puts "#{plane} has successfully taken off"
  end

  def airport_full?
    @planes.count >= @capacity
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

end
