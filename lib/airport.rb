require_relative 'plane'

class Airport

  def initialize
    @runway = []
  end

  def land
    @runway << "plane"
  end

end
