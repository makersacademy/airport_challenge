require_relative 'plane'
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
    raise "The airport is full! No more room!" if full?
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def gone?(plane)
    @planes.include?(plane)
  end

  def full?
    if @planes.size == 2
      true
    else
      false
    end
  end
end
