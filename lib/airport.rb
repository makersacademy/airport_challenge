require_relative 'Plane'

class Airport

  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "This airport is full" if full?
    expect_plane(plane)
    plane.land(self)
    @planes << plane
  end

  def takeoff(plane)
    raise "That plane is not at this airport" unless @planes.include?(plane)
    send_to_runway(plane)
    plane.takeoff
    @planes.delete(plane)
  end

  def send_to_runway(plane)
    @on_runway = plane
  end

  def expect_plane(plane)
    @expected_plane = plane
  end

private

  def plane_expected?(plane)
    plane == @expected_plane
  end

  def on_runway?(plane)
    plane == @on_runway
  end

  def full?
    @planes.length >= @capacity
  end


end
