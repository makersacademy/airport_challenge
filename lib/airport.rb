class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :hangar, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport hangar is full" if @hangar.count >= @capacity
    @hangar << plane
  end
    
  def take_off(plane)
    @hangar.delete(plane)
    puts "#{plane} has taken off and is no longer in the airport."
  end
end