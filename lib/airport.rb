class Airport
  def initialize
    @planes = []
    @conditions = "clear"
  end
  def land(plane)
    stormy?
    @planes << plane
  end
  def take_off(plane)
    stormy?
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
end
