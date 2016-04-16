class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def accept plane
    raise "Plane is still flying!" if plane.flying?
    @planes << plane
  end
end