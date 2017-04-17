require_relative 'airport'
require_relative 'weather'

class Plane
w = Weather.new
  def land(airport)
    true unless w.stormy?
  end

  def takeoff(airport)
    true unless w.stormy?
  end

end
