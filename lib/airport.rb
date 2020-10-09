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
    airport_full
    stormy_weather
    already_in_airport(plane)
    wrong_airport(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    stormy_weather
    plane_not_present(plane)
    plane = @planes.select { |flight| flight == plane }
    plane[0].flying
    plane[0]
  end

  private

  def plane_not_present(plane)
    raise "Plane not in airport." unless @planes.include?(plane)
  end

  def already_in_airport(plane)
    raise "Plane already in airport." if @planes.include?(plane)
  end

  def stormy_weather
    raise "Alert! Stormy weather!" if weather_report == "stormy"
  end

  def wrong_airport(plane)
    raise "Plane in a different airport." if plane.in_airport?
  end

  def airport_full
    raise "This airport is full." if full?
  end

  def full?
    @planes.size >= @capacity
  end
end
