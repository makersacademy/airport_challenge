require './lib/plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @weather = "stormy"
  end

  def landing(plane)
    if stormy? == true
      @planes
    else
      @planes.push(plane)
      @planes
    end
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
    if @weather == "stormy"
      true
    end
  end

end
