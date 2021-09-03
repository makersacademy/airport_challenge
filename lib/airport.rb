class Airport
  attr_accessor :landed_planes, :default_capacity

  def initialize(default_capacity: 25)
    @landed_planes = []
    @default_capacity = default_capacity
    @number_of_planes_landed = 0
  
  end

  def land(plane)
    if stormy?
      p "plane cannot land: weather is stormy"
    elsif
      @default_capacity > @number_of_planes_landed
      @number_of_planes_landed += 1
      @landed_planes << plane
    else
      p "plane cannot land: airport full. "
    end
  end

  def take_off(plane)
    if stormy?
      p "plane cannot takeoff: weather is stormy"
    else
      @number_of_planes_landed -= 1
      @landed_planes.delete(plane)
      p "#{plane} has taken off and is no longer in the airport" 
    end
  end

  def change_capacity(new_capacity)
    @default_capacity = new_capacity
  end

  def stormy?
    rand(1..6) > 4 #if rand is greater than 4 it returns true

  end



  

end