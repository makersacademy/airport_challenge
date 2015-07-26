require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 5
  
  attr_accessor :capacity 
  
  def initialize(capacity= DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = "Sunny"
  end
  
  def weather
    @weather
  end

  def take_off plane
    raise "There are no planes at #{self.class.name}" if empty?
    raise "Weather is stormy. You may not take off from #{self.class.name}" if weather == "Stormy"
    @planes.delete (plane)
    plane.take_off
  end
  
  def land plane
    raise "#{self.class.name} is full" if full?
    raise "Weather is stormy. You may not land at #{self.class.name}" if weather == "Stormy"
    @planes << plane
    plane.land
  end
  
  def random_weather(skies=rand(7))
    if skies == 3
      @weather = 'Stormy'
    else
      @weather = 'Sunny'
    end
  end
  
  private
  
  attr_accessor :planes
  
  def full?
    planes.count >= capacity
  end
  
  def empty?
    planes.count == 0
  end   
  
end

