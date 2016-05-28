require_relative 'plane'

class Airport

  attr_reader :plane
  # def planes
  #   @planes = []
  # end

  def land(plane)
    @plane = plane
  end

  def confirm_landed(plane)
    return true if @plane == plane
  end

  def take_off(plane)
    @plane = ""
  end

  def confirm_departed(plane)

  end

end