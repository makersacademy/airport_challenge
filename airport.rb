class Airport
  attr_accessor :landed_planes

  def initialize(capacity)
    @landed_planes = []
    @capacity = capacity
    @number_of_planes_landed = 0
  
  end

  def land(plane)
    if @capacity > @number_of_planes_landed
      @number_of_planes_landed += 1
      @landed_planes << plane
    else
      p "cannot land plane: airport full. "
    end
  end

  def take_off(plane)
    @number_of_planes_landed -= 1
    @landed_planes.delete(plane)
    p "#{plane} has taken off and is no longer in the airport" 
  end


  

end