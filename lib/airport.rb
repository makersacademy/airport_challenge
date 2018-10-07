require_relative 'plane'
require 'pry'
class Airport
  attr_reader :stored_planes

  def initialize(weather_generator, stored_planes)
    @stored_planes = stored_planes
    @weather = weather_generator.generate_weather
  end

  def receive_plane(plane)
    @stored_planes << plane unless stormy?
  end

  def release_plane(plane)
    if @stored_planes.include?(plane) == false
      raise "Plane not in airport"
    else
      @stored_planes.delete(plane) unless stormy?
    end
  end

  def stormy?
    @weather == "stormy" ? true : false
  end

end
