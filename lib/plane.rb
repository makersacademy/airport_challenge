require_relative 'weather.rb'
require_relative 'plane.rb'
class Plane

  def land(airport, weather = Weather.new.check_weather)
    if weather == "sunny" && airport.full? == false
      @landed = true
    elsif weather == "stormy"
      @landed = false
      #"Weather is too bad to land"
    else
      @landed = false
      #"The airport is full"
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
