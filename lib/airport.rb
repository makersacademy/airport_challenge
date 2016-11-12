require_relative "plane"
class Airport
attr_reader :planes
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def landed?(plane)
    if @planes.include? plane; true
    else false
    end
  end
end
