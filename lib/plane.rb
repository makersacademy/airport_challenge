class Plane
  attr_accessor :is_flying, :location
  def initialize(location)
    @is_flying = false
    @location = location
  end

  def take_off
  end

  def land(destination)
    if @is_flying == true
      if @location == destination
        raise RuntimeError.new("The plane is trying to land in the same location")
      end

      @is_flying = false
      @location = destination
      return true
    else
      return false
    end
  end
  end
  