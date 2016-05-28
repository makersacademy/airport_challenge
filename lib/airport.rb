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
    return true if @planes[0] == plane
  end

  def take_off(plane)
    @planes.pop
    @planes
  end

  def confirm_departed(plane)

  end

end