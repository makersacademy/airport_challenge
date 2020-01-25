require './lib/plane.rb'

class Airport

  def initialize(capacity = 10)
    @capacity = capacity # default airport capacity that can be overridden as appropriate
    @landed_planes = []
  end
   
  def land(plane)
    # do not land if capacity >= 10
    raise 'no space here sorry' if @landed_planes.size >= @capacity
    # do not land if stormy

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
     
end