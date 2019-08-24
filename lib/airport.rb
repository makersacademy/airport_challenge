require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
    @stormy = [true, false].sample
  end

end
