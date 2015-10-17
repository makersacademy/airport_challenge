require_relative 'plane'

class Airport

  def land?
    fail 'The weather is stormy, cannot land.' if stormy
  end

  def take_off?
    fail 'The weather is stormy, cannot take_off.' if stormy
  end

  def stormy
  end
end
