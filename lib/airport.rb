require './lib/plane'

class Airport
  
  def land(plane)
    @plane = plane
  end

  def take_off(plane)
    @plane = nil
    "#{plane} has departed the airport"
  end

end
