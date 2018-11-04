require_relative 'plane'
require_relative 'weather'

class Airport
  def is_full?
    true
  end
  def green_light
    fail "Airport is full" if Airport.new.is_full?
  end
end
