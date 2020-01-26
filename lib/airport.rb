require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize(capacity = 10)
    @capacity = capacity # default airport capacity that can be overridden as appropriate
    @landed_planes = []
    @weather = Weather.new
  end
  
  def land(plane)
    # do not land if capacity >= 10
    raise 'no space here sorry' if nospace?
    # do not land if stormy
    # raise 'no landing in stormy weather' if @weather.stormy? 
    # add plane to airport array
    @landed_planes << plane
    p 'this plane landed yay clap clap'
    p 'planes in our airport now: ' 
    p @landed_planes.size
  end

  def take_off(plane)
    # do not take off if bad weather
    
    # plane take off, remove from airport array
    @landed_planes.pop
    p 'this plane took off, bye'
    p 'planes in our airport now: ' 
    p @landed_planes.size
  end 
     
  def nospace?
    @landed_planes.size >= @capacity
  end

  
end