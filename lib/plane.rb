require './lib/airport.rb'
require './lib/weather.rb'

class Plane
  attr_reader :fly

  def initialize
    @fly = true
  end
  
  def land
    @fly = false
  end

  def take_off
    @fly = true
  end

end
