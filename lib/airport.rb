class Airport
  attr_reader :airport_code
  DEFAULT_CAPACITY = 20

  def initialize(airport_code, airport_capacity = DEFAULT_CAPACITY)
    @aircraft_present = []
    @airport_code = airport_code
    @airport_capacity = airport_capacity
  end

  def aircraft_arriving(plane)
    return fail "Airport is full.  Permission to land denied." \
    unless !full?

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

private

  def full?
    if @airport_capacity > @aircraft_present.length
      return false
    else
      return true
    end
  end
