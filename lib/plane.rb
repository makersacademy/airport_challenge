require_relative 'weather'
require_relative 'airport'

class Plane

  def land
    fail "There's a storm" if Weather.new.is_stormy?
  end

  def take_off
    fail "There's a storm" if Weather.new.is_stormy?
  end

end
