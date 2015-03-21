require 'weather'

class Plane
  include Weather

  def land
    fail 'Weather Stormy' if stormy?
    true
  end

  def take_off
    true
  end
end
