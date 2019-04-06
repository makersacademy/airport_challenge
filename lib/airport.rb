require_relative 'plane'
require_relative 'weather'

class AirPort

  include WeatherConditions
  attr_reader :landed_plane

  def initialize
    @landed_plane ||= []
  end

  def land(plane)
    @landed_plane.push(plane)
  end

  def take_off(plane)
    puts good_weather?
    raise 'There are currently no planes' if @landed_plane.empty?

    raise 'The weather is stormy' unless good_weather?
    
    delete_plane(plane)
    confirm?(plane)
  end

  private
  def confirm?(plane)
    true unless @landed_plane.include?(plane)
  end

  def delete_plane(plane)
    plane_id = @landed_plane.index(plane)
    @landed_plane.delete_at(plane_id)
  end

  def good_weather?
    airport_weather = WeatherConditions::Weather.new
    airport_weather.good?
  end

end
