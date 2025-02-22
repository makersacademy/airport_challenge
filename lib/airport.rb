class Airport

  def initialize(capacity = 5)
    @capacity = capacity
    @landed_planes = []
  end
  attr_accessor  :landed_planes, :capacity

  def full?
    if @landed_planes.length == @capacity
      fail "The airport is full"
    end
  end

  def stormy?
    if Weather.new
      puts "It's stormy. You can not land or take off."
      return true
    else 
      return false
    end
  end
  
end