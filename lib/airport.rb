require_relative 'plane.rb'

class Airport

  attr_reader :plane
  def initialize()
    @airport = []
  end

  def take_off
    if @airport.empty?
      raise "No planes available"
    else
      @airport[0]
    end
  end

  def land_plane(plane)
    @airport.count
    if @airport.count <= 19
      @airport << plane
      "Plane landed"
    else
      @airport
      raise "Airport full"
    end
  end

end
