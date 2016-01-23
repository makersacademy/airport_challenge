require_relative 'weather.rb'
require_relative 'airport.rb'
class Plane

  def land(airport, weather = Weather.new.check_weather)
    raise "Already Landed" if @landed
    if weather == "sunny" && airport.full? == false
      airport.planes << self
      @landed = true
    elsif weather == "stormy"
      @landed = false
      #"Weather is too bad to land"
    else
      @landed = false
      #"The airport is full"
    end
  end

  def takeoff(airport, weather = Weather.new.check_weather)
    raise "Not At Airport" unless airport.planes.include?(self)
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
