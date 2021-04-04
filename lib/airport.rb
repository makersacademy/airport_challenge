require_relative 'plane'

class Airport 
  attr_reader :planes

  def initialize 
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end

  def no_longer_in_airport(plane)
    if @planes.include?(plane)
      return "The plane is in the airport"
    else 
      return "The plane is no longer in the airport"
    end
  end

end
