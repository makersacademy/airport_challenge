require './lib/plane.rb'

class Airport

  def initialize
    @planes = []
  end

  def release_plane
    fail "No planes here to fly!" if empty?
    planes.pop
  end

  def accept_plane(plane)
    planes << plane
  end



  private

  attr_reader :planes

  def empty?
    planes.empty?
  end

end
