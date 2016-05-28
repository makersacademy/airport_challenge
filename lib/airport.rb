require_relative "planes"

class Airport

  attr_accessor :terminal

  def initialize
    @terminal = []
  end

  def plane_arrival(plane)
    @terminal << plane if plane.at_airport?
  end

  def plane_departure
    @terminal.pop if @terminal[0].at_airport? == false
    @terminal
  end

end
