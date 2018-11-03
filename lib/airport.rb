require_relative 'plane'
require_relative 'weather_system'

class Airport
  attr_reader :hangar, :weather
  def initialize
    @hangar = []
    @weather = WeatherSystem.new
  end

  def land_at_airport(plane)
    @hangar << plane unless not_safe_to_land?(plane)
  end

  def take_off_from_airport(plane)
    raise 'Plane cannot take off during storm!' if there_is_a_storm?
    @hangar.delete(plane) unless not_valid_take_off?(plane)
  end

  def confirm_take_off(plane)
    raise "#{plane} has not taken off!" if @hangar.include?(plane)
    "Confirmed: #{plane} has taken off!"
  end

  def weather_check
    weather.weather_output
  end

  private

  def not_valid_take_off?(plane)
    raise 'There are no planes left at this airport!' if @hangar.empty?
    raise 'That plane is not at the airport!' unless @hangar.include?(plane)
  end

  def there_is_a_storm?
    weather_conditions = weather_check
    weather_conditions == 'Stormy'
  end

  def not_safe_to_land?(plane)
    raise 'Plane cannot land during storm!' if there_is_a_storm?
    raise 'That plane has already landed!' if @hangar.include?(plane)
  end

end
