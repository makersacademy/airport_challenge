require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def take_off plane
    planes.delete(plane)
    plane
  end

  def landing plane
    planes << plane
  end

  def empty?
    planes.empty?
  end

  private

  attr_reader :planes

end
