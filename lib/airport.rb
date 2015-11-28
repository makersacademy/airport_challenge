require_relative '../lib/plane.rb'

class Airport

  def land(plane)

  end

  def take_off(plane)
    raise 'cannot take off, weather is stormy' if stormy?

  end

private

  def stormy?
    [:sunny, :overcast, :stormy].shuffle.first
  end
end
