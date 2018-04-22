class Plane

  attr_reader :airport_id

  def land(airport_id)

    raise 'Cannot land while at the airport' unless @airport_id.nil?
    @airport_id = airport_id

  end

  def takeoff(airport_id)

    if airport_id != @airport_id
      raise @airport_id.nil? ? 'Cannot takeoff while in flight' :
                'Instructions received from wrong airport'
    end

    @airport_id = nil
    "Left airport #{airport_id}"

  end

end
