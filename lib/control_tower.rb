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

  # def weather_report
  #   number = [1, 2].sample
  #   @weather = 'stormy' if number == 1
  #   @weather = 'clear' if number == 2
  #   @weather
  # end

  def storm?
    storm=WEATHER_REPORT.new
    @weather=storm.report
  end

  def land(plane)
    return 'NO' if @planes.include? plane
    return 'NO' if @weather == 'stormy'
    return 'AT CAPACITY' if full?
    return 'NO' if plane.flying == false
    @planes << plane
  end

  def take_off(plane)
    return 'NO' if @weather == 'stormy'
    return 'NO' if plane.flying == true
    @planes.pop if @planes.count > 0
  end

  def full?
    return true if @planes.count==DEFAULT_CAPACITY
  end
end
