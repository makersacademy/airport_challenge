class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    if planes.include? plane
      raise "Plane has already landed"
    end
    plane.status=("At airport")
    planes << plane
  end

  def take_off
    raise "No planes available" if planes.empty?
    planes.last.status=("In air")
    planes.pop
  end
end
