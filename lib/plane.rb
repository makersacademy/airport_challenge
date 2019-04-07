require_relative 'airport'

class Plane
  def land_at(airport, forecast)
    if forecast == "stormy"
      "Landing prevented due to stormy weather"
    elsif airport.hangar.count >= airport.capacity
      "Landing prevented: airport is at full capacity"
    else
      airport.hangar << self
    end
  end
end
