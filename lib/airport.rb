require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def confirm_landed(plane)
    @planes << plane
  end

  def confirm_take_off
    @planes.pop
  end

end
