require_relative './weather'

class Plane

  def initialize
    @weather = Weather.new
  end

  def land
    true
  end

  def take_off
    true
  end
end