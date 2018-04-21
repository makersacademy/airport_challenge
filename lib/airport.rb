require_relative './plane'

class Airport

attr_reader :planes

def initialize
  @planes = []
end

  def land_plane(plane)
    @planes << plane
  end

  def plane_depart
    fail 'airport is empty' if empty?
      @planes.pop
  end

private

  def empty?
    @planes.empty?
  end

end
