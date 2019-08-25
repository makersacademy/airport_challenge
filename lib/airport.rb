require_relative 'plane'

class Airport
  attr_accessor :stormy
  attr_accessor :planes

  def initialize
    @planes = []
    @stormy = [true, false, false, false].sample
  end

  def confirm_departure(plane)
    return "#{plane} has failed to depart" if plane.parcked_in?(self)

    "#{plane} has successfully departed"
  end
end
