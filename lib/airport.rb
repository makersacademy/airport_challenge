require_relative 'Plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    expect_plane(plane)
    @planes << plane
  end

  def allow_takeoff(plane)
    raise "That plane does not exist" unless @planes.include?(plane)
    puts "Plane #{plane} has departed"
    @planes.delete(plane)
  end

  def plane_expected?(plane)
    plane == @expected_plane
  end

  def expect_plane(plane)
    @expected_plane = plane
  end

  def on_runway?(plane)
    plane == @on_runway
  end

  def send_to_runway(plane)
    @on_runway = plane
  end


end
