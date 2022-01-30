require "plane"
require "weather" 

class Airport 

  attr_reader :plane 
  attr_accessor :stormy, :capacity  

  DEFAULT_CAPACITY = 15 

  def initialize(capacity = DEFAULT_CAPACITY) 
    @plane = [] 
    @capacity = capacity 
    @weather = forecast.stormy 
    forecast = Weather.new  
  end 

  def landing(_plane)
    fail "This airport is full" if full? 
    fail "The weather is stormy, plane cannot land" if stormy 
    @plane << plane
  end 

  def take_off(_plane)
    fail "The weather is stormy, you cannot take off" if stormy 
  end

  def full?
    @plane.count >= capacity 
  end 

end
