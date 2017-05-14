require './lib/weather'

class Airport

  def initialize(capacity = 20)
    @current_capacity = capacity
  end

  def change_capacity(capacity)
    @current_capacity = capacity
  end

  def show_capacity
    @current_capacity
  end

  def safe_to_land?
    if generate_current_weather == "sunny" && at_capacity? == false
      true
    elsif generate_current_weather == "stormy" || at_capacity? == true
      false
    end
  end

  private

  def generate_current_weather
    Weather.new.show_current_weather_condition
  end

  def at_capacity?
  end

end
