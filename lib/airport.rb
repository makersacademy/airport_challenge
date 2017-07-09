require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize( weather = Weather.new )
    @weather = weather
    @planes = []
  end

  def land_plane(plane)
    fail 'This plane has already landed' if plane.status == :landed
    @planes << plane
    plane.landed
    puts "#{plane} has landed"
  end

  def take_off(plane)
    fail 'This plane is already flying' if plane.status == :flying
    fail 'Error cannot fly in stormy weather' if weather.weather_report == :stormy
    @planes.delete(plane)
    plane.flying
    puts "#{plane} has taken off"
  end
end
