require_relative 'plane'

class Airport
  attr_reader :planes, :capacity, :stormy

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
    @stormy = false
  end

  def land_plane(plane)
    if airport_full?
      raise "Airport is full, Plane cannot land."
    else
      if @stormy == true
        raise "Weather is stormy, plane cannot land."
      else
        @planes << plane
        true
      end
    end
  end

  def plane_take_off(plane)
    if @planes.include?(plane)
      if stormy == true
        raise "Weather is stormy, plane cannot take off."
      else
        @planes.delete(plane)
        true
      end
    else
      raise 'That plane is not in the airport.'
    end
  end

  def set_weather_stormy
    @stormy = true
  end

  def set_weather_calm
    @stormy = false
  end

  def change_capacity(new_cap)
    @capacity = new_cap
  end

  private

  def airport_full?
    if @planes.size >= capacity
      true
    else
      false
    end
  end

end
