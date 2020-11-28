require './lib/plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes.push(plane)
  end

  def take_off
    fail 'No planes left!' if @planes.empty?

    @planes.pop()
  end

end
