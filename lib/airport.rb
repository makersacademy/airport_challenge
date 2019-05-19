require 'airplane.rb'
require 'weather.rb'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def instruct_take_off(weather)
    weather.stormy? ? raise("Stormy weather, take off denied") : plane = @planes.pop 
    plane.fly
  end

  def instruct_landing(plane)
    plane.land
    @planes << plane
  end

  

end