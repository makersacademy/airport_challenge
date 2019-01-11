require_relative 'plane'

class Airport
  attr_reader :parked_planes

  def initialize
    @parked_planes = []
  end

  def plane_landing(plane)
    @parked_planes << plane
  end

  def plane_takeoff(plane)
    # @parked_planes.delete(plane)
  end

  # def full?
  #   @parked_planes >= 20
  # end
  #
  # def empty?
  #   @parked_planes.empty?
  # end
end
