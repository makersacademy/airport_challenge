class Airport
  def initialize
    @planes = []
    @conditions = "clear"
  end
  def land(plane)
    fail "The weather is too stormy to land" if @conditions == "stormy"
    @planes << plane
  end
  def take_off(plane)
    fail "The weather is too stormy to take off" if @conditions == "stormy"
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

end
