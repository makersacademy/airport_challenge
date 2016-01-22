require_relative 'weather.rb'
class Plane

  def land(airport, weather = Weather.new.check_weather)
    if weather == "sunny"
      @landed = true
    else
      @landed = false
    end
  end

  def takeoff(weather = Weather.new.check_weather)
    if weather == "sunny"
      @landed = false
    else
      @landed = true
    end
  end

  def landed?
    @landed
  end

end
