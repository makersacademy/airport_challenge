require 'weather'
require 'airplane'

class Airport

  def initialize(capacity = 20)
    @current_capacity = capacity
    @grounded_airplanes = []
  end

  def change_capacity(capacity)
    @current_capacity = capacity
  end

  def show_capacity
    @current_capacity
  end

  def grant_permission_to_land
    @grounded_airplanes << "plane"
  end

  def at_capacity?
    false
  end

  def show_number_of_grounded_planes
    @grounded_airplanes.length
  end

  def safe_to_land?
    if check_current_weather == "sunny" && at_capacity? == false
      true
    else
      false
    end
  end

  private

  def check_current_weather
    Weather.new.show_current_weather_condition
  end

  def contact_approaching_plane
    @approaching_airplane = Airplane.new
  end

end
