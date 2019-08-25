require_relative 'plane'

class Airport
  attr_accessor :stormy
  attr_accessor :planes

  def initialize
    @planes = []
    @stormy = [true, false].sample
  end

  def confirm_departure(plane)
    return "#{plane} has failed to depart" if @planes.include?(plane)

    "#{plane} has successfully departed"
  end
end
