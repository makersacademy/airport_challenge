require 'weather'

class Airport
  def show_capacity
    @current_capacity
  end

  def safe_to_land?
    if generate_current_weather == "sunny"
      true
    else
      false
    end
  end

  private

  def generate_current_weather
    Weather.new.show_current_weather_condition
  end

end
