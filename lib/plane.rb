class Plane
  attr_reader :destination
  def initialize(destination)
    @destination = destination
    status = grounded
  end
end
