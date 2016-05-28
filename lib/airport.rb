require_relative 'plane'
require_relative 'weather'

class Airport


  def initialize
    @capacity = []
    @weather = Weather.new
  end

  def land(plane)
    aircraft_hanger << plane
    "You have landed plane: #{plane}"
  end

  def take_off
    raise "You cannot take off in a storm." if weather.weather_report
    plane_departure
  end


  private

  attr_accessor :capacity, :weather_report
  attr_reader :plane, :weather

  def aircraft_hanger
    capacity
  end

  def plane_departure
    departure = capacity.pop
    "The flight now leaving is: #{departure}"
  end

end
