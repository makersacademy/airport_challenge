require_relative 'weather'

class Airport

  include WEATHER

  def land(arrival)
    arrival
  end

end
