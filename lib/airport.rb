require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    "plane landed"
  end

  def takeoff(plane)
    "plane took off!"
  end

  
end
