require './plane'

class Airport
  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def landing plane
    if !full?()
      if plane_exists?(plane)
        raise "Plane already landed!"
      end
      if rainy_weather?()
        raise "Planes cannot land on rainy weather!"
      else
        @planes << plane
      end
    else
      raise "The airport is full!"
    end
  end

  def plane_exists? plane
    @planes.each do |landed_plane|
      if landed_plane.object_id == plane.object_id
        return true
      end
    end
    return false
  end

  def rainy_weather?
    random = rand(2)
    if random == 0
      return false
    elsif random == 1
      return true
    end
  end

  def empty?
    if @planes.length == 0
      return true
    elsif @planes.length > 0
      return false
    end
  end

  def full?
    if @planes.length < @capacity
      return false
    else
      return true
    end
  end

  def take_off
    if !empty?()
      if rainy_weather?()
        raise "Planes cannot take off on rainy weather!"
      else
        @planes.pop()
      end
    else
      raise "There are no planes in the airport!"
    end
  end

end
