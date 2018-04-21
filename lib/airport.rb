class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def plane_lands(plane)
    plane.land
    @planes << plane
  end

  def plane_take_off(plane, weather)
    if weather.condition > 10
      plane.take_off
      @planes.delete(plane)
    else
      raise "Plane cannot take off due to bad weather conditions!"
    end
  end
end
