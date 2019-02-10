class Airport
  def initialize( capacity = 1)
    @planes = []
    @conditions = "clear"
    @capacity = capacity
  end
  def land(plane)
    stormy?
    full?
    fail "This plane has already landed" if is_here?(plane)
    @planes << plane
  end
  def take_off(plane)
    stormy?
    fail "This plane is not in the airport" if !is_here?(plane)
    out_going_plane = @planes.select { |x| x == plane }.pop
    @planes = @planes.select { |x| x != plane }
    out_going_plane
  end
  def is_here?(plane)
    here = false
    @planes.each do |x|
      if x == plane then here = true else here = false end
    end
    here
  end
  def weather(conditions)
    @conditions = conditions
  end
  private def stormy?
    fail "It is too stormy to land or takeoff" if @conditions == "stormy"
  end
  private def full?
    fail "The airport is full" if @planes.count >= @capacity
  end

  attr_reader :capacity
end
