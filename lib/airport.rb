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
    raise "The airport is full! No more room!" if full?
    @planes.push(plane)

  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def gone?(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.size == 2
  end

end
