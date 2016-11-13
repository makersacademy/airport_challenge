require_relative 'plane'
require_relative 'weather'

class AirportController

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land_plane(plane)
    raise "The airport is full!" if airport_full?
    raise "This plane has already landed!" if plane_in_airport?(plane)
    @weather = Weather.new
    plane.report_landing
    @planes << plane
  end

  def plane_in_airport?(plane)
    @planes.include?(plane)
  end

  def airport_full?
    return true if @planes.count >= @capacity
    false
  end

  def take_off_plane
    raise "There are no planes in the airport" if @planes.empty?
    @planes.pop
  end

  def check_weather
    Weather.new
  end



end
