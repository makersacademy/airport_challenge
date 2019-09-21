class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Sorry, airport is full" if @hangar.length == @capacity

    @hangar << plane
  end

  def take_off(plane)

    @hangar.delete(plane)
  
  end

end


  
