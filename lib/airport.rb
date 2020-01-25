require './lib/plane.rb'

class Airport
attr_reader :plane  

  def initialize(capacity = 10)
    @capacity = capacity # default airport capacity that can be overridden as appropriate
  end
  
  def land(plane)
    # add plane to airport
    # capacity =+ 1
    # do not land if capacity >= 10
    # do not land if bad weather
  end

  def take_off(plane)
    # plane take off, remove from airport
    # capacity =- 1
    # do not take off if bad weather
  end 
     
  def weather_good?
    # rand will decide
  end

end