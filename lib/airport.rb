require_relative 'plane'
require 'pry'
class Airport
  attr_reader :stored_planes

  def initialize(weather_generator)
    @stored_planes = []
    @weather_generator = weather_generator
  end

  def receive_plane(plane)
    @stored_planes << plane unless stormy?
  end

  def release_plane(plane)
    @stored_planes.delete(plane) unless stormy?
  end

  def stormy?
    weather = @weather_generator.generate_weather
    weather == "stormy" ? true : false
  end

end
