require_relative "planes"

class Airport

  attr_accessor :terminal

  def initialize
    @terminal = []
  end

  def receives_plane(plane)
    @terminal << plane if plane.at_airport?
  end

  def releases_plane
    @terminal.pop if @terminal[0].at_airport? == false
    @terminal
  end

end
