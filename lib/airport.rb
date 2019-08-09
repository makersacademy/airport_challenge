require 'plane'
class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end
  # def planes
  #   @planes
  # end
  def land(plane)
    @planes.push(plane)
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def gone?(plane)
    @planes.include?(plane)
  end

  def full?
    if @planes.size == 1
      true
    else
      false
    end
  end 
end
