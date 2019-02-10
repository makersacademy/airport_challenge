class Airport

  attr_reader :capacity, :planes

  def initialize(capacity = 1)
    @planes = []
    @conditions = "clear"
    @capacity = capacity
  end

  def land(plane)
    stormy?
    full?
    fail "This plane has already landed" if here?(plane)

    @planes << plane
  end

  def take_off(plane)
    stormy?
    fail "This plane is not in the airport" unless here?(plane)

    out_going_plane = @planes.select { |x| x == plane }.pop
    @planes = @planes.reject { |x| x == plane }
    out_going_plane
  end

  def here?(plane)
    here = false
    p plane
    @planes.each do |x|
      p x
      return true if x == plane

    end
    here
  end

  def weather(conditions)
    @conditions = conditions
  end

  private
  def stormy?
    fail "It is too stormy to land or takeoff" if @conditions == "stormy"
  end

  def full?
    fail "The airport is full" if @planes.count >= @capacity
  end
end
