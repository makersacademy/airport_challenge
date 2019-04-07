require_relative 'plane'
require_relative 'weather'

class AirPort

  include WeatherConditions
  attr_reader :plane

  def initialize(capacity)
    @plane ||= []
    @capacity = capacity
  end

  def land(plane)
    raise 'Sorry: can not land plane due to stormy weather' if bad_weather?

    raise 'Sorry: can not land plane, airport is full.' if full?
    @plane.push(plane)
  end

  def take_off(plane)
    raise 'The weather is stormy' if bad_weather?
    
    delete_plane(plane)
    confirm?(plane)
  end

  private
  def confirm?(plane)
    true unless @plane.include?(plane)
  end

  def delete_plane(plane)
    plane_id = @plane.index(plane)
    @plane.delete_at(plane_id)
  end

  def bad_weather?
    airport_weather = WeatherConditions::Weather.new
    airport_weather.bad?
  end

  def full?
    @plane.size >= @capacity
  end
end
