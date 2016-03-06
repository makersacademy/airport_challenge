require_relative '../lib/weather.rb' 


class Airport
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end 
  
  def land(plane)
    raise "Airport is full. Please find another airport to land" if full?
    raise "Weather is stormy so no landing" if stormy
    plane.land
    add_plane(plane)
  end

  def take_off(plane)
    raise "I cannae do it, she cannae handle the weather" if stormy
    raise "error5" unless planes.include? plane
    plane.take_off
    remove_plane(plane)
  end
 
  def remove_plane(plane)
     @planes.delete(plane)
  end
  
  def add_plane(plane)
    @planes << plane
  end

  def stormy
    weather.stormy 
  end 

  def full?
   @planes.size >= @capacity
  end
  

  
attr_reader :planes, :weather, :capacity


end
