require_relative 'plane'

class Airport
  def initialize
    @hanger = []
  end

  def land(plane)
    plane  
  end

  def store(plane)
    @hanger << plane
  end

  def take_off(plane)
    @hanger.delete(plane)
    @hanger
  end

end
