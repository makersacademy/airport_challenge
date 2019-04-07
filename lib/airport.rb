require_relative "weather"

class Airport
  Full_Capacity = 50

  attr_reader = capacity

  def initialize(capacity = Full_Capacity)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land_plane(plane)
    fail "Stormy weather. Unable to fly!" if @weather.stormy?
    fail "Full Airport. Keep flying!" if full?
    fail "Plane is at the airport!" if occupied_space?(plane)
    plane.landed?
    @planes << plane
  end

  def take_off(plane)
    fail "Stormy weather. Unable to fly!" if @weather.stormy?
    fail "There are no planes!" unless occupied_space?(plane)
    plane.taking_off
    @planes.delete(plane)
  end

  private
  #Other useful methods to link everything

    def occupied_space?(plane)
      @planes.include?(plane)
    end

    def full?
      @planes.size >= @capacity
    end

end
