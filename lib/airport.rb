require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane: weather is stormy" if stormy?
    @planes << plane
  end

  def confirm_landed(plane)
    if at_airport?(plane)
      "#{plane} has landed at airport"
    else
      "#{plane} has not landed at airport"
    end
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    raise "Cannot take-off: weather is stormy" if stormy?
    @planes.pop
    @planes
  end

  def confirm_departed(plane)
    if at_airport?(plane)
      "#{plane} has not departed airport"
    else
      "#{plane} has departed airport"
    end
  end

  private

  def stormy?
    Weather.new.stormy?
  end

end