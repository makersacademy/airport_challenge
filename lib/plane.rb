require_relative 'weather.rb'
require_relative 'airport.rb'
class Plane

attr_reader :landed
include Weather
  def land(airport, weather = check_weather)
    fail "Already Landed" if @landed
    if weather == :sunny && airport.full? == false
      airport.planes << self
      puts "Landed!"
      @landed = true
    elsif weather == :stormy
      puts "Could not land due to bad weather"
      @landed = false
    else
      @landed = false
      puts "The airport is full. Couldn't land"
    end
  end

  def takeoff(airport, weather = check_weather)
    fail "Not At Airport" unless airport.planes.include?(self)
    if weather == :sunny
      puts "The plane takes off!"
      airport.planes.delete(self)
      @landed = false
    else
      puts "Could not take off due to bad weather"
      @landed = true
    end
  end
end
