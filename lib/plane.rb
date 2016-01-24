require './lib/airport.rb'
require './lib/weather.rb'

class Plane

  def initialize
    @fly = true
  end


  def flying?
    @fly
  end

  
  def land
    @fly = false
  end

  def take_off
    @fly = true
  end

end
