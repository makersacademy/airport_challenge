class Airport
  attr_accessor :capacity, :hangar
  DEFAULT_CAPACITY = 10

  def initialize (capacity=DEFAULT_CAPACITY)
  @hangar = [] #empty airport array
  @capacity = capacity #capacity is default unless otherwise stated
  end

  def land(plane)
    fail "The hangar is full." if full? #fail if full
    @hangar << plane #lands planes by putting them in array
  end

  def takeoff(plane)
    fail "The hangar is empty." if @hangar.length == 0 #fail if empty
    fail "Plane not in hangar" unless @hangar.include?(plane)
    @hangar.pop #takes off by removing plane from array
  end

  def full?
    @hangar.length >= @capacity #hangar full if hit capacity
  end

end
