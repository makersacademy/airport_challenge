class Airport
  attr_accessor :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
    return if @planes.empty? raise 'No planes present'
  end

  private
  def empty?
    @planes.size.zero?
  end
end

class Plane
end
