require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail 'Plane cannot land due to bad weather' if stormy?

    planes << plane
    "Cleared to land"
  end

  def take_off
    fail 'Planes are grounded due to bad weather' if stormy?

    planes.pop
    'Cleared for take off'
  end

  WEATHER = [:sunny, :stormy, :sunny, :sunny, :sunny]

  def stormy?
    @weather.condition == WEATHER.sample
  end
end
