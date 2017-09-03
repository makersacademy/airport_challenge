require_relative 'plane'
require_relative 'weather_report'

class CONTROL_TOWER
  attr_accessor :capacity, :airport
  attr_reader :weather, :planes

  DEFAULT_CAPACITY = 50

  def initialize(airport='Heathrow')
    @airport = airport
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def storm?
    storm=WEATHER_REPORT.new
    @weather=storm.report
  end

  def land(plane)
    return 'NO' if @planes.include? plane
    return 'NO' if @weather == 'stormy'
    return 'AT CAPACITY' if full?
    return 'NO' if plane.flying == false
    plane.landed(@airport)
    @planes << plane
  end

  def take_off(plane)
    return 'NO' if @weather == 'stormy'
    return 'NO' if plane.flying == true
    plane.take_off(@airport)
    @planes.pop if @planes.count > 0
  end

  def full?
    return true if @planes.count==DEFAULT_CAPACITY
  end
end
