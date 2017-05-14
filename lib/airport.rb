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

  def at_capacity?
    false
  end

  def show_grounded_planes
    20
  end

  def safe_to_land?
    if generate_current_weather == "sunny" && at_capacity? == false
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
