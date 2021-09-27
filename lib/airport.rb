require_relative 'weather'

class Airport

    def initialize
      @capacity = 5
      @planes = []
    end
  end
  
  def land(plane)
    @plane = plane
    @planes << @plane
    if Weather.stormy? == true
        raise 'can\'t land if stormy'
    else
        puts "the plane can land"
    end
  end
  
  def take_off(plane)
    @plane = plane
    if Weather.stormy? == true
        raise 'can\'t take off if stormy'
    else
        puts "the plane can take off"
    end
  end
  
  def full?
    if @planes.length >= @capacity
      raise "Airport full"
    end
  end