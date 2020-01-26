require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize(capacity = 10)
    @capacity = capacity # default airport capacity that can be overridden as appropriate
    @landed_planes = []
    @weather = Weather.new
  end
  
  def land(plane)
    fail 'Plane already landed' if plane.landed? # do not land if already grounded
    fail 'no space here sorry' if nospace? # do not land if capacity >= 10
    # do not land if stormy
    # raise 'no landing in stormy weather' if @weather.stormy? 
    @landed_planes << plane # add plane to airport array
    plane.set_landed # set plane to landed state
    p 'this plane landed yay clap clap' # this is for the feature test
    p 'planes in our airport now: ' 
    p @landed_planes.size
  end

  def take_off(plane)
    # do not take off if bad weather
    
    @landed_planes.pop # plane takes off, remove from airport array
    p 'this plane took off, bye'
    p 'planes in our airport now: ' 
    p @landed_planes.size
  end 
     
  def nospace?
    @landed_planes.size >= @capacity
  end

  
end