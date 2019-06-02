#require 'plane'
#require 'weather_report'

class Airport

  attr_accessor :capacity
  attr_accessor :ground_control


  def initialize(capacity = 10)
    @capacity = capacity
    @ground_control = []
  end

  def ground_control_call
    @ground_control.count
  end

  def tower_permission_to_land(plane)
    if permission_to_land_granted?
      @ground_control << plane
      plane.update
    else
      p "Request denied"
    end
  end

  def tower_permission_to_takeoff
    if permission_to_takeoff_granted?
      @ground_control.pop
    else
      p "Request denied"
    end
  end

  private

  def permission_to_land_granted?
    return true if @ground_control.count < @capacity
  end

  def permission_to_takeoff_granted?
    if weather_good?
      return true if @ground_control.count > 0 && ground_control.count >= @capacity
    else
      return false
    end
  end

  def weather_good?
    weather = WeatherReport.new
    return true if weather.forecast != "stormy"
  end

end
