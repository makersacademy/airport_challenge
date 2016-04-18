require_relative 'communicator'
require_relative 'weather_checker'

class Airport
  include Communicator
  include WeatherChecker

  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = "sunny"
  end

  def dock(plane)
    check_can_dock(plane)
    update_weather
    planes << plane
  end

  def undock(plane)
    check_can_undock(plane)
    planes.delete(plane)
  end

  def full?
    planes.length == capacity
  end

  private
  attr_writer :planes

  def check_can_dock(plane)
    raise "Can't dock a flying plane" if plane.flying?
    raise "Can't dock plane twice" if planes.include?(plane)
  end

  def check_can_undock(plane)
    raise "Can't undock a plane that is not here" if plane.flying?
  end

end
