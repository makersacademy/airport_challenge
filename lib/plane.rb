require_relative 'airport'

class Plane
  def land_at(airport, forecast)
    if forecast == "sunny"
      airport.hanger << self
    else
      "Landing prevented due to stormy weather"
    end
  end
end
