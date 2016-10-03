class Airport

  attr_reader :planes
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = 4
  end

  def land(plane)
    fail 'Sorry this plane has already landed' if @planes.include? plane
    fail 'Sorry the airport is full' if full?
    #fail 'Stormy weather, can\'t land' if stormy?
    plane.status = true
    @planes << plane
  end

  def take_off(plane)
    fail 'Sorry no planes to take off' if empty?
    fail 'This plane is not at the airport' unless @planes.include? plane
    plane.status = false
    @planes.delete(plane)
  end

  def check(plane)
    if @planes.include? plane
      true
    else
      false
    end
  end

  def empty?
    @planes.length == 0
  end

  def full?
    @planes.length >= @capacity
  end
end
