class Airport

attr_reader :capacity, :planes

def initialize

  @capacity = 9
  @planes = 10

end

  def full?
    return true if @capacity <= @planes
  end
  # 
  # def land(plane)
  #   @planes += 1
  # end

end
