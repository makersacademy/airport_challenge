require_relative 'weather.rb'
class Plane

  def land(airport)
    if Weather.new.check_weather == "sunny"
      @landed = true
    else
      @landed = false
    end
  end

  def takeoff
    if Weather.new.check_weather == "sunny"
      @landed = false
    else
      @landed = true
    end
  end

  def landed?
    @landed
  end

end
