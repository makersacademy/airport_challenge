class Airport

  attr_reader :aircraft

  def accept_aircraft(aircraft)
    @aircraft = aircraft
  end

  def release_aircraft
    @aircraft = nil
  end

end
