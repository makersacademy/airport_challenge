class Airport

  DEFAULT_CAPACITY = 25
  attr_reader :capacity, :grounded_planes

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @grounded_planes = []
  end

  def land(plane)
      fail "Airport is full. Unable to land." if full?
      @grounded_planes << plane
      "Bing bong: Landed safe and sound!"
  end

  def full?
    @grounded_planes.count == @capacity
  end

  def take_off(plane)
    if empty?
      "There are no grounded planes at the airport."
    else
    @grounded_planes.pop
    "This is your captain speaking, we are off into the sky!"
    end
  end

  def empty?
    @grounded_planes.count <= 0
  end

end
