class Airport

  attr_reader :landed_planes


  def initialize(capacity)
    @landed_planes = []
    @capacity = capacity


  end

  def land(plane)
    raise 'Landing denied: airport full' if @landed_planes.count >= @capacity
    @landed_planes << plane

  end

  def landed?(plane)
    if landed_planes.include? plane
      return true
    else
      return false
    end
  end

  def take_off(plane)
    @landed_planes.delete(plane)
  end

  def taken_off?(plane)
     return !@landed_planes.include?(plane)
    # if @landed_planes.include? plane
    #   return false
    # else
    #   return true
    #  end
  end

end
