require_relative 'Plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    expect_plane(plane)
    plane.land(self)
    @planes << plane
  end

  def takeoff(plane)
    raise "That plane does not exist" unless @planes.include?(plane)
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




end
