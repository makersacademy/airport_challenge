require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def confirm_landed(plane)
    @planes << plane
  end
end
