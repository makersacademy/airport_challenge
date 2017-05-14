require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def authorize_landing(plane)
    @planes << plane
  end

  def authorize_take_off(plane)
    raise 'No planes currently available' if planes.empty?
    @planes.delete(plane)
  end

end
