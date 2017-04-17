require './lib/weather.rb'

class Airport

  attr_reader :aircraft, :capacity

  def initialize
    @aircraft = []
  end

  def accept_aircraft(plane)
    fail "Cannot land: airport full." if  aircraft.count >= 10
    aircraft << plane
  end

  def release_aircraft
    @aircraft = nil
  end

end
