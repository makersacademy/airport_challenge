require './lib/weather.rb'

class Airport

  attr_reader :aircraft
  def initialize
    @aircraft = []
  end

  def accept_aircraft(aircraft)
    @aircraft << aircraft
  end

  def release_aircraft
    @aircraft = nil
  end

end
