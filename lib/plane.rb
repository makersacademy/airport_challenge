class Plane
  attr_accessor :location, :flying

  def initialize(location)
    @location = location
    @flying = false
  end

  def confirmation
    @location = "Left #{@location}"
    @flying = true
  end

  def takeoff
    if !flying
      confirmation
    else
      false
    end
  end

  def land
    if @flying
      @flying = false
      return true
    end
    false
  end
end
