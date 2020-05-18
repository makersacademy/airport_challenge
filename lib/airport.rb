require_relative 'plane'

class Airport

  def initialize(capacity = 50)
    @planes = []
    @capacity = capacity

  end

  def stormy
    [1, 2, 3, 4, 5].sample
  end

  def land(plane)
    if @planes.include?(plane)
      fail "This plane is already at the airport"
    end
    unless @planes.length < @capacity
      fail "The airport is full, wait please"  
    end 

    @planes << plane
  end

  def take_off(plane)
    if @planes.include?(plane) && stormy < 4
      @planes -= [plane] 
    elsif stormy == 5 
      fail "Let's wait for the sunshine!"
    else fail "already gone"
    end
  end
end
