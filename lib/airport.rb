require './lib/plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @stormy = 'stormy'
  end

  def landing(plane)
    @planes.push(plane)
    @planes
  end

  def look_at_planes
    @planes
  end

  def take_off(plane)
    @planes.delete(plane)
    puts "plane gone"
    @planes
  end

  def stormy?
    if @stormy == "stormy"
      true
    end
  end
end
