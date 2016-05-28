require_relative 'plane'

class Airport

  attr_reader :plane

  def planes
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def confirm_landed(plane)
   return true if @planes.include?(plane)
  end

  def take_off(plane)
    @planes.pop
    @planes
  end

  def confirm_departed(plane)
    return true if !planes.include?(plane)
  end

end