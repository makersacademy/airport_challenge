require './lib/plane'

class Airport

  attr_reader :planes

  def initialize (capacity= 2)
    @planes = []
    @capacity = capacity
    #@weather = "sunny"
  end

  def landing(plane)

    if @planes.include?(plane)
      @planes
      error "plane is aleady landed"
    end

    if stormy? == true || full?
      @planes
    else
      @planes.push(plane)
      puts "plane taken off"
      @planes
    end


  end

  def look_at_planes
    @planes
  end

  def take_off(plane)
    if stormy? == true
      @planes
    else
      @planes.delete(plane)
      puts "plane gone"
      @planes
    end
  end

  def stormy?
    if @weather == "stormy"
      true
    end
  end

  def full?
    if @planes.size >= @capacity
      true
    end
  end

end
