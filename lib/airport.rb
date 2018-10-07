require_relative 'plane.rb'

class Airport

  attr_reader :plane
  def initialize()
    @airport = []
  end

  def take_off
    if empty?
      raise "No planes available"
    else
      @airport[0]
    end
  end

  def land_plane(plane)
    @airport.count
    if full?
      @airport << plane
      "Plane landed"
    else
      @airport
      raise "Airport full"
    end
  end

  private
  def full?
   @airport.count <= 19
 end
  def empty?
   @airport.empty?
 end

end
