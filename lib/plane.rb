require_relative 'weather.rb'
require_relative 'airport.rb'
class Plane
attr_reader :landed

  def land(airport, weather = Weather.new.check_weather)
    fail "Already Landed" if @landed
    if weather == "sunny" && airport.full? == false
      airport.planes << self
      @landed = true
    elsif weather == "stormy"
      puts "Could not land due to bad weather"
      @landed = false
    else
      @landed = false
      puts "The airport is full. Couldn't land"
    end
  end

  def takeoff(airport, weather = Weather.new.check_weather)
    fail "Not At Airport" unless airport.planes.include?(self)
    if weather == "sunny"
      @landed = false
    else
      puts "Could not take off due to bad weather"
      @landed = true
    end
  end
end
