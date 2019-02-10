class Airport

  def initialize
    @planes = []
  end


  def instruct_to_land(plane)
    @flying = false
    @planes << plane
  end


  def instruct_to_takeoff(plane)
    @flying = true
    @planes.pop
    puts "#{plane} has taken off from airport"
  end
  

end
