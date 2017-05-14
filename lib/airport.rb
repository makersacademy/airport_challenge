require 'weather'
require 'airplane'

class Airport

  def initialize(capacity = 20)
    @current_capacity = capacity
    @grounded_airplanes = []
  end

  def show_status_of_airplanes
  end

  def change_capacity(capacity)
    @current_capacity = capacity
  end

  def show_capacity
    @current_capacity
  end

  def land_airplane
    contact_approaching_plane
    if permission_to_land? == true
      @approaching_airplane.land
      @grounded_airplanes << @approaching_airplane
    end
  end

  def at_capacity?
    false
  end

  def show_number_of_grounded_planes
    @grounded_airplanes.length
  end

  def permission_to_land?
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
