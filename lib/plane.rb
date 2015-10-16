class Plane

  def land airport
    if airport.full
      'Cannot land while airport is full'
    else
      'The plane received the message: LAND'
    end
  end

  def take_off
    'The plane received the message: TAKE OFF'
  end

end