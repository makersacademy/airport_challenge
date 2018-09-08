require_relative 'plane'

class Airport

  def initialize
    @hanger = []
  end

  def land(plane)
    return "The weather is too bad to land" if bad_weather?
    @hanger << plane
  end

  def takeoff(plane)
    return "The weather is too bad to fly" if bad_weather?
    @hanger.delete(plane)
    plane
  end

  def bad_weather?
    # rand(10).zero?
    true
    # false
  end

  def hanger_full?
    @hanger.count == 0
  end

end
