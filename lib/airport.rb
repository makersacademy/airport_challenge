require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  attr_reader :weather
  attr_accessor :capacity
  DEFAULT_AIRPORT_CAPACITY = 5

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    @planes.count == DEFAULT_AIRPORT_CAPACITY ? true : false
  end

  def at_airport?(plane)
    @plane = plane
    @planes.each do |pl|
      true if @plane == pl
    end
    false
  end

  def land(plane, weather)
    @plane = plane
    @weather = weather
    raise "Plane may *not* land" if (@weather.stormy? || full?)
    @planes << plane unless at_airport?(plane)
  end

  def take_off(plane, weather)
    @plane = plane
    @weather = weather
    raise "Stormy weather - no take off allowed" if @weather.stormy?
    if at_airport?(plane)
      @planes.pop
      true
    else false
    end
  end

end
