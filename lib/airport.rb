class Airport

  attr_reader :airport_code

  def initialize(airport_code)
    @aircraft_present = []
    @airport_code = airport_code
  end

  def aircraft_arriving(plane)
    @aircraft_present << plane
    return true
  end

  def aircraft_departing(ac_reg)
    unless @aircraft_present.find\
    { |aircraft| aircraft.registration == ac_reg }

      return fail "#{ac_reg} not present at #{@airport_code}. Cannot takeoff."

    end

    departing_plane = @aircraft_present.find\
  { |aircraft| aircraft.registration == ac_reg }

    @aircraft_present.delete(departing_plane)

    return departing_plane
  end
end
