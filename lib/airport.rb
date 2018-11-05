require_relative 'plane'
require_relative 'weather_system'

class Airport
  attr_reader :hangar, :weather, :capacity
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY, weather = WeatherSystem.new)
    @hangar = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    hangar.push(plane.ground_plane) unless not_valid_land?(plane)
  end

  def take_off(plane)
    hangar.delete(plane.unground_plane) unless not_valid_take_off?(plane)
  end

  def confirm_take_off(plane)
    raise "#{plane} has not taken off!" if hangar.include?(plane)
    "Confirmed: #{plane} has taken off!"
  end

  private

  def weather_check
    weather.weather_output
  end

  def not_valid_take_off?(plane)
    raise 'Plane cannot take off during storm!' if weather_check == 'Stormy'
    raise 'That plane is not at the airport!' unless hangar.include?(plane)
  end

  def not_valid_land?(plane)
    raise 'Plane cannot land during storm!' if weather_check == 'Stormy'
    raise 'Plane has already landed!' if hangar.include?(plane)
    raise 'Plane has already at another airport!' unless plane.in_flight
    raise 'Unable to land when airport full!' if airport_full?
  end

  def airport_full?
    hangar.size >= capacity
  end

end
