class Airport
  attr_reader :planes, :capacity
  def initialize
    @planes = []
    @capacity = 20
  end

  def land(plane)
    fail 'Sorry it is too stormy to land' if weather == "Stormy"
    fail "Sorry you can not land, the Airport is full" if full?
    plane.land
    planes << plane
  end

    def weather
    end

  def take_off plane
    fail 'Sorry it is too stormy to take off' if weather == "Stormy"
    plane.take_off
    planes.delete plane
  end

  def full?
    planes.count == capacity
  end
end
