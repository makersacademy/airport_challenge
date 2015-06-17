require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10 

  attr_reader :weather, :planes, :capacity

  def initialize
    @planes = []
    @weather = rand(10)
    @capacity = DEFAULT_CAPACITY
  end

  def weather_check
    if @weather <= 8
      'sunny'
    else 
      'stormy'
    end
  end

  def land plane
    raise 'Stormy weather. Try later' if weather_check == 'stormy' #WHEN DO WE USE SELF?
    raise 'No capacity at airport' if full?

    plane.flying = false

    planes << plane
  end

  def take_off plane # NOT SURE HOW TO TEST FOR THIS ONE
    fail 'No planes to take off' if @planes.length == 0
    planes.reject!{|specific_plane| specific_plane = plane} #ask about this method
  end

  private

    def full?
      @planes.count == @capacity
    end  
  

end