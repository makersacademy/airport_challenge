require_relative "plane"

class Airport

  def initialize(capacity = 50)
    @weather = "sunny"
    @capacity = capacity
    @planes = []
  end

  def set_weather(weather)
    @weather = weather
  end

  def prevent_take_off
    fail 'Take-off not permitted due to stormy weather. Await for further instructions!' if stormy?
    fail 'Error! No plane to take-off!' if empty?
    plane = planes.pop
    plane.take_off
  end

  def prevent_landing(plane)
    fail 'Landing not permitted due to stormy weather. Await for further instructions!' if stormy?
    fail 'Landing not permitted - airport full. Await for further instructions!' if full?
    planes << plane
    plane.land
  end

private

attr_reader :planes
  def empty?
    @planes.empty?
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather == "stormy"
  end
end
