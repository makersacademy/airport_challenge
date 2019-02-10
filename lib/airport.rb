class Airport

  def initialize
    @planes = []
  end


  def instruct_to_land(plane)
    raise "Plane already landed" if @planes.include?(plane)
    @planes << plane
  end


  def instruct_to_takeoff(plane)
    raise "Plane already took off" unless @planes.include?(plane)
    @planes.pop
  end


end
