require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "This airport is full." if full?

    raise "Stormy weather, landing not possible." if weather_report == "stormy"

    raise "Plane already in airport." if already_landed(plane)

    raise "Plane in another airport." if plane.in_airport?

    plane.landed
    @planes << plane
  end

  def take_off(plane)
    raise "Stormy weather, take-off not possible." if weather_report == "stormy"

    raise "Plane not in airport." unless @planes.include?(plane)

    plane = @planes.select { |flight| flight == plane }
    plane[0].flying
    plane[0]
  end

  private

  def already_landed(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.size >= @capacity
  end
end
