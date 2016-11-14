require_relative "plane"

class Weather

  def prevents_takeoff
  raise 'Cannot take off due to stormy weather' if stormy?
  end

  def prevents_landing
  raise 'Cannot land due to stormy weather' if stormy?
  end

private

  def stormy?
    rand(1..6) > 4
  end

end
