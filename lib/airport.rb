require_relative 'plane'

class Airport
   
  attr_accessor :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY )
    @capacity = capacity
    @hangar = []
    @weather = ['cloudy', 'sunny', 'rainy', 'cloudy', 'sunny', 'rainy', 'stormy']
  end

  def land(plane)
    fail 'Airport is full' if full?
    @hangar << plane
    @plane = plane
  end

  def take_off(plane) 
    fail 'Don\'t take off - bad weather' if weather == 'stormy'
    @hangar.pop 
    @plane = plane
  end
  
  
  def weather
    @weather.sample
  end

  private

 attr_reader :hangar

  def full?
    @hangar.length >= @capacity
  end

end