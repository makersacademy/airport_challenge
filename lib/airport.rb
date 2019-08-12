require 'plane'
class Airport
  def initialize

    @planes = []
  end

  def land(planes)
    fail 'Airport Full,landing forbiden' if @planes.count >= 2

    @planes.push(planes)
  end

  def takeoff(*)
    raise 'No planes scheduled for departure' if @planes.empty?

    @planes.pop
  end
end
