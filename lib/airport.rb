require_relative './plane'

class Airport
  DEFAULT_CAPACITY = 2
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end
  
  attr_accessor :planes, :capacity, :weather


  def land_plane(plane)
    if full?
      raise "Airport is full"
    elsif @weather >= 9
      raise "Weather is too stormy to land"
    else @planes << plane
    end
  end
  
  def take_off(plane)
    @planes.pop
    # @planes.each_with_index do |plane, index| 
     #   if bike.working?
      #    @.delete_at(index)
       #   return bike
    " #{plane} has left the airport"
  end

  def weather
    @weather = rand(1..10)
  end
  


  private
  def full?
    @planes.count == @capacity 
  end


  

end
