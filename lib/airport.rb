require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 25

  def initialize
    @planes = []
  end

  attr_reader :plane

  def land
    fail 'planes cannot land' if stormy?
   
  end

  def takeoff
    fail 'planes cannot takeoff' if stormy?
    
  end

  def stormy?
    true
  end



end 