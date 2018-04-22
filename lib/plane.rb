class Plane

  attr_reader :status, :airport_id

  def land(airport_id)
    @status = 'at_airport'
    @airport_id = airport_id
  end

  def takeoff(airport_id)
    raise 'Instructions received from wrong airport' if airport_id != @airport_id
    @status = 'in_flight'
    @airport_id = nil
  end
end
