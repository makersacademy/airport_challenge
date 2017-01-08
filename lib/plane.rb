require_relative 'airport'
require_relative 'weather'

class Plane

  def land(airport)
    raise "Unable to land as the weather is stormy" unless safe?
    "#{self} has taken off successfully"
    airport::planes << self

  end

  def take_off(airport)
    raise "Unable to fly as weather is stormy" unless safe?
      "#{self} has taken off successfully"
      airport::planes.shift
  end

  private

  def safe?
    Weather.stormy?
  end

end
