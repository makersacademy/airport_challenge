require_relative 'Plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    raise "That plane does not exist" unless @planes.include?(plane)
    puts "Plane #{plane} has departed"
    @planes.delete(plane)
  end
end
