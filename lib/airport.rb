class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def take_off
    if planes.empty?
      raise "No planes available"
    end
    planes.pop
  end
end
