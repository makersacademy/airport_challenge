require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :weather, :airport_apron

  DEFAULT_CAPACITY = 3

  def initialize(weather)
    @weather = weather
    @airport_apron = []
  end

  def land(plane)
    raise "it is stormy" if weather.stormy?

    raise "airport apron is full" if airport_apron.size >= DEFAULT_CAPACITY

    airport_apron << plane
  end

  def take_off
    raise "it is stormy" if weather.stormy?

    taking_off_plane = airport_apron.shift
    taking_off_plane.taken_off?
    taking_off_plane
  end
end
