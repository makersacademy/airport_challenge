# plane class
require 'airport.rb'
require 'weather.rb'

class Plane
  def initialize
    @airport = nil
  end

  attr_reader :airport
  def land(airport, weather = 'ok')
    raise "Weather is too stormy" if weather == 'stormy'
    airport.plane= self
    @airport = airport
  end

  def confirm_landing(airport)
    if @airport == airport
      return true
    else
      return false
    end
  end

  # def stormy?
  #   weather == 'stormy'
  # end

  def takeoff(airport, weather='ok')
    raise "Weather is too stormy" if weather == 'stormy'
    airport.plane = nil
    @airport = nil
  end

  def confirm_takeoff(airport)
    if @airport == airport && airport.plane == self
      return false
    else
      return true
    end
  end
end
