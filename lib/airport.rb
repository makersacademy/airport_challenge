require_relative 'plane'

class Airport

  attr_accessor :planes, :stormy
  def initialize
    @planes = []
    @stormy = [false, false, true, false, false].shuffle
  end

end
