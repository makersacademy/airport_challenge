require 'weather'
require 'airplane'

class Airport

  def initialize(capacity = 20)
    @current_capacity = capacity
    @airplanes = []
  end

  def show_status_of_airplanes
  end

  def change_capacity(capacity)
    @current_capacity = capacity
  end

  def show_capacity
    @current_capacity
  end

  def allow_airplane_to_land
    contact_approaching_plane
    fail "Permission to land denied" if permission_to_land? == false
    @approaching_airplane.land
    @airplanes << { airplane: @approaching_airplane,
      current_status: @approaching_airplane.check_current_status }
  end

  def at_capacity?
    false
  end

  def show_number_of_grounded_planes
    @airplanes.count { |airplane| airplane[:current_status] == "grounded" }
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
